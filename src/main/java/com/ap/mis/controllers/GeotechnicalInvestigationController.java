package com.ap.mis.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ap.mis.entity.Attachements;
import com.ap.mis.entity.ConsultantInfo;
import com.ap.mis.entity.GeotechnicalInvestigation;
import com.ap.mis.entity.LandSurveyDetails;
import com.ap.mis.entity.Works;
import com.ap.mis.service.AttachmentService;
import com.ap.mis.service.ConsultantInfoService;
import com.ap.mis.service.GeotechnicalInvestigationService;
import com.ap.mis.service.LandSurveyDetailService;
import com.ap.mis.service.MISService;
import com.ap.mis.util.EnumFilter;
import com.ap.mis.util.EnumWorkStatus;
import com.ap.mis.util.FileUploadConstraintsUtil;

@Controller
@RequestMapping(path = "/geotechnicalInvestigation")
public class GeotechnicalInvestigationController {

	private static final Logger log = Logger.getLogger(GeotechnicalInvestigationController.class);
	@Autowired
	MISService MISService;

	@Autowired
	GeotechnicalInvestigationService geotechnicalInvestigation;
	
	@Autowired
	LandSurveyDetailService landSurveyDetailsService;

	@Autowired
	AttachmentService attachmentService;

	@Autowired
	FileUploadConstraintsUtil fileUploadConstraint;
	
	@Autowired ConsultantInfoService constInfoService;

	@GetMapping(path = { "/create", "/edit", "/view" })
	public String getGeotechnicalInvestigation(Model model, HttpSession session, HttpServletRequest request) {
		boolean disableWriteControllers = false;

		// Check for current route is for view

		disableWriteControllers = request.getRequestURL().toString().endsWith("/view");

		log.info("request url " + request.getRequestURL().toString());

		int workId = (int) session.getAttribute("workIdSession");
		log.info("geotechnical investigation work details for given Work id " + workId);
		EnumFilter workModuleStatus = EnumFilter.GEOTECHNICAL_INVESTIGATION;
		Works work = MISService.getWorkInfo(workId);

		List<Attachements> attachments = attachmentService.getAttachementsDetails(workId, workModuleStatus.getStatus());

		ConsultantInfo consltInfo = constInfoService.getConsultDetails(workId);
		model.addAttribute("consultantInfoObject",consltInfo);
		model.addAttribute("consltInfo",consltInfo);
		LandSurveyDetails existedLandSurveyDetails = landSurveyDetailsService.findByWork(work);
		model.addAttribute("landSurvey",existedLandSurveyDetails);
		
		GeotechnicalInvestigation geotechnicalInvestigationDetails = geotechnicalInvestigation.findByWork(work);

		if (geotechnicalInvestigationDetails == null) {
			geotechnicalInvestigationDetails = new GeotechnicalInvestigation();
			geotechnicalInvestigationDetails.setWork(work);
		}
		// If this work is already approved or in pending then we doesn't allow
		// modification
		if (!disableWriteControllers)
			disableWriteControllers = work.getWorkStatus()
					.equalsIgnoreCase(EnumWorkStatus.PENDING_SAAP_APPROVAL.getStatus())
					|| work.getWorkStatus().equalsIgnoreCase(EnumWorkStatus.SAAP_APPROVED.getStatus());
		model.addAttribute("workObject",work);
		model.addAttribute("investigation",geotechnicalInvestigationDetails);
		model.addAttribute("workLineItems", work.getWorkLineItemsList().get(0));
		model.addAttribute("geotehnicalInvestigationLayoutAttachmentFiles", attachments);
		model.addAttribute("moduleName", workModuleStatus.getStatus());
		model.addAttribute("geotechnicalInvestigationDetails", geotechnicalInvestigationDetails);
		model.addAttribute("disableWriteControllers", disableWriteControllers);
		model.addAttribute("fileUploadConstraint", fileUploadConstraint);
		model.addAttribute("FILE_UPLOAD_PENDING", EnumFilter.OPEN.getStatus());
		model.addAttribute("FILE_UPLOAD_APPROVED", EnumFilter.ATTACHMENT_APPROVED.getStatus());
		model.addAttribute("FILE_UPLOAD_REJECTED", EnumFilter.ATTACHMENT_REJECTED.getStatus());
		return "online-mis-geotechnical-investigation";
	}

	@PostMapping(path = "/save")
	public String saveGeotechnicalInvestigation(
			@ModelAttribute GeotechnicalInvestigation geotechnicalInvestigationDetails, Model model,
			HttpSession session) {

		boolean isGeotechnicalInvestigationNotExist = geotechnicalInvestigationDetails.getId() == null;

		geotechnicalInvestigationDetails = geotechnicalInvestigation.save(geotechnicalInvestigationDetails);

		if (isGeotechnicalInvestigationNotExist) {
			Works work = MISService.getWorkInfo(geotechnicalInvestigationDetails.getWork().getId());
			work.setStatus(EnumWorkStatus.GEOTECHNICAL_INVESTIGATION.getStatus());
			MISService.updateWork(work);
		}

		// geotechnicalInvestigation

		return "redirect:/preliminaryDrawings/view";

	}
}
