package com.ap.mis.controllers;

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
import com.ap.mis.entity.ConsultantInfo;
import com.ap.mis.entity.GeotechnicalInvestigation;
import com.ap.mis.entity.LandSurveyDetails;
import com.ap.mis.entity.TechnicalSanction;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.service.ConsultantInfoService;
import com.ap.mis.service.GeotechnicalInvestigationService;
import com.ap.mis.service.LandSurveyDetailService;
import com.ap.mis.service.MISService;
import com.ap.mis.service.TechnicalSanctionService;
import com.ap.mis.util.EnumFilter;
import com.ap.mis.util.EnumWorkStatus;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping("/ConsultantInfo")
public class ConsultantInfoController {
	
	private static final Logger log = Logger.getLogger(ConsultantInfoController.class);

	@Autowired MISService misService;
	
	@Autowired ConsultantInfoService constInfoService;
	
	@Autowired TechnicalSanctionService technicalSanctionService;
	
	@Autowired
	LandSurveyDetailService landSurveyDetailsService;

	@Autowired
	GeotechnicalInvestigationService geotechnicalInvestigation;
	
	@PostMapping(value = "/save")
	public String saveConsultantInfo(@ModelAttribute ConsultantInfo consultantInfoObject, Model model,
			HttpServletRequest request, HttpSession session) {
		boolean isSave = false;
		int workId = (int) session.getAttribute("workIdSession");
		// consultantInfoObject.setWorkId(workId);
		// constInfoService.saveConsultantInfo(consultantInfoObject);

		if (consultantInfoObject.getId() == null) {
			log.info("inside save:" + consultantInfoObject.getId());
			constInfoService.saveConsultantInfo(consultantInfoObject);
			Works workInfo = misService.getWorkInfo(workId);
			workInfo.setStatus(EnumWorkStatus.CONSULTANT_INFO.getStatus());
			misService.updateWork(workInfo);
			session.setAttribute("workInfo", workInfo);
			isSave = true;
		} else {
			log.info("inside update:" + consultantInfoObject.getId());
			constInfoService.updateConsultantInfo(consultantInfoObject);
			// checking... TechnicalSanction is created or not
			/*
			 * TechnicalSanction technicalSanction =
			 * technicalSanctionService.getTechDetails(workId); if(technicalSanction ==
			 * null) { isSave = true; }
			 */
		}

		if (isSave == true) {
			log.info("isSave value save T :" + isSave);
			return "redirect:/landSurveyDetails/create/" + workId;
			// return "redirect:/technicalSanction/create";
		} else {
			log.info("isSave value edit F :" + isSave);
			return "redirect:/landSurveyDetails/edit/" + workId;
		}

	}
	
	@GetMapping(value = "/create/{workId}")
	public String create(@ModelAttribute User userObject, Model model,HttpServletRequest request,@PathVariable("workId") Integer workId) {
		HttpSession session = request.getSession();
		userObject = SecurityUtil.getLoggedUser();
	    userObject =misService.verifyUser(userObject);
	    if(workId==null) {
	    workId =(int) session.getAttribute("workIdSession");
	    }
	    Works workInfo=misService.getWorkInfo(workId);
	    model.addAttribute("workObject", workInfo);
	    model.addAttribute("consultantInfoObject", new ConsultantInfo());
		session.setAttribute("loggedInUserObj", userObject);
		LandSurveyDetails existedLandSurveyDetails = landSurveyDetailsService.findByWork(workInfo);
		model.addAttribute("landSurvey",existedLandSurveyDetails);
	    return "online-mis-consultant-information";
	}

	@GetMapping(value = "/view")
	public String view(Model model, String workId) {
		ConsultantInfo consultInfo = constInfoService.getConsultDetails(Integer.parseInt(workId));
		model.addAttribute("consultInfo", consultInfo);
		TechnicalSanction techInfo = technicalSanctionService.getTechDetails(Integer.parseInt(workId));
		model.addAttribute("techInfo", techInfo);
		return "online-mis-consultInfoView";
	}
	
	@GetMapping(value = "/edit/{workId}")
	public String edit(Model model,@PathVariable("workId") Integer workId,HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(workId==null) {
		workId =(int) session.getAttribute("workIdSession");
		}
		Works workInfo=misService.getWorkInfo(workId);
		ConsultantInfo consltInfo = constInfoService.getConsultDetails(workId);
		model.addAttribute("consultantInfoObject",consltInfo);
		model.addAttribute("workObject", consltInfo.getWork());
		LandSurveyDetails existedLandSurveyDetails = landSurveyDetailsService.findByWork(workInfo);
		model.addAttribute("landSurvey",existedLandSurveyDetails);
		model.addAttribute("consltInfo",consltInfo);
		GeotechnicalInvestigation geotechnicalInvestigationDetails = geotechnicalInvestigation.findByWork(workInfo);
		model.addAttribute("investigation",geotechnicalInvestigationDetails);
	    return "online-mis-consultant-information";
	}
}
