package com.ap.mis.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.ap.mis.entity.GeotechnicalInvestigation;
import com.ap.mis.entity.LandDetails;
import com.ap.mis.entity.LandSurveyDetails;
import com.ap.mis.entity.TechnicalSanction;
import com.ap.mis.entity.TenderingProcess;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.service.AdministrativeSectionService;
import com.ap.mis.service.AttachmentService;
import com.ap.mis.service.ConsultantInfoService;
import com.ap.mis.service.GeotechnicalInvestigationService;
import com.ap.mis.service.LandDetailService;
import com.ap.mis.service.LandSurveyDetailService;
import com.ap.mis.service.LineDepartmentService;
import com.ap.mis.service.MISService;
import com.ap.mis.service.TechnicalSanctionService;
import com.ap.mis.service.TenderingProcessService;
import com.ap.mis.util.ContextUtil;
import com.ap.mis.util.EnumFilter;
import com.ap.mis.util.EnumWorkStatus;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping("/technicalSanction")
public class TechnicalSanctionController {

	@Autowired
	MISService misService;

	@Autowired
	TechnicalSanctionService techSanction;

	@Autowired
	TenderingProcessService tenderingProcessService;
	
	@Autowired
	LineDepartmentService lineDepartmentService;
	
	@Autowired
	AttachmentService attachService;
	
	@Autowired
	AdministrativeSectionService admService;
	
	@Autowired
	LandDetailService landDetailService;
	
	@Autowired
	ConsultantInfoService consultantInfoService;
	
	@Autowired
	AttachmentService attachmentService;
	
	@Autowired
	LandSurveyDetailService landSurveyDetailsService;
	
	@Autowired
	GeotechnicalInvestigationService geotechnicalInvestigation;

	@PostMapping(value = "/save")
	public String technicalSanctionSave(@ModelAttribute TechnicalSanction techsanc, Model model,
			HttpServletRequest request, HttpSession session) {

		/*
		 * if (session.getAttribute("loggedInUserObj") == null) {
		 * model.addAttribute("sessionTimeout", "sessionTimeout"); return
		 * "online-admin"; }
		 */

		boolean isTechnicalSanctionNotExisted = techsanc.getId() == null;
		techSanction.saveTechSanction(techsanc);
		if (isTechnicalSanctionNotExisted) {
			Works work = misService.getWorkInfo(techsanc.getWork().getId());
			work.setWorkStatus(EnumWorkStatus.TECHNICAL_SANCTION_COMPLETED.getStatus());
			work.setStatus(EnumWorkStatus.TECHNICAL_SANCTION_COMPLETED.getStatus());
			misService.updateWork(work);
		}

		return "redirect:/adminloggedin";

		/*
		 * boolean isSave = false; int workId = (int)
		 * session.getAttribute("workIdSession"); // techsanc.setWorkId(workId); //
		 * techSanction.saveTechSanction(techsanc); if (techsanc.getId() == null) {
		 * techSanction.saveTechSanction(techsanc); isSave = true; }
		 * 
		 * else { techSanction.updateTechSanction(techsanc); // checking...
		 * TenderProcess is created or not TenderingProcess tenderProcess =
		 * tenderingProcessService.getTenderDetails(workId); if (tenderProcess == null)
		 * { isSave = true; } }
		 * 
		 * Works workInfo = misService.getWorkInfo(workId);
		 * model.addAttribute("workInfo", workInfo);
		 * model.addAttribute("authoritiesTypeList",
		 * tenderingProcessService.getAuthoritiesList());
		 * model.addAttribute("agencyList", tenderingProcessService.getAgencyList());
		 * 
		 * if (isSave == true) { return "redirect:/tenderProcess/create"; } else {
		 * return "redirect:/tenderProcess/edit/" + workId; }
		 */

	}

	@GetMapping(value = "/create")
	public String create(String workId, Model model, HttpServletRequest request, HttpSession session) {
		Works workInfo = misService.getWorkInfo(Integer.parseInt(workId));
		TechnicalSanction techSancksn = new TechnicalSanction();
		techSancksn.setWork(workInfo);
		/*
		 * userObject = SecurityUtil.getLoggedUser(); userObject =
		 * misService.verifyUser(userObject);
		 */

		/*
		 * session.getAttribute("workInfo"); session.setAttribute("loggedInUserObj",
		 * userObject);
		 */
		// int workid = (int) session.getAttribute("workIdSession");
		
		AdministrativeSection adminInfo = admService.getAdminDetails(Integer.parseInt(workId));
        List<Attachements> adminattachements=attachService.getAttachementsDetails(Integer.parseInt(workId),EnumFilter.ADMIN.getStatus());
        Map<String, String> adminFile = new HashMap<String, String>();
		for(Attachements adminattachDetails :adminattachements) {
			if (adminattachDetails.getPath() != null && !adminattachDetails.getPath().equals("")) {
				String adminattachmentPath=ContextUtil.populateContext(request) + adminattachDetails.getPath();
				String fileNameVal=adminattachDetails.getPath().substring(adminattachDetails.getPath().lastIndexOf('\\') + 1);
				adminFile.put(fileNameVal, adminattachmentPath);
				model.addAttribute("adminFile",adminFile);
				
			} else {
				model.addAttribute("filePath", null);
			}
		}
		model.addAttribute("adminInfo",adminInfo);
		LandDetails landInfo = landDetailService.getLandDetails(Integer.parseInt(workId));
		Map<String, String> landFile = new HashMap<String, String>();
		List<Attachements> landattachements=attachService.getAttachementsDetails(Integer.parseInt(workId),EnumFilter.LANDDETAILS.getStatus());
		for(Attachements landattachDetails :landattachements) {
			if (landattachDetails.getPath() != null && !landattachDetails.getPath().equals("")) {
				String landattachmentPath=ContextUtil.populateContext(request) + landattachDetails.getPath();
				String fileNameVal=landattachDetails.getPath().substring(landattachDetails.getPath().lastIndexOf('\\') + 1);
				landFile.put(fileNameVal, landattachmentPath);
				model.addAttribute("landFile",landFile);
				
			} else {
				model.addAttribute("landfilePath", null);
			}
		}
		model.addAttribute("landInfo",landInfo);
		
		DepartmentLinkingLine deptInfo = lineDepartmentService.getdepartDetails(Integer.parseInt(workId));
		model.addAttribute("deptInfo",deptInfo);
		
		ConsultantInfo consltInfo = consultantInfoService.getConsultDetails(Integer.parseInt(workId));
		model.addAttribute("consultantInfoObject",consltInfo);
		model.addAttribute("consltInfo",consltInfo);

		model.addAttribute("techsanc", techSancksn);
		model.addAttribute("workInfo", workInfo);
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));
		
		List<Attachements> landAttachmentFiles = attachmentService.getAttachementsDetails(Integer.parseInt(workId),
				EnumFilter.LANDDETAILS.getStatus());
		List<Attachements> landSurveyAttachmentFiles = attachmentService.getAttachementsDetails(Integer.parseInt(workId),
				EnumFilter.LAND_SURVEY_DETAILS.getStatus());
		List<Attachements> PPLayoutAttachmentFiles = attachmentService.getAttachementsDetails(Integer.parseInt(workId),
				EnumFilter.PRELIMINARY_PREPARATION_LAYOUT.getStatus());
		List<Attachements> GIAttachmentFiles = attachmentService.getAttachementsDetails(Integer.parseInt(workId),
				EnumFilter.GEOTECHNICAL_INVESTIGATION.getStatus());
		
		model.addAttribute("landAttachmentFiles",landAttachmentFiles);
		model.addAttribute("landSurveyAttachmentFiles",landSurveyAttachmentFiles);
		model.addAttribute("PPLayoutAttachmentFiles",PPLayoutAttachmentFiles);
		model.addAttribute("GIAttachmentFiles",GIAttachmentFiles);
		
		LandSurveyDetails landSurveyDetails = landSurveyDetailsService.findByWork(workInfo);
		model.addAttribute("landSurveyDetails",landSurveyDetails);
		
		GeotechnicalInvestigation investigation = geotechnicalInvestigation.findByWork(workInfo);
		model.addAttribute("investigation",investigation);

		return "online-mis-technical-sanction";
	}

	@GetMapping(value = "/view")
	public String view(Model model, String workId) {
		TechnicalSanction techInfo = techSanction.getTechDetails(Integer.parseInt(workId));
		Works workInfo = misService.getWorkInfo(techInfo.getWork().getId());
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));
		model.addAttribute("techInfo", techInfo);
		TenderingProcess tenderInfo = tenderingProcessService.getTenderDetails(Integer.parseInt(workId));
		model.addAttribute("tenderInfo", tenderInfo);
		return "online-mis-techSanctionView";
	}

	@GetMapping(value = "/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id, HttpServletRequest request) {
		HttpSession session = request.getSession();
		TechnicalSanction techInfo = techSanction.getTechDetails(id);
		session.getAttribute("workInfo");
		Works workInfo = misService.getWorkInfo(techInfo.getWork().getId());
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));
		model.addAttribute("techsanc", techInfo);
		return "online-mis-technical-sanction";
	}

}
