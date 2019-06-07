package com.ap.mis.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ap.mis.entity.TenderingProcess;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.service.MISService;
import com.ap.mis.service.TenderingProcessService;
import com.ap.mis.util.ContextUtil;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping("/tenderProcess")
public class TenderProcessController {

	@Autowired MISService misService;

	@Autowired TenderingProcessService tenderProcess;
	
	 
	
	@PostMapping(value = "/save")
	public String saveTenderingProcess(@ModelAttribute TenderingProcess tenderingProcessObj ,Model model,HttpServletRequest request,@RequestParam("engfile") MultipartFile engfile,@RequestParam("telugufile") MultipartFile telugufile,HttpSession session) {	
		
		int wrokid =(int) session.getAttribute("workIdSession");
		tenderProcess.saveTenderingProcess(tenderingProcessObj,engfile,telugufile);
		
		Works workInfo=misService.getWorkInfo(wrokid);
		model.addAttribute("workInfo", workInfo);
		
		   session.setAttribute("tenderingIdSession", tenderingProcessObj.getId());
		    
		   return "redirect:/agreementDetails/create";

   }
	
	@GetMapping(value = "/create")
	public String create(@ModelAttribute User userObject, Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		userObject = SecurityUtil.getLoggedUser();
	    userObject =misService.verifyUser(userObject);
	    model.addAttribute("tenderingProcessObj", new TenderingProcess());
	    session.getAttribute("workInfo");
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
	    return "online-mis-tenderView";
		 
	}
}
