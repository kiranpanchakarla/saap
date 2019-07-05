package com.ap.mis.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ap.mis.entity.Attachements;
import com.ap.mis.entity.Works;
import com.ap.mis.service.AttachmentService;
import com.ap.mis.service.MISService;
import com.ap.mis.util.EnumFilter;

@Controller
@RequestMapping(path = "/preliminaryPreparationLayout")
public class PreliminaryPreparationLayoutController {
	private static final Logger log = Logger.getLogger(PreliminaryPreparationLayoutController.class);

	@Autowired
	MISService MISService;

	@Autowired
	AttachmentService attachmentService;

	@GetMapping(path = { "/create", "/edit", "/view" })
	public String createPreliminaryPreparationLayout(Model model, HttpSession session) {

		int workId = (int) session.getAttribute("workIdSession");
		log.info("Land survey details for given Work id " + workId);
		EnumFilter workModuleStatus = EnumFilter.PRELIMINARY_PREPARATION_LAYOUT;
		Works work = MISService.getWorkInfo(workId);

		List<Attachements> attachments = attachmentService.getAttachementsDetails(workId, workModuleStatus.getStatus());

		model.addAttribute("work", work);
		model.addAttribute("workLineItems", work.getWorkLineItemsList().get(0));
		model.addAttribute("preliminaryPreparationLayoutAttachmentFiles", attachments);
		model.addAttribute("moduleName", workModuleStatus.getStatus());

		return "online-mis-preliminary-preparation-layout";
	}
	
	
	@PostMapping(path = { "/save"})
	public String savePreliminaryPreparationLayout(Model model, HttpSession session) {

		int workId = (int) session.getAttribute("workIdSession");
		
		return "online-mis-preliminary-preparation-layout";
	}
	
	
}
