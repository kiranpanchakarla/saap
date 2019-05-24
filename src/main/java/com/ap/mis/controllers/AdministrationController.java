package com.ap.mis.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.User;
import com.ap.mis.model.WorktoLandDetails;
import com.ap.mis.service.LineDepartmentService;
import com.ap.mis.service.MISService;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping("/administrativeSection")
public class AdministrationController {
private static final Logger log=Logger.getLogger(AdministrationController.class);
	@Autowired MISService misService;

	@Autowired LineDepartmentService lineDepartmentService;

	
	@PostMapping(value = "/save")
	public String administrativeSectionSave(@ModelAttribute  AdministrativeSection  adminSecObject,Model model,HttpServletRequest request,@RequestParam("file") MultipartFile file) {
		HttpSession session = request.getSession();
		int wrokid =(int) session.getAttribute("workIdSession");
		User loggedInUser = (User) session.getAttribute("loggedInUserObj");
		loggedInUser = SecurityUtil.getLoggedUser();
		adminSecObject.setUser(loggedInUser);
		int i = misService.adminstrativeSection(adminSecObject, file);
		WorktoLandDetails obj = new WorktoLandDetails(); 
		if(i != 0){
			model.addAttribute("divisionList", lineDepartmentService.getDivisionList());
			model.addAttribute("subdivisionList", lineDepartmentService.getSubdivisionList());
			model.addAttribute("sectionList", lineDepartmentService.getSectionList());
			model.addAttribute("wrokid", wrokid);
			obj = (WorktoLandDetails) session.getAttribute("generalInfo");
		    obj.setAdministrativeesction(adminSecObject);
		    session.setAttribute("generalInfo", obj);
			return  "online-mis-line-department";
		}
		else
			return "online-mis-administrative-section";
	}
}
