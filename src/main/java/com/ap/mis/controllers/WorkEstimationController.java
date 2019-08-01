package com.ap.mis.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.Attachements;
import com.ap.mis.entity.ConsultantInfo;
import com.ap.mis.entity.DepartmentLinkingLine;
import com.ap.mis.entity.LandDetails;
import com.ap.mis.entity.User;
import com.ap.mis.entity.WorkEstimations;
import com.ap.mis.entity.Works;
import com.ap.mis.service.AdministrativeSectionService;
import com.ap.mis.service.AttachmentService;
import com.ap.mis.service.ConsultantInfoService;
import com.ap.mis.service.LandDetailService;
import com.ap.mis.service.LineDepartmentService;
import com.ap.mis.service.MISService;
import com.ap.mis.service.WorkEstimationService;
import com.ap.mis.util.ContextUtil;
import com.ap.mis.util.EnumFilter;
import com.ap.mis.util.EnumWorkStatus;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping(path = "work/{workId}/estimation")
public class WorkEstimationController {

	@Autowired
	WorkEstimationService workEstimationService;

	@Autowired
	MISService misService;

	@Autowired
	AdministrativeSectionService admService;

	@Autowired
	LandDetailService landDetailService;

	@Autowired
	LineDepartmentService lineDepartmentService;

	@Autowired
	AttachmentService attachService;

	@Autowired
	ConsultantInfoService consultantInfoService;

	@GetMapping(path = { "/create", "/edit" })
	public String loadWorkEstimation(Model model, HttpServletRequest request,
			@PathVariable(value = "workId", required = true) Integer workId) {

		/* Work Details */
		Works workInfo = misService.getWorkInfo(workId);
		model.addAttribute("workInfo", workInfo);
		/* Administrative Sanction Details */

		AdministrativeSection adminInfo = admService.getAdminDetails(workId);
		List<Attachements> adminattachements = attachService.getAttachementsDetails(workId,
				EnumFilter.ADMIN.getStatus());
		Map<String, String> adminFile = new HashMap<String, String>();
		for (Attachements adminattachDetails : adminattachements) {
			if (adminattachDetails.getPath() != null && !adminattachDetails.getPath().equals("")) {
				String adminattachmentPath = ContextUtil.populateContext(request) + adminattachDetails.getPath();
				String fileNameVal = adminattachDetails.getPath()
						.substring(adminattachDetails.getPath().lastIndexOf('\\') + 1);
				adminFile.put(fileNameVal, adminattachmentPath);
				model.addAttribute("adminFile", adminFile);

			} else {
				model.addAttribute("filePath", null);
			}
		}
		model.addAttribute("adminInfo", adminInfo);
		LandDetails landInfo = landDetailService.getLandDetails(workId);
		Map<String, String> landFile = new HashMap<String, String>();
		List<Attachements> landattachements = attachService.getAttachementsDetails(workId,
				EnumFilter.LANDDETAILS.getStatus());
		for (Attachements landattachDetails : landattachements) {
			if (landattachDetails.getPath() != null && !landattachDetails.getPath().equals("")) {
				String landattachmentPath = ContextUtil.populateContext(request) + landattachDetails.getPath();
				String fileNameVal = landattachDetails.getPath()
						.substring(landattachDetails.getPath().lastIndexOf('\\') + 1);
				landFile.put(fileNameVal, landattachmentPath);
				model.addAttribute("landFile", landFile);

			} else {
				model.addAttribute("landfilePath", null);
			}
		}
		model.addAttribute("landInfo", landInfo);

		DepartmentLinkingLine deptInfo = lineDepartmentService.getdepartDetails(workId);
		model.addAttribute("deptInfo", deptInfo);

		User loggedInUser = SecurityUtil.getLoggedUser();
		model.addAttribute("userRole", loggedInUser.getRole().getRoleName());

		WorkEstimations workEstimation = workEstimationService.getWorkEstimationByWork(workInfo);
		if (workEstimation == null) {
			workEstimation = new WorkEstimations();
			workEstimation.setWork(workInfo);
		}
		model.addAttribute("workEstimation", workEstimation);

		return "online-mis-work-estimations";

	}

	@PostMapping(path = { "/save" })
	public String saveWorkEstimation(@ModelAttribute WorkEstimations workEstimation,
			@PathVariable(value = "workId", required = true) Integer workId) {

		boolean isWorkEstimationNotExist = workEstimation.getId() == null;

		Works work = misService.getWorkInfo(workId);
		
		
		
		workEstimationService.save(workEstimation);

		if (isWorkEstimationNotExist) {			
			work.setWorkStatus(EnumWorkStatus.WORK_ESTIMATION_COMPLETED.getStatus());
			work.setStatus(EnumWorkStatus.WORK_ESTIMATION_COMPLETED.getStatus());
			misService.updateWork(work);
		}

		return "redirect:/adminloggedin";
	}

}
