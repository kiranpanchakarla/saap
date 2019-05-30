package com.ap.mis.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ap.mis.entity.TechnicalSanction;
import com.ap.mis.entity.Works;
import com.ap.mis.service.MISService;
import com.ap.mis.service.TechnicalSanctionService;
import com.ap.mis.service.TenderingProcessService;

@Controller
@RequestMapping("/technicalSanction")
public class TechnicalSanctionController {

	@Autowired
	MISService misService;

	@Autowired
	TechnicalSanctionService techSanction;

	@Autowired
	TenderingProcessService tenderingProcessService;

	@PostMapping(value = "/save")
	public String technicalSanctionSave(@ModelAttribute TechnicalSanction techsanc, Model model,
			HttpServletRequest request, HttpSession session) {

		if (session.getAttribute("loggedInUserObj") == null) {
			model.addAttribute("sessionTimeout", "sessionTimeout");
			return "online-admin";
		}

		int wrokid = (int) session.getAttribute("workIdSession");
		techsanc.setWorkId(wrokid);
		techSanction.saveTechSanction(techsanc);

		Works workInfo = misService.getWorkInfo(wrokid);
		model.addAttribute("workInfo", workInfo);
		model.addAttribute("authoritiesTypeList", tenderingProcessService.getAuthoritiesList());
		model.addAttribute("agencyList", tenderingProcessService.getAgencyList());

		return "online-mis-tendering-process";

	}
}
