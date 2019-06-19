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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ap.mis.entity.AgreementDetails;
import com.ap.mis.entity.TechnicalSanction;
import com.ap.mis.entity.TenderingProcess;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.service.AgreementDetailService;
import com.ap.mis.service.MISService;
import com.ap.mis.service.TenderingProcessService;
import com.ap.mis.util.ContextUtil;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping("/tenderProcess")
public class TenderProcessController {

	@Autowired MISService misService;

	@Autowired TenderingProcessService tenderProcess;
	
	@Autowired AgreementDetailService agreementDetailService;
	
	 
	
	@PostMapping(value = "/save")
	public String saveTenderingProcess(@ModelAttribute TenderingProcess tenderingProcessObj ,Model model,HttpServletRequest request,@RequestParam("engfile") MultipartFile engfile,@RequestParam("telugufile") MultipartFile telugufile,HttpSession session) {	
		
		boolean isSave=false;
		int workId =(int) session.getAttribute("workIdSession");
//		tenderProcess.saveTenderingProcess(tenderingProcessObj,engfile,telugufile);
		
		if (tenderingProcessObj.getId() == null) {
			tenderProcess.saveTenderingProcess(tenderingProcessObj,engfile,telugufile);
			isSave = true;
		} else {
			tenderProcess.updateTenderingProcess(tenderingProcessObj,engfile,telugufile);
			 //checking... agreementDetails is created or not
			   AgreementDetails agreementDetails = agreementDetailService.getAgreementDetails(workId);
				        if(agreementDetails == null) {
				            isSave = true;
				        }  
		}
		
		Works workInfo=misService.getWorkInfo(workId);
		model.addAttribute("workInfo", workInfo);
		
		   session.setAttribute("tenderingIdSession", tenderingProcessObj.getId());
		    
				   
			if(isSave==true) {
				 return "redirect:/agreementDetails/create";
			}else {
				return "redirect:/agreementDetails/edit/"+workId;
			}


   }
	
	@GetMapping(value = "/create")
	public String create(@ModelAttribute User userObject, Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		userObject = SecurityUtil.getLoggedUser();
	    userObject =misService.verifyUser(userObject);
	    model.addAttribute("tenderingProcessObj", new TenderingProcess());
	    session.getAttribute("workInfo");
	    int workid = (int) session.getAttribute("workIdSession");
		Works workInfo = misService.getWorkInfo(workid);
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));
		session.setAttribute("loggedInUserObj", userObject);
		model.addAttribute("authoritiesTypeList", tenderProcess.getAuthoritiesList());
		model.addAttribute("agencyList", tenderProcess.getAgencyList());

		return "online-mis-tendering-process";
	}
	
	@GetMapping(value = "/view")
	public String view(Model model, String workId,HttpServletRequest request) {
		TenderingProcess tenderInfo = tenderProcess.getTenderDetails(Integer.parseInt(workId));
		if (tenderInfo.getEngUpload() != null && !tenderInfo.getEngUpload().equals("")) {
			model.addAttribute("engUpload",ContextUtil.populateContext(request) + tenderInfo.getEngUpload());
		} else {
			model.addAttribute("engUpload", null);
		}
		if (tenderInfo.getTelUpload() != null && !tenderInfo.getTelUpload().equals("")) {
			model.addAttribute("telUpload",ContextUtil.populateContext(request) + tenderInfo.getTelUpload());
		} else {
			model.addAttribute("telUpload", null);
		}
		model.addAttribute("tenderInfo",tenderInfo);
		Works workInfo = misService.getWorkInfo(tenderInfo.getWork().getId());
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));
		AgreementDetails  agreementInfo = agreementDetailService.getAgreementDetails(Integer.parseInt(workId));
		model.addAttribute("agreementInfo",agreementInfo);
		
		return "online-mis-tenderView";		 
	}
	
	@GetMapping(value = "/edit/{id}")
	public String edit(Model model,@PathVariable("id") Integer id,HttpServletRequest request) {
		TenderingProcess tenderInfo = tenderProcess.getTenderDetails(id);
		if (tenderInfo.getEngUpload() != null && !tenderInfo.getEngUpload().equals("")) {
			model.addAttribute("engUpload",ContextUtil.populateContext(request) + tenderInfo.getEngUpload());
		} else {
			model.addAttribute("engUpload", null);
		}
		if (tenderInfo.getTelUpload() != null && !tenderInfo.getTelUpload().equals("")) {
			model.addAttribute("telUpload",ContextUtil.populateContext(request) + tenderInfo.getTelUpload());
		} else {
			model.addAttribute("telUpload", null);
		}
		Works workInfo = misService.getWorkInfo(tenderInfo.getWork().getId());
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));
		model.addAttribute("authoritiesTypeList", tenderProcess.getAuthoritiesList());
		model.addAttribute("agencyList", tenderProcess.getAgencyList());
		model.addAttribute("tenderingProcessObj",tenderInfo);
		return "online-mis-tendering-process";
	}

}
