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

@Controller
@RequestMapping("/tenderProcess")
public class TenderProcessController {

	@Autowired MISService misService;

	
	@PostMapping(value = "/save")
	public String saveTenderingProcess(@ModelAttribute TenderingProcess tenderingProcessObj ,Model model,HttpServletRequest request,@RequestParam("engfile") MultipartFile engfile,@RequestParam("telugufile") MultipartFile telugufile) {	
		
		Works  workInfo=null;
		TenderingProcess tenderingInfo=null;
		HttpSession session = request.getSession();
		int wrokid =(int) session.getAttribute("workIdSession");
		tenderingProcessObj.setWorkId(wrokid);	
		int i = misService.saveTenderingProcess(tenderingProcessObj,engfile,telugufile);
		workInfo=misService.getWorkInfo(wrokid);
		model.addAttribute("workInfo", workInfo);
		if(i != 0){
		   session.setAttribute("tenderingIdSession", i);
		   int tenderingId =(int) session.getAttribute("tenderingIdSession");
		   tenderingInfo=misService.getTenderingInfo(tenderingId);
		   model.addAttribute("tenderingInfo", tenderingInfo);
		   return "online-mis-agreement-details";
		} 	
		else
			return "online-mis-tendering-process";
   }
}
