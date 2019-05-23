package com.ap.mis.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ap.mis.entity.AgreementDetails;
import com.ap.mis.entity.Works;
import com.ap.mis.service.MISService;

@Controller
@RequestMapping("/agreementDetails")
public class AgreementDetailsController {

	@Autowired MISService misService;

	@PostMapping(value = "/save")
	public String saveAgreementDetails(@ModelAttribute AgreementDetails agreementDetailsObj ,Model model,HttpServletRequest request) {	
		Works  workInfo=null;
		HttpSession session = request.getSession();
		int wrokid =(int) session.getAttribute("workIdSession");
		agreementDetailsObj.setWorkId(wrokid);	
		int i = misService.saveAgreementDetails(agreementDetailsObj);
		workInfo=misService.getWorkInfo(wrokid);
		model.addAttribute("workInfo", workInfo);
		return "online-mis-details";
	}	
}
