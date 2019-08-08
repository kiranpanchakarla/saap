package com.ap.mis.controllers;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
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
import com.ap.mis.entity.WorkHistory;
import com.ap.mis.entity.Works;
import com.ap.mis.service.AdministrativeSectionService;
import com.ap.mis.service.AttachmentService;
import com.ap.mis.service.ConstituencyService;
import com.ap.mis.service.ConsultantInfoService;
import com.ap.mis.service.DistrictService;
import com.ap.mis.service.LandDetailService;
import com.ap.mis.service.LineDepartmentService;
import com.ap.mis.service.MISService;
import com.ap.mis.service.MandalService;
import com.ap.mis.service.VillageService;
import com.ap.mis.service.WorkHistroyService;
import com.ap.mis.util.ContextUtil;
import com.ap.mis.util.EnumFilter;
import com.ap.mis.util.EnumWorkStatus;
import com.ap.mis.util.FileUploadConstraintsUtil;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping("/landDetails")
public class LandDetailsController {
	private static final Logger log = Logger.getLogger(ContextUtil.class);
	@Autowired
	MISService misService;
	@Autowired
	DistrictService districtsService;
	@Autowired
	ConstituencyService constituencyService;
	@Autowired
	MandalService mandalService;
	@Autowired
	VillageService villageService;
	@Autowired
	AdministrativeSectionService administrativeSectionService;
	@Autowired
	LandDetailService landDetailService;
	@Autowired
	LineDepartmentService lineDepartmentService;
	@Autowired
	ConsultantInfoService consultantInfoService;
	@Autowired
	AttachmentService attachService;
	@Autowired
	FileUploadConstraintsUtil fileUploadConstraint;
	@Autowired
	WorkHistroyService workHistroyService;

	@PostMapping(value = "/save/{workId}")
	public String landDetailsSave(@ModelAttribute LandDetails landDetails, Model model, HttpServletRequest request,
			HttpSession session,@PathVariable("workId") Integer workid) {

		boolean isSave = false;
		User loggedInUser = SecurityUtil.getLoggedUser();
		landDetails.setUser(loggedInUser);
		if(workid==null) {
			workid = (int) session.getAttribute("workIdSession");
			}
		/*
		 * WorktoLandDetails obj = new WorktoLandDetails(); obj = (WorktoLandDetails)
		 * session.getAttribute("generalInfo"); obj.setLandDetails(landDetails);
		 * session.setAttribute("generalInfo", obj);
		 */
		session.setAttribute("landDetails", landDetails);
		Works workInfo = misService.getWorkInfo(workid);

		WorkHistory workHistory = new WorkHistory();
		workHistory.setActionPerform(
				landDetails.getId() == null ? EnumFilter.SAVED.getStatus() : EnumFilter.UPDATED.getStatus());
		workHistory.setModule(EnumFilter.ADMINISTRATOR.getStatus());
		workHistory.setSubModule(EnumWorkStatus.LAND.getStatus());
		workHistory.setCreatedDate(new Date());
		workHistory.setUser(loggedInUser);
		workHistory.setWork(workInfo);
		workHistroyService.saveWorks(workHistory);
		if (landDetails.getId() == null) {
			landDetailService.landDetailsSave(landDetails);
			workInfo.setStatus(EnumWorkStatus.LAND.getStatus());
			workInfo.setWorkStatus(EnumWorkStatus.LAND.getStatus());
			misService.updateWork(workInfo);
			isSave = true;
		} else {
			landDetailService.landDetailsUpdate(landDetails);
		}

		if (isSave == true) {
			/*
			 * model.addAttribute("workInfo",workInfo); model.addAttribute("workLineItems",
			 * workInfo.getWorkLineItemsList().get(0));
			 * 
			 * AdministrativeSection adminInfo =
			 * administrativeSectionService.getAdminDetails(landDetails.getWork().getId());
			 * model.addAttribute("adminInfo",adminInfo);
			 * 
			 * DepartmentLinkingLine deptInfo =
			 * lineDepartmentService.getdepartDetails(landDetails.getWork().getId());
			 * model.addAttribute("deptInfo",deptInfo);
			 * 
			 * model.addAttribute("landinfo",landDetails);
			 * 
			 * List<Attachements>
			 * adminattachements=attachService.getAttachementsDetails(landDetails.getWork().
			 * getId(),EnumFilter.ADMIN.getStatus()); List<Attachements>
			 * landattachements=attachService.getAttachementsDetails(landDetails.getWork().
			 * getId(),EnumFilter.LANDDETAILS.getStatus());
			 * 
			 * Map<String, String> adminFile = new HashMap<String, String>();
			 * for(Attachements adminattachDetails :adminattachements) { if
			 * (adminattachDetails.getPath() != null &&
			 * !adminattachDetails.getPath().equals("") &&
			 * adminattachDetails.getIsActive().equals(true)) { String
			 * adminattachmentPath=ContextUtil.populateContext(request) +
			 * adminattachDetails.getPath(); String
			 * fileNameVal=adminattachDetails.getPath().substring(adminattachDetails.getPath
			 * ().lastIndexOf('\\') + 1);
			 * log.info("==attachmentPath==:"+adminattachmentPath);
			 * adminFile.put(fileNameVal, adminattachmentPath);
			 * model.addAttribute("adminFile",adminFile); } else {
			 * model.addAttribute("filePath", null); } } Map<String, String> landFile = new
			 * HashMap<String, String>(); for(Attachements landattachDetails
			 * :landattachements) { if (landattachDetails.getPath() != null &&
			 * !landattachDetails.getPath().equals("") &&
			 * landattachDetails.getIsActive().equals(true)) { String
			 * landattachmentPath=ContextUtil.populateContext(request) +
			 * landattachDetails.getPath(); String
			 * fileNameVal=landattachDetails.getPath().substring(landattachDetails.getPath()
			 * .lastIndexOf('\\') + 1);
			 * log.info("==landattachmentPath==:"+landattachmentPath);
			 * landFile.put(fileNameVal, landattachmentPath);
			 * model.addAttribute("landFile",landFile);
			 * 
			 * } else { model.addAttribute("landfilePath", null); } }
			 * 
			 * model.addAttribute("userRole", loggedInUser.getRole().getRoleName());
			 */
			// checking... ConsultantInfo is created or not
			ConsultantInfo consultantInfo = consultantInfoService.getConsultDetails(landDetails.getWork().getId());
			if (consultantInfo == null) {
				isSave = true;
			}
			return "redirect:/landDetails/generalInfo";
			/*return "redirect:generalInfo";*/
		} else {
			return "redirect:/adminloggedin";
		}

	}

	@GetMapping(value = "/generalInfo")
	public String generalInformation(Model model, HttpSession session, HttpServletRequest request) {

		LandDetails obj = (LandDetails) session.getAttribute("landDetails");
		Works workInfo = misService.getWorkInfo(obj.getWork().getId());
		model.addAttribute("workInfo", workInfo);
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));

		AdministrativeSection adminInfo = administrativeSectionService.getAdminDetails(obj.getWork().getId());
		model.addAttribute("adminInfo", adminInfo);

		DepartmentLinkingLine deptInfo = lineDepartmentService.getdepartDetails(obj.getWork().getId());
		model.addAttribute("deptInfo", deptInfo);

		LandDetails landInfo = landDetailService.getLandDetails(obj.getWork().getId());
		model.addAttribute("landinfo", landInfo);

		List<Attachements> adminattachements = attachService.getAttachementsDetails(obj.getWork().getId(),
				EnumFilter.ADMIN.getStatus());
		List<Attachements> landattachements = attachService.getAttachementsDetails(obj.getWork().getId(),
				EnumFilter.LANDDETAILS.getStatus());

		Map<String, String> adminFile = new HashMap<String, String>();
		for (Attachements adminattachDetails : adminattachements) {
			if (adminattachDetails.getPath() != null && !adminattachDetails.getPath().equals("")
					&& adminattachDetails.getIsActive().equals(true)) {
				String adminattachmentPath = ContextUtil.populateContext(request) + adminattachDetails.getPath();
				String fileNameVal = adminattachDetails.getPath()
						.substring(adminattachDetails.getPath().lastIndexOf('\\') + 1);
				log.info("==attachmentPath==:" + adminattachmentPath);
				adminFile.put(fileNameVal, adminattachmentPath);
				model.addAttribute("adminFile", adminFile);
			} else {
				model.addAttribute("filePath", null);
			}
		}
		Map<String, String> landFile = new HashMap<String, String>();
		for (Attachements landattachDetails : landattachements) {
			if (landattachDetails.getPath() != null && !landattachDetails.getPath().equals("")
					&& landattachDetails.getIsActive().equals(true)) {
				String landattachmentPath = ContextUtil.populateContext(request) + landattachDetails.getPath();
				String fileNameVal = landattachDetails.getPath()
						.substring(landattachDetails.getPath().lastIndexOf('\\') + 1);
				log.info("==landattachmentPath==:" + landattachmentPath);
				landFile.put(fileNameVal, landattachmentPath);
				model.addAttribute("landFile", landFile);

			} else {
				model.addAttribute("landfilePath", null);
			}
		}

		return "online-mis-general-information";

	}

	@GetMapping(value = "/create/{workId}")
	public String create(@ModelAttribute User userObject, Model model, HttpServletRequest request,@PathVariable("workId") Integer workid) {
		HttpSession session = request.getSession();
		userObject = SecurityUtil.getLoggedUser();
		userObject = misService.verifyUser(userObject);
		if(workid==null) {
		 workid = (int) session.getAttribute("workIdSession");
		}
		Works workInfo = misService.getWorkInfo(workid);
		EnumFilter workModuleStatus = EnumFilter.LANDDETAILS;
		model.addAttribute("moduleName", workModuleStatus.getStatus());
		model.addAttribute("fileUploadConstraint", fileUploadConstraint);
		model.addAttribute("workObject", workInfo);
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));
		model.addAttribute("landDetails", new LandDetails());
		session.setAttribute("loggedInUserObj", userObject);
		session.getAttribute("workInfo");
		model.addAttribute("LandTypeList", landDetailService.getLandTypeList());
		return "online-mis-land-details";
	}

	@GetMapping(value = "/view")
	public String view(Model model, String workId, HttpServletRequest request) {
		LandDetails landInfo = landDetailService.getLandDetails(Integer.parseInt(workId));
		List<Attachements> attachements = attachService.getAttachementsDetails(Integer.parseInt(workId),
				EnumFilter.LANDDETAILS.getStatus());
		Map<String, String> attachFile = new HashMap<String, String>();
		for (Attachements attachDetails : attachements) {
			if (attachDetails.getPath() != null && !attachDetails.getPath().equals("")) {
				String attachmentPath = ContextUtil.populateContext(request) + attachDetails.getPath();
				String attachmentFileName = attachDetails.getPath()
						.substring(attachDetails.getPath().lastIndexOf('\\') + 1);
				attachFile.put(attachmentPath, attachmentFileName);
			}
		}
		model.addAttribute("filePath", attachFile);
		Works workInfo = misService.getWorkInfo(landInfo.getWork().getId());
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));
		model.addAttribute("landInfo", landInfo);
		ConsultantInfo consultInfo = consultantInfoService.getConsultDetails(Integer.parseInt(workId));
		model.addAttribute("consultInfo", consultInfo);
		return "online-mis-landDetailsView";
	}

	@GetMapping(value = "/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id, HttpServletRequest request, HttpSession session) {
		LandDetails landInfo = landDetailService.getLandDetails(id);
		log.info("===landInfo===:" + landInfo);
		int workId = landInfo.getWork().getId();
		session.setAttribute("workIdSession", workId);
		EnumFilter workModuleStatus = EnumFilter.LANDDETAILS;
		model.addAttribute("moduleName", workModuleStatus.getStatus());
		model.addAttribute("workObject", landInfo.getWork());
		model.addAttribute("landDetails", landInfo);
		model.addAttribute("LandTypeList", landDetailService.getLandTypeList());
		model.addAttribute("workObject", landInfo.getWork());
		Works workInfo = misService.getWorkInfo(landInfo.getWork().getId());
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));

		List<Attachements> attachments = attachService.getAttachementsDetails(id, EnumFilter.LANDDETAILS.getStatus());
		model.addAttribute("landAttachmentFiles", attachments);
		model.addAttribute("fileUploadConstraint", fileUploadConstraint);
		/*
		 * List<String> filePath = new ArrayList<String>();
		 * log.info("===attachements===:"+attachments); for(Attachements attachDetails
		 * :attachments) { if (attachDetails.getPath() != null &&
		 * !attachDetails.getPath().equals("")) { String
		 * attachmentPath=ContextUtil.populateContext(request) +
		 * attachDetails.getPath(); log.info("==attachmentPath==:"+attachmentPath);
		 * filePath.add(attachmentPath); model.addAttribute("filePath",filePath);
		 * 
		 * } else { model.addAttribute("filePath", null); } }
		 */

		/*
		 * WorktoLandDetails obj = new WorktoLandDetails(); obj.setWorks(workInfo);
		 * session.setAttribute("generalInfo", obj);
		 */

		return "online-mis-land-details";

	}

}
