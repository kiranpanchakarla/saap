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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ap.mis.entity.ConsultantInfo;
import com.ap.mis.entity.NatureOfWork;
import com.ap.mis.entity.TechnicalSanction;
import com.ap.mis.entity.TypeOfWork;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.service.ConsultantInfoService;
import com.ap.mis.service.MISService;
import com.ap.mis.service.TechnicalSanctionService;
import com.ap.mis.util.EnumFilter;
import com.ap.mis.util.EnumWorkStatus;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping("/ConsultantInfo")
public class ConsultantInfoController {

	private static final Logger log = Logger.getLogger(ConsultantInfoController.class);

	@Autowired
	MISService misService;

	@Autowired
	ConsultantInfoService constInfoService;

	@Autowired
	TechnicalSanctionService technicalSanctionService;

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
			return "redirect:/landSurveyDetails/create";
			// return "redirect:/technicalSanction/create";
		} else {
			log.info("isSave value edit F :" + isSave);
			return "redirect:/landSurveyDetails/edit";
		}

	}

	@GetMapping(value = "/create")
	public String create(@ModelAttribute User userObject, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		userObject = SecurityUtil.getLoggedUser();
		userObject = misService.verifyUser(userObject);
		model.addAttribute("consultantInfoObject", new ConsultantInfo());
		session.setAttribute("loggedInUserObj", userObject);
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

	@GetMapping(value = "/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id, HttpServletRequest request) {
		System.out.println("WORK ID:::" + id);
		ConsultantInfo consltInfo = constInfoService.getConsultDetails(id);
		model.addAttribute("consultantInfoObject", consltInfo);
		return "online-mis-consultant-information";
	}
}
