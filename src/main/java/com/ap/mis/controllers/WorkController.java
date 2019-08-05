package com.ap.mis.controllers;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ap.mis.entity.User;
import com.ap.mis.model.ViewDetails;
import com.ap.mis.service.ViewDetailsService;
import com.ap.mis.util.SecurityUtil;

@RequestMapping(path = "work")
@Controller
public class WorkController {
	private static final Logger log = Logger.getLogger(ViewDetailsController.class);
	@Autowired
	ViewDetailsService viewDetailsService;

	@GetMapping
	public String getWorkView(Model model) {
		List<ViewDetails> viewList = viewDetailsService.getAllWorks();
		model.addAttribute("viewList", viewList);
		User loggedInUser = SecurityUtil.getLoggedUser();
		model.addAttribute("userRole", loggedInUser.getRole().getRoleName());
		return "online-mis-all-works";
	}

	@PostMapping
	@ResponseBody
	public void getWorkAsList() {

	}

}
