package com.ap.mis.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ap.mis.entity.ConsultantInfo;
import com.ap.mis.entity.NatureOfWork;
import com.ap.mis.entity.TypeOfWork;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.service.ConsultantInfoService;
import com.ap.mis.service.MISService;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping("/ConsultantInfo")
public class ConsultantInfoController {

	@Autowired MISService misService;
	
	@Autowired ConsultantInfoService constInfoService;
	
	@PostMapping(value = "/save")
	public String saveConsultantInfo(@ModelAttribute  ConsultantInfo  consultantInfoObject,Model model,HttpServletRequest request,HttpSession session) {
		
		int wrokid =(int) session.getAttribute("workIdSession");
//		consultantInfoObject.setWorkId(wrokid);	
	    constInfoService.saveConsultantInfo(consultantInfoObject);
	    
		Works workInfo=misService.getWorkInfo(wrokid);
		session.setAttribute("workInfo", workInfo);
		
		return  "redirect:/technicalSanction/create";
		 
	}
	
	@GetMapping(value = "/create")
	public String create(@ModelAttribute User userObject, Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		userObject = SecurityUtil.getLoggedUser();
	    userObject =misService.verifyUser(userObject);
	    model.addAttribute("workObject", new ConsultantInfo());
		session.setAttribute("loggedInUserObj", userObject);
	    return "online-mis-consultant-information";
	}
	
	@GetMapping(value = "/view")
	public String view(Model model, String workId) {
		ConsultantInfo consultInfo = constInfoService.getConsultDetails(Integer.parseInt(workId));
		model.addAttribute("consultInfo",consultInfo);
	    return "online-mis-consultInfoView";
	}
}
