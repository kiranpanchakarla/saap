package com.ap.mis.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ap.mis.entity.User;
import com.ap.mis.model.ViewDetails;
import com.ap.mis.service.ViewDetailsService;
import com.ap.mis.util.SecurityUtil;

@Controller
public class WorkApprovalController {
	
	@Autowired
	ViewDetailsService viewDetailsService;

	@RequestMapping(value = "/approvals" , method = RequestMethod.GET)
	public String viewDetails(@ModelAttribute User userObject, Model model,HttpServletRequest request) {
		
		User loggedInUser = SecurityUtil.getLoggedUser();
		model.addAttribute("userRole", loggedInUser.getRole().getRoleName());
		
		List<ViewDetails> viewList = viewDetailsService.getApprovalDetials();
		model.addAttribute("viewList", viewList); 
		
		return "online-mis-approval";
	}
}
