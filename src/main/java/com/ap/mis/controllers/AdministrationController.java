package com.ap.mis.controllers;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.model.WorktoLandDetails;
import com.ap.mis.service.AdministrativeSectionService;
import com.ap.mis.service.LineDepartmentService;
import com.ap.mis.service.MISService;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping("/administrativeSection")
public class AdministrationController {
	private static final Logger log = Logger.getLogger(AdministrationController.class);
	@Autowired
	MISService misService;

	@Autowired
	AdministrativeSectionService admService;

	@Autowired
	LineDepartmentService lineDepartmentService;

	@PostMapping(value = "/save")
	public String administrativeSectionSave(@ModelAttribute AdministrativeSection adminSecObject, Model model,
			HttpServletRequest request, @RequestParam("file") MultipartFile file, HttpSession session) {

		int workid = (int) session.getAttribute("workIdSession");
		User loggedInUser = SecurityUtil.getLoggedUser();
		adminSecObject.setUser(loggedInUser);
		admService.adminstrativeSection(adminSecObject, file);

		Works workInfo = misService.getWorkInfo(workid);
		//model.addAttribute("workInfo", workInfo);
		session.setAttribute("workInfo", workInfo);

		WorktoLandDetails obj = new WorktoLandDetails();
		obj = (WorktoLandDetails) session.getAttribute("generalInfo");
		obj.setAdministrativeesction(adminSecObject);
		session.setAttribute("generalInfo", obj);

//		model.addAttribute("wrokid", workid);
		return "redirect:/lineDepartment/create";

	}
	
	@GetMapping(value = "/create")
	public String create(@ModelAttribute User userObject, Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		userObject = SecurityUtil.getLoggedUser();
	    userObject =misService.verifyUser(userObject);
	    model.addAttribute("adminSecObject", new AdministrativeSection());
		session.setAttribute("loggedInUserObj", userObject);
		session.getAttribute("workInfo");
		model.addAttribute("grantTypeList", admService.findAll());
		model.addAttribute("finYearList", admService.getfinancialYearList());
		model.addAttribute("executiveDeptList", admService.getExecutiveDeptList());
		model.addAttribute("executiveConsultantList", admService.getExecutiveConsultantList());
	    return "online-mis-administrative-section";
	}
	
	
}
