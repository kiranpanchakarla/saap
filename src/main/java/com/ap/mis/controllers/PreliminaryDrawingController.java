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
import com.ap.mis.entity.LandDetails;
import com.ap.mis.entity.LandSurveyDetails;
import com.ap.mis.entity.Works;
import com.ap.mis.service.AttachmentService;
import com.ap.mis.service.ConsultantInfoService;
import com.ap.mis.service.GeotechnicalInvestigationService;
import com.ap.mis.service.LandDetailService;
import com.ap.mis.service.LandSurveyDetailService;
import com.ap.mis.service.MISService;
import com.ap.mis.util.EnumFilter;
import com.ap.mis.util.EnumWorkStatus;

@Controller
@RequestMapping(path = "/preliminaryDrawings")
public class PreliminaryDrawingController {

	private static final Logger log = Logger.getLogger(PreliminaryDrawingController.class);

	@Autowired
	AttachmentService attachmentService;

	@Autowired
	MISService misService;

	@Autowired
	ConsultantInfoService consultantService;

	@Autowired
	LandSurveyDetailService landSurveyDetailsService;

	@Autowired
	LandDetailService LandDetailService;

	@Autowired
	GeotechnicalInvestigationService geotechnicalInvestigationService;

	@GetMapping(path = "/view")
	public String getPreliminaryDrawings(Model model, HttpSession session) {

		int workId = (int) session.getAttribute("workIdSession");
		log.info("PreliminaryDrawing details for given Work id " + workId);

		Works work = misService.getWorkInfo(workId);
		ConsultantInfo consultant = consultantService.getConsultDetails(workId);
		LandDetails landDetail = LandDetailService.getLandDetails(workId);
		LandSurveyDetails landSurveyDetails = landSurveyDetailsService.findByWork(work);
		landSurveyDetails.setLandDetails(landDetail);

		GeotechnicalInvestigation geotechnicalInvestigation = geotechnicalInvestigationService.findByWork(work);

		List<Attachements> landAttachmentFiles = attachmentService.getAttachementsDetails(workId,
				EnumFilter.LANDDETAILS.getStatus());
		List<Attachements> landSurveyAttachmentFiles = attachmentService.getAttachementsDetails(workId,
				EnumFilter.LAND_SURVEY_DETAILS.getStatus());
		List<Attachements> PPLayoutAttachmentFiles = attachmentService.getAttachementsDetails(workId,
				EnumFilter.PRELIMINARY_PREPARATION_LAYOUT.getStatus());
		List<Attachements> GIAttachmentFiles = attachmentService.getAttachementsDetails(workId,
				EnumFilter.GEOTECHNICAL_INVESTIGATION.getStatus());

		model.addAttribute("work", work);
		model.addAttribute("consultant", consultant);
		model.addAttribute("workLineItems", work.getWorkLineItemsList().get(0));
		model.addAttribute("landSurveyDetails", landSurveyDetails);
		model.addAttribute("geotechnicalInvestigation", geotechnicalInvestigation);

		model.addAttribute("landAttachmentFiles", landAttachmentFiles);
		model.addAttribute("landSurveyAttachmentFiles", landSurveyAttachmentFiles);
		model.addAttribute("PPLayoutAttachmentFiles", PPLayoutAttachmentFiles);
		model.addAttribute("GIAttachmentFiles", GIAttachmentFiles);
		model.addAttribute("SAAP_APPROVED_STATUS", EnumWorkStatus.SAAP_APPROVED.getStatus());

		return "online-mis-preliminary-drawings";
	}

	@PostMapping(path = "/sendforApproval")
	public String sendForApproval(HttpSession session) {
		int workId = (int) session.getAttribute("workIdSession");
		log.info("PreliminaryDrawing details send for approval of given Work id " + workId);

		Works work = misService.getWorkInfo(workId);
		work.setWorkStatus(EnumWorkStatus.PENDING_SAAP_APPROVAL.getStatus());
		misService.updateWork(work);

		return "redirect:/adminloggedin";
	}
}
