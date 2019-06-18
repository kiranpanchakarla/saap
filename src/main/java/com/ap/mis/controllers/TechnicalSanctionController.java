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

import com.ap.mis.entity.ConsultantInfo;
import com.ap.mis.entity.TechnicalSanction;
import com.ap.mis.entity.TenderingProcess;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.service.MISService;
import com.ap.mis.service.TechnicalSanctionService;
import com.ap.mis.service.TenderingProcessService;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping("/technicalSanction")
public class TechnicalSanctionController {

	@Autowired
	MISService misService;

	@Autowired
	TechnicalSanctionService techSanction;

	@Autowired
	TenderingProcessService tenderingProcessService;

	@PostMapping(value = "/save")
	public String technicalSanctionSave(@ModelAttribute TechnicalSanction techsanc, Model model,
			HttpServletRequest request, HttpSession session) {

		boolean isSave=false;
/*		if (session.getAttribute("loggedInUserObj") == null) {
			model.addAttribute("sessionTimeout", "sessionTimeout");
			return "online-admin";
		}*/

		int workId = (int) session.getAttribute("workIdSession");
//		techsanc.setWorkId(workId);
//		techSanction.saveTechSanction(techsanc);
		
		if (techsanc.getId() == null) {
			techSanction.saveTechSanction(techsanc);
			isSave = true;
		} else {
			techSanction.updateTechSanction(techsanc);
		}

		Works workInfo = misService.getWorkInfo(workId);
		model.addAttribute("workInfo", workInfo);
		model.addAttribute("authoritiesTypeList", tenderingProcessService.getAuthoritiesList());
		model.addAttribute("agencyList", tenderingProcessService.getAgencyList());

		//checking... TenderProcess is created or not
		TenderingProcess tenderProcess = tenderingProcessService.getTenderDetails(workId);
		        if(tenderProcess == null) {
		            isSave = true;
		        }  
		if(isSave==true) {
			return "redirect:/tenderProcess/create";
		}else {
			return "redirect:/tenderProcess/edit/"+workId;
		}


	}
	
	@GetMapping(value = "/create")
	public String create(@ModelAttribute User userObject, Model model,HttpServletRequest request,HttpSession session) {
		userObject = SecurityUtil.getLoggedUser();
	    userObject =misService.verifyUser(userObject);
	    model.addAttribute("techsanc", new TechnicalSanction());
	    session.getAttribute("workInfo");
		session.setAttribute("loggedInUserObj", userObject);
		int workid = (int) session.getAttribute("workIdSession");
		Works workInfo = misService.getWorkInfo(workid);
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));
		
	    return "online-mis-technical-sanction";
	}
	
	@GetMapping(value = "/view")
	public String view(Model model, String workId) {
		TechnicalSanction techInfo = techSanction.getTechDetails(Integer.parseInt(workId));
		Works workInfo = misService.getWorkInfo(techInfo.getWork().getId());
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));
		model.addAttribute("techInfo",techInfo);
	    return "online-mis-techSanctionView";
	}
	
	@GetMapping(value = "/edit/{id}")
	public String edit(Model model,@PathVariable("id") Integer id,HttpServletRequest request) {
		HttpSession session = request.getSession();
		TechnicalSanction techInfo = techSanction.getTechDetails(id);
		session.getAttribute("workInfo");
		Works workInfo = misService.getWorkInfo(techInfo.getWork().getId());
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));
		model.addAttribute("techsanc",techInfo);
		return "online-mis-technical-sanction";
	}

}
