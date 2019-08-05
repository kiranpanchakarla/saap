package com.ap.mis.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.model.OnlineMisDetails;
import com.ap.mis.service.MISService;
import com.ap.mis.service.OnlineMisDetailsService;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping("/misDetails")
public class MisDetailsController {

	@Autowired
	MISService misService;

	@Autowired
	OnlineMisDetailsService onlineMisDetailsService;

	@GetMapping(value = "/list")
	public String create(@ModelAttribute User userObject, Model model, HttpServletRequest request) {
		userObject = SecurityUtil.getLoggedUser();
		userObject = misService.verifyUser(userObject);
		List<OnlineMisDetails> reportList = onlineMisDetailsService.getList();
		model.addAttribute("reportList", reportList);
		HttpSession session = request.getSession();
		int workid = (int) session.getAttribute("workIdSession");
		Works workInfo = misService.getWorkInfo(workid);
		model.addAttribute("workInfo", workInfo);
		return "online-mis-details";
	}
}
