package com.ap.mis.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.model.WorktoLandDetails;
import com.ap.mis.service.AdministrativeSectionService;
import com.ap.mis.service.MISService;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping("/worksCreation")
public class WorkCreationController {

	@Autowired
	MISService misService;
	@Autowired
	AdministrativeSectionService administrativeSectionService;

	@PostMapping(value = "/save")
	public String workCreationSave(@ModelAttribute Works workObject, Model model, HttpServletRequest request,HttpSession session) {

		
		User loggedInUser = SecurityUtil.getLoggedUser();
		workObject.setUser(loggedInUser);
		misService.saveWorks(workObject);

				
		WorktoLandDetails obj = new WorktoLandDetails();
		obj.setWorks(workObject);
		session.setAttribute("generalInfo", obj);
		session.setAttribute("workIdSession", workObject.getId());
		
		
		model.addAttribute("workInfo", workObject);
		model.addAttribute("grantTypeList", administrativeSectionService.findAll());
		model.addAttribute("finYearList", administrativeSectionService.getfinancialYearList());
		model.addAttribute("executiveDeptList", administrativeSectionService.getExecutiveDeptList());
		model.addAttribute("executiveConsultantList", administrativeSectionService.getExecutiveConsultantList());
		return "online-mis-administrative-section";

	}

}
