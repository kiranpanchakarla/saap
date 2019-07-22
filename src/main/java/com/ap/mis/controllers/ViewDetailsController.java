package com.ap.mis.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
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
public class ViewDetailsController {
	private static final Logger log = Logger.getLogger(ViewDetailsController.class);
	@Autowired
	ViewDetailsService viewDetailsService;

	@RequestMapping(value = "/adminloggedin", method = RequestMethod.GET)
	public String viewDetails(@ModelAttribute User userObject, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();

		if (session.getAttribute("workIdSession") != null)
			session.removeAttribute("workIdSession");
		User loggedInUser = SecurityUtil.getLoggedUser();
		model.addAttribute("userRole", loggedInUser.getRole().getRoleName());

		List<ViewDetails> viewList = viewDetailsService.getViewDetials();
		model.addAttribute("viewList", viewList);

		return "online-mis-view";
	}

}
