package com.ap.mis.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ap.mis.entity.DepartmentLinkingLine;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.model.WorktoLandDetails;
import com.ap.mis.service.LandDetailService;
import com.ap.mis.service.MISService;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping("/lineDepartment")
public class LineDepartmentController {

	@Autowired MISService misService;
	@Autowired LandDetailService landDetailService;
	
	
	@PostMapping(value = "/save")
	public String lineDepatmentSave(@ModelAttribute  DepartmentLinkingLine  lineDeptObj,Model model,HttpServletRequest request) {
		Works  workInfo=null;
		HttpSession session = request.getSession();
		int wrokid =(int) session.getAttribute("workIdSession");
		User loggedInUser = (User) session.getAttribute("loggedInUserObj");
		loggedInUser = SecurityUtil.getLoggedUser();
		lineDeptObj.setUser(loggedInUser);	
	
		lineDeptObj.setWork(wrokid);
		int i = misService.departmentLinkingLineSave(lineDeptObj);
		workInfo=misService.getWorkInfo(wrokid);
		model.addAttribute("workInfo", workInfo);
		WorktoLandDetails obj = new WorktoLandDetails(); 
		if(i != 0){
			model.addAttribute("LandTypeList", landDetailService.getLandTypeList());	
			obj = (WorktoLandDetails) session.getAttribute("generalInfo");
			obj.setDepartmentlinkingine(lineDeptObj);
			session.setAttribute("generalInfo", obj);
			return "online-mis-land-details";
		}
		else
			return  "online-mis-line-department";
	}
}
