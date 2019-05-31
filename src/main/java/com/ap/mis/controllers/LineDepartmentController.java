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
		model.addAttribute("workInfo", workInfo);
		
		lineDeptObj.setUser(loggedInUser);
//		lineDeptObj.setWork(workid);
		LineDepartService.departmentLinkingLineSave(lineDeptObj);
		
		WorktoLandDetails obj = new WorktoLandDetails();
        obj = (WorktoLandDetails) session.getAttribute("generalInfo");
		obj.setDepartmentlinkingine(lineDeptObj);
		session.setAttribute("generalInfo", obj);
		
		
		model.addAttribute("LandTypeList", landDetailService.getLandTypeList());
		return "online-mis-land-details";

	}
}
