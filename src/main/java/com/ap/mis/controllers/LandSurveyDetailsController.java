package com.ap.mis.controllers;

import java.util.List;

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
import com.ap.mis.util.FileUploadConstraintsUtil;

@Controller
@RequestMapping(path = "/landSurveyDetails")
public class LandSurveyDetailsController {

	private static final Logger log = Logger.getLogger(LandSurveyDetailsController.class);

	@Autowired
	MISService MISService;

	@Autowired
	LandDetailService landDetailsService;

	@Autowired
	AttachmentService attachmentService;

	@Autowired
	LandSurveyDetailService landSurveyDetailsService;

	@Autowired
	FileUploadConstraintsUtil fileUploadConstraint;
	
	@Autowired ConsultantInfoService constInfoService;
	
	@Autowired
	GeotechnicalInvestigationService geotechnicalInvestigationService;

	@GetMapping(path = { "/create/{id}", "/edit/{id}" })
	public String createLandSurveyDetails(Model model, HttpSession session,@PathVariable("id") Integer workId) {
    if(workId==null) {
		workId = (int) session.getAttribute("workIdSession");
    }
		log.info("Land survey details for given Work id " + workId);
		LandSurveyDetails newLandSurvey = new LandSurveyDetails();

		// load Survey land details
		Works work = MISService.getWorkInfo(workId);
		
		//check consultant info
		ConsultantInfo consltInfo = constInfoService.getConsultDetails(workId);
		model.addAttribute("consultantInfoObject",consltInfo);
		
		LandSurveyDetails existedLandSurveyDetails = landSurveyDetailsService.findByWork(work);
		model.addAttribute("landSurvey",existedLandSurveyDetails);
		if (existedLandSurveyDetails != null) {
			newLandSurvey = existedLandSurveyDetails;
		}

		LandDetails landDetails = landDetailsService.getLandDetails(workId);
		List<Attachements> landAttachments = attachmentService.getAttachementsDetails(workId,
				EnumFilter.LANDDETAILS.getStatus());
		List<Attachements> landSurveyAttachments = attachmentService.getAttachementsDetails(workId,
				EnumFilter.LAND_SURVEY_DETAILS.getStatus());

		newLandSurvey.setWork(work);
		newLandSurvey.setLandDetails(landDetails);

		model.addAttribute("landSurveyDetails", newLandSurvey);
		model.addAttribute("landAttachmentFiles", landAttachments);
		model.addAttribute("landSurveyAttachmentFiles", landSurveyAttachments);
		model.addAttribute("workLineItems", work.getWorkLineItemsList().get(0));
		model.addAttribute("moduleName", EnumFilter.LAND_SURVEY_DETAILS.getStatus());
		model.addAttribute("fileUploadConstraint", fileUploadConstraint);
		model.addAttribute("FILE_UPLOAD_PENDING", EnumFilter.OPEN.getStatus());
		model.addAttribute("FILE_UPLOAD_APPROVED", EnumFilter.ATTACHMENT_APPROVED.getStatus());
		model.addAttribute("FILE_UPLOAD_REJECTED", EnumFilter.ATTACHMENT_REJECTED.getStatus());
		model.addAttribute("workObject", work);
		model.addAttribute("consltInfo",consltInfo);
		
		GeotechnicalInvestigation geotechnicalInvestigation = geotechnicalInvestigationService.findByWork(work);
		model.addAttribute("investigation", geotechnicalInvestigation);
		
		return "online-mis-land-survey-details";
	}

	/*
	 * @GetMapping(path = "/edit/{surveyId}") public String
	 * editLandSurveyDetails(@PathVariable(name = "surveyId") int surveyId, Model
	 * model) {
	 * 
	 * LandSurveyDetails existedLandSurveyDetails =
	 * landSurveyDetailsService.findById(surveyId);
	 * 
	 * Works work =
	 * MISService.getWorkInfo(existedLandSurveyDetails.getWork().getId());
	 * LandDetails landDetails =
	 * landDetailsService.getLandDetails(existedLandSurveyDetails.getWork().getId())
	 * ; List<Attachements> attachments = attachmentService
	 * .getAttachementsDetails(existedLandSurveyDetails.getWork().getId(),
	 * EnumFilter.LANDDETAILS.getStatus());
	 * 
	 * existedLandSurveyDetails.setWork(work);
	 * existedLandSurveyDetails.setLandDetails(landDetails);
	 * 
	 * model.addAttribute("landSurveyDetails", existedLandSurveyDetails);
	 * model.addAttribute("landAttachmentFiles", attachments);
	 * model.addAttribute("workLineItems", work.getWorkLineItemsList().get(0));
	 * 
	 * return "online-mis-land-survey-details"; }
	 */
	@PostMapping(path = "/save")
	public String saveLandSurveyDetails(@ModelAttribute LandSurveyDetails landSurveyDetails, Model model) {

		boolean isNewLandSurveyDetails = landSurveyDetails.getId() == null;
		int workId=landSurveyDetails.getWork().getId();

		landSurveyDetailsService.save(landSurveyDetails);
		
		if (!isNewLandSurveyDetails) {
			return "redirect:/preliminaryPreparationLayout/edit/"+workId;
		}
		
		Works work = MISService.getWorkInfo(landSurveyDetails.getWork().getId());
		work.setStatus(EnumWorkStatus.LAND_SURVEY_DETAILS.getStatus());
		MISService.updateWork(work);

		return "redirect:/preliminaryPreparationLayout/create/"+workId;

	}

	@GetMapping(path = "/view/{surveyId}")
	public String getExistedLandSureveyDetails(@PathVariable(name = "surveyId") int surveyId, Model model) {
		LandSurveyDetails existedLandSurveyDetails = landSurveyDetailsService.findById(surveyId);

		Works work = MISService.getWorkInfo(existedLandSurveyDetails.getWork().getId());
		LandDetails landDetails = landDetailsService.getLandDetails(existedLandSurveyDetails.getWork().getId());
		List<Attachements> attachments = attachmentService
				.getAttachementsDetails(existedLandSurveyDetails.getWork().getId(), EnumFilter.LANDDETAILS.getStatus());

		existedLandSurveyDetails.setWork(work);
		existedLandSurveyDetails.setLandDetails(landDetails);

		model.addAttribute("landSurveyDetails", existedLandSurveyDetails);
		model.addAttribute("landAttachmentFiles", attachments);
		model.addAttribute("workLineItems", work.getWorkLineItemsList().get(0));
		model.addAttribute("maxFileSize", 0L);

		return "online-mis-land-survey-details-view";
	}

}
