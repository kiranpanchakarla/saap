package com.ap.mis.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ap.mis.entity.AgreementDetails;
import com.ap.mis.entity.TenderingProcess;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.service.AgreementDetailService;
import com.ap.mis.service.MISService;
import com.ap.mis.service.OnlineMisDetailsService;
import com.ap.mis.service.TenderingProcessService;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping("/agreementDetails")
public class AgreementDetailsController {

	@Autowired MISService misService;
	
	@Autowired OnlineMisDetailsService onlineMisDetailsService;
	
	@Autowired AgreementDetailService agreeDetailsService;
	
	@Autowired TenderingProcessService tenderProcess;

	@PostMapping(value = "/save")
	public String saveAgreementDetails(@ModelAttribute AgreementDetails agreementDetailsObj ,Model model,HttpServletRequest request,HttpSession session) {	

		boolean isSave=false;
		
			        
		if (agreementDetailsObj.getId() == null) {
			agreeDetailsService.saveAgreementDetails(agreementDetailsObj);
			isSave = true;
		} else {
			agreeDetailsService.updateAgreementDetails(agreementDetailsObj);
		}
		
		return "redirect:/misDetails/list";
	}	
	
	@GetMapping(value = "/create")
	public String create(@ModelAttribute User userObject, Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		userObject = SecurityUtil.getLoggedUser();
	    userObject =misService.verifyUser(userObject);
	    model.addAttribute("agreementDetailsObj", new AgreementDetails());
	    session.getAttribute("workInfo");
		session.setAttribute("loggedInUserObj", userObject);
		
		int workid =(int) session.getAttribute("workIdSession");

		Works workInfo=misService.getWorkInfo(workid);
		model.addAttribute("workInfo", workInfo);
		
	   int tenderingId =(int) session.getAttribute("tenderingIdSession");
	   TenderingProcess tenderingInfo=tenderProcess.getTenderingInfo(tenderingId);
	   model.addAttribute("tenderingInfo", tenderingInfo);

		return "online-mis-agreement-details";
	}
	
	@GetMapping(value = "/view")
	public String view(Model model, String workId) {
		AgreementDetails  agreementInfo = agreeDetailsService.getAgreementDetails(Integer.parseInt(workId));
		model.addAttribute("agreementInfo",agreementInfo);
	    return "online-mis-agreementView";
		 
	}
	
	@GetMapping(value = "/edit/{id}")
	public String edit(Model model,@PathVariable("id") Integer id,HttpServletRequest request) {
		HttpSession session = request.getSession();
		AgreementDetails  agreementInfo = agreeDetailsService.getAgreementDetails(id);
		
		int tenderingId =(int) session.getAttribute("tenderingIdSession");
		System.out.println("TENDER ID ::: "+tenderingId);
		   TenderingProcess tenderingInfo=tenderProcess.getTenderingInfo(tenderingId);
		   model.addAttribute("tenderingInfo", tenderingInfo);
		   
		model.addAttribute("agreementDetailsObj",agreementInfo);
		return "online-mis-agreement-details";
	}
	
}
