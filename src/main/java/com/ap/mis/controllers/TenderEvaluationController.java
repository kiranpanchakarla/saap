package com.ap.mis.controllers;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/tenderEvaluation")
public class TenderEvaluationController {

	private final static Logger log = Logger.getLogger(TenderEvaluationController.class);

	@GetMapping(path = { "/create", "/edit" })
	public String getTechnicalEvaluation(Model model, HttpSession session) {
		int workId = (int) session.getAttribute("workIdSession");
		log.info("Tender evaluation for Work id" + workId);
		return "online-mis-tender-evaluation";
	}

	@PostMapping(path = { "/save" })
	public String saveTechnicalEvaluation(Model model) {
		return null;
	}

}
