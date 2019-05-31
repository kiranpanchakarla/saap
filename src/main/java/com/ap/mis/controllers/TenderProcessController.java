package com.ap.mis.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ap.mis.entity.TenderingProcess;
import com.ap.mis.entity.Works;
import com.ap.mis.service.MISService;
import com.ap.mis.service.TenderingProcessService;

@Controller
@RequestMapping("/tenderProcess")
public class TenderProcessController {

	@Autowired MISService misService;

	@Autowired TenderingProcessService tenderProcess;
	
	@PostMapping(value = "/save")
	public String saveTenderingProcess(@ModelAttribute TenderingProcess tenderingProcessObj ,Model model,HttpServletRequest request,@RequestParam("engfile") MultipartFile engfile,@RequestParam("telugufile") MultipartFile telugufile,HttpSession session) {	
		
		int wrokid =(int) session.getAttribute("workIdSession");
//		tenderingProcessObj.setWorkId(wrokid);	
		tenderProcess.saveTenderingProcess(tenderingProcessObj,engfile,telugufile);
		
		Works workInfo=misService.getWorkInfo(wrokid);
		model.addAttribute("workInfo", workInfo);
		
		   session.setAttribute("tenderingIdSession", tenderingProcessObj.getId());
		   int tenderingId =(int) session.getAttribute("tenderingIdSession");
		   TenderingProcess tenderingInfo=tenderProcess.getTenderingInfo(tenderingId);
		   model.addAttribute("tenderingInfo", tenderingInfo);
		   return "online-mis-agreement-details";

   }
}
