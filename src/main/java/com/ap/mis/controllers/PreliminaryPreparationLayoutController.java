package com.ap.mis.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
@RequestMapping(path = "/preliminaryPreparationLayout")
public class PreliminaryPreparationLayoutController {
	private static final Logger log = Logger.getLogger(PreliminaryPreparationLayoutController.class);

	@Autowired
	MISService MISService;

	@Autowired
	AttachmentService attachmentService;

	@Autowired
	FileUploadConstraintsUtil fileUploadConstraint;
	
	@Autowired ConsultantInfoService constInfoService;
	
	@Autowired
	GeotechnicalInvestigationService geotechnicalInvestigation;
	
	@Autowired
	LandSurveyDetailService landSurveyDetailsService;

	@GetMapping(path = { "/create", "/edit", "/view" })
	public String createPreliminaryPreparationLayout(Model model, HttpSession session) {

		int workId = (int) session.getAttribute("workIdSession");
		log.info("Land survey details for given Work id " + workId);
		EnumFilter workModuleStatus = EnumFilter.PRELIMINARY_PREPARATION_LAYOUT;
		Works work = MISService.getWorkInfo(workId);

		List<Attachements> attachments = attachmentService.getAttachementsDetails(workId, workModuleStatus.getStatus());
		ConsultantInfo consltInfo = constInfoService.getConsultDetails(workId);
		model.addAttribute("consltInfo",consltInfo);
		model.addAttribute("consultantInfoObject",consltInfo);
		model.addAttribute("work", work);
		model.addAttribute("workLineItems", work.getWorkLineItemsList().get(0));
		model.addAttribute("preliminaryPreparationLayoutAttachmentFiles", attachments);
		model.addAttribute("moduleName", workModuleStatus.getStatus());
		model.addAttribute("fileUploadConstraint", fileUploadConstraint);
		model.addAttribute("FILE_UPLOAD_PENDING", EnumFilter.OPEN.getStatus());
		model.addAttribute("FILE_UPLOAD_APPROVED", EnumFilter.ATTACHMENT_APPROVED.getStatus());
		model.addAttribute("FILE_UPLOAD_REJECTED", EnumFilter.ATTACHMENT_REJECTED.getStatus());
		model.addAttribute("workObject", work);
		LandSurveyDetails existedLandSurveyDetails = landSurveyDetailsService.findByWork(work);
		model.addAttribute("landSurvey",existedLandSurveyDetails);
		GeotechnicalInvestigation geotechnicalInvestigationDetails = geotechnicalInvestigation.findByWork(work);
		model.addAttribute("investigation",geotechnicalInvestigationDetails);
		
		return "online-mis-preliminary-preparation-layout";
	}

	@PostMapping(path = { "/save" })
	public String savePreliminaryPreparationLayout(Model model, HttpSession session) {

		int workId = (int) session.getAttribute("workIdSession");
		Works work = MISService.getWorkInfo(workId);
		if (work.getStatus().equals(EnumWorkStatus.LAND_SURVEY_DETAILS.getStatus())) {
			work.setStatus(EnumWorkStatus.PRELIMINARY_PREPARATION_LAYOUT_DETAILS.getStatus());
			MISService.updateWork(work);
		}
		
		return "online-mis-preliminary-preparation-layout";
	}

}
