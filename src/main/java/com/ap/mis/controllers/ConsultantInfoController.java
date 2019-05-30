package com.ap.mis.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ap.mis.entity.ConsultantInfo;
import com.ap.mis.entity.Works;
import com.ap.mis.service.ConsultantInfoService;
import com.ap.mis.service.MISService;

@Controller
@RequestMapping("/ConsultantInfo")
public class ConsultantInfoController {

	@Autowired MISService misService;
	
	@Autowired ConsultantInfoService constInfoService;
	
	@PostMapping(value = "/save")
	public String saveConsultantInfo(@ModelAttribute  ConsultantInfo  consultantInfoObject,Model model,HttpServletRequest request,HttpSession session) {
		
		int wrokid =(int) session.getAttribute("workIdSession");
		consultantInfoObject.setWorkId(wrokid);	
	    constInfoService.saveConsultantInfo(consultantInfoObject);
	    
		Works workInfo=misService.getWorkInfo(wrokid);
		model.addAttribute("workInfo", workInfo);
		
	
		return  "online-mis-technical-sanction";
		
		
	}
}
