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
import com.ap.mis.service.MISService;

@Controller
@RequestMapping("/ConsultantInfo")
public class ConsultantInfoController {

	@Autowired MISService misService;
	
	
	@PostMapping(value = "/save")
	public String saveConsultantInfo(@ModelAttribute  ConsultantInfo  consultantInfoObject,Model model,HttpServletRequest request) {
		Works  workInfo=null;
		HttpSession session = request.getSession();
		int wrokid =(int) session.getAttribute("workIdSession");
		consultantInfoObject.setWorkId(wrokid);	
		int i = misService.saveConsultantInfo(consultantInfoObject);
		workInfo=misService.getWorkInfo(wrokid);
		model.addAttribute("workInfo", workInfo);
		if(i != 0)
		return  "online-mis-technical-sanction";
		else
		return  "online-mis-consultant-information";
		
	}
}
