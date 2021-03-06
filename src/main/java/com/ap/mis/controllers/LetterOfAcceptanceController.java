package com.ap.mis.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ap.mis.entity.Attachements;
import com.ap.mis.entity.LetterOfAcceptance;
import com.ap.mis.entity.Works;
import com.ap.mis.service.AttachmentService;
import com.ap.mis.service.LetterOfAcceptanceService;
import com.ap.mis.service.MISService;
import com.ap.mis.util.EnumFilter;
import com.ap.mis.util.FileUploadConstraintsUtil;




@Controller
@RequestMapping("/letterOfAcceptance")
public class LetterOfAcceptanceController {
	private static final Logger  log=Logger.getLogger(LetterOfAcceptanceController.class);
	@Autowired
	MISService MISService;

	
	@Autowired
	LetterOfAcceptanceService LOAService;
	
	@Autowired
	FileUploadConstraintsUtil fileUploadConstraint;
	
	@Autowired
	AttachmentService attachmentService;
	
	
	@GetMapping(path = { "/create", "/edit" })
	public String create(Model model,HttpSession session) {
		int workId = (int) session.getAttribute("workIdSession");
		log.info("Letter Of Acceptance details for given Work id " + workId);
		
		EnumFilter moduleStatus = EnumFilter.LOA;
        List<Attachements> attachments = attachmentService.getAttachementsDetails(workId, moduleStatus.getStatus());
        
        Works work = MISService.getWorkInfo(workId);
        LetterOfAcceptance letterofAcceptanceDetails=LOAService.findByWork(work);
        if(letterofAcceptanceDetails== null) {
        	letterofAcceptanceDetails=new LetterOfAcceptance();
        	letterofAcceptanceDetails.setWork(work);
        }
        model.addAttribute("moduleName", moduleStatus.getStatus());
		model.addAttribute("fileUploadConstraint", fileUploadConstraint);
		model.addAttribute("attachments", attachments);
		model.addAttribute("letterOfAcceptance", letterofAcceptanceDetails);
		return "online-mis-letterOfAcceptance";
	}

	@PostMapping(path = "/save")
	public String saveDetails(@ModelAttribute LetterOfAcceptance letterOfAcceptance, Model model, HttpSession session) {
		letterOfAcceptance = LOAService.save(letterOfAcceptance);
		return "redirect:/adminloggedin";
	}
	
	
	
	
	
	
}
