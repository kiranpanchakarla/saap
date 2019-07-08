package com.ap.mis.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ap.mis.entity.Attachements;
import com.ap.mis.entity.LandDetails;
import com.ap.mis.entity.LandSurveyDetails;
import com.ap.mis.entity.Works;
import com.ap.mis.service.AttachmentService;
import com.ap.mis.service.LandDetailService;
import com.ap.mis.service.LandSurveyDetailService;
import com.ap.mis.service.MISService;
import com.ap.mis.util.EnumFilter;

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

	private Integer maxFileSize = (1024 * 1024 * 10);
	
	@Value("${file.upload.extensions}") 
	private String allowedExtensions;

	@GetMapping(path = { "/create", "/edit" })
	public String createLandSurveyDetails(Model model, HttpSession session) {

		int workId = (int) session.getAttribute("workIdSession");
		log.info("Land survey details for given Work id " + workId);
		LandSurveyDetails newLandSurvey = new LandSurveyDetails();

		// load Survey land details
		Works work = MISService.getWorkInfo(workId);

		LandSurveyDetails existedLandSurveyDetails = landSurveyDetailsService.findByWork(work);
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
		model.addAttribute("maxFileSize", maxFileSize);
		model.addAttribute("allowedExtensions", allowedExtensions);		
		

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

		landSurveyDetailsService.save(landSurveyDetails);

		if (!isNewLandSurveyDetails) {
			return "redirect:/preliminaryPreparationLayout/edit";
		}

		return "redirect:/preliminaryPreparationLayout/create";

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
		model.addAttribute("maxFileSize", maxFileSize);

		return "online-mis-land-survey-details-view";
	}

}
