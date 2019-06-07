package com.ap.mis.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.DepartmentLinkingLine;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.model.WorktoLandDetails;
import com.ap.mis.service.LandDetailService;
import com.ap.mis.service.LineDepartmentService;
import com.ap.mis.service.MISService;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping("/lineDepartment")
public class LineDepartmentController {

	@Autowired
	MISService misService;
	@Autowired
	LandDetailService landDetailService;
	@Autowired
	LineDepartmentService LineDepartService;

	@PostMapping(value = "/save")
	public String lineDepatmentSave(@ModelAttribute DepartmentLinkingLine lineDeptObj, Model model,
			HttpServletRequest request, HttpSession session) {

		User loggedInUser = SecurityUtil.getLoggedUser();
		int workid = (int) session.getAttribute("workIdSession");
		Works workInfo = misService.getWorkInfo(workid);
		session.setAttribute("workInfo", workInfo);
		
		lineDeptObj.setUser(loggedInUser);
		LineDepartService.departmentLinkingLineSave(lineDeptObj);
		
		WorktoLandDetails obj = new WorktoLandDetails();
        obj = (WorktoLandDetails) session.getAttribute("generalInfo");
		obj.setDepartmentlinkingine(lineDeptObj);
		session.setAttribute("generalInfo", obj);
		return "redirect:/landDetails/create";
	}
	
	@GetMapping(value = "/create")
	public String create(@ModelAttribute User userObject, Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		userObject = SecurityUtil.getLoggedUser();
	    userObject =misService.verifyUser(userObject);
	    model.addAttribute("lineDeptObj", new DepartmentLinkingLine());
		session.setAttribute("loggedInUserObj", userObject);
		session.getAttribute("workInfo");
		model.addAttribute("divisionList", LineDepartService.getDivisionList());
		model.addAttribute("subdivisionList", LineDepartService.getSubdivisionList());
		model.addAttribute("sectionList", LineDepartService.getSectionList());
	    return "online-mis-line-department";
	}
}
