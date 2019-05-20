package com.ap.mis.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.User;
import com.ap.mis.model.WorktoLandDetails;
import com.ap.mis.service.ConstituencyService;
import com.ap.mis.service.DistrictService;
import com.ap.mis.service.MISService;
import com.ap.mis.service.MandalService;
import com.ap.mis.service.VillageService;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping("/administrativeSection")
public class AdministrationController {

	@Autowired MISService misService;
	@Autowired DistrictService districtsService;
	@Autowired MandalService  mandalService;
	@Autowired VillageService villageService;
	@Autowired ConstituencyService  constituencyService;
	
	@PostMapping(value = "/save")
	public String administrativeSectionSave(@ModelAttribute  AdministrativeSection  adminSecObject,Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		User loggedInUser = (User) session.getAttribute("loggedInUserObj");
		loggedInUser = SecurityUtil.getLoggedUser();
		adminSecObject.setUser(loggedInUser);
		int i = misService.adminstrativeSectionSave(adminSecObject);
		WorktoLandDetails obj = new WorktoLandDetails(); 
		if(i != 0){
			obj = (WorktoLandDetails) session.getAttribute("generalInfo");
		    obj.setAdministrativeesction(adminSecObject);
		    session.setAttribute("generalInfo", obj);
			return  "online-mis-line-department";
		}
		else
			return "online-mis-administrative-section";
	}
}
