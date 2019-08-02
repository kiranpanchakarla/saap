package com.ap.mis.controllers;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.LetterOfAcceptance;
import com.ap.mis.entity.TechnicalSanction;
import com.ap.mis.entity.TenderEvaluation;
import com.ap.mis.entity.TenderingProcess;
import com.ap.mis.entity.WorkEstimations;
import com.ap.mis.entity.Works;
import com.ap.mis.service.AdministrativeSectionService;
import com.ap.mis.service.LetterOfAcceptanceService;
import com.ap.mis.service.MISService;
import com.ap.mis.service.TechnicalSanctionService;
import com.ap.mis.service.TenderEvaluationService;
import com.ap.mis.service.TenderingProcessService;
import com.ap.mis.service.WorkEstimationService;
import com.ap.mis.util.EnumWorkStatus;

@Controller
@RequestMapping(path = "/tenderEvaluation")
public class TenderEvaluationController {
	@Autowired
	MISService misService;

	@Autowired
	WorkEstimationService workEstimationService;

	@Autowired
	AdministrativeSectionService administrativeSanctionService;

	@Autowired
	TechnicalSanctionService technicalSanctionService;

	@Autowired
	TenderEvaluationService tenderEvaluationService;
	
	@Autowired
	TenderingProcessService tenderProcessService;

	@Autowired
	LetterOfAcceptanceService LOAService;

	private final static Logger log = Logger.getLogger(TenderEvaluationController.class);

	@GetMapping(path = { "/create", "/edit" })
	public String getTechnicalEvaluation(Model model, HttpSession session) {
		int workId = (int) session.getAttribute("workIdSession");
		log.info("Tender evaluation for Work id" + workId);

		Works workInfo = misService.getWorkInfo(workId);

		model.addAttribute("workInfo", workInfo);
		model.addAttribute("workObject", workInfo);
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));

		WorkEstimations workEstimation = workEstimationService.getWorkEstimationByWork(workInfo);
		model.addAttribute("workEstimation", workEstimation);

		AdministrativeSection administrativeSection = administrativeSanctionService.getAdminDetails(workId);
		model.addAttribute("administrativeSection", administrativeSection);

		TechnicalSanction technicalSanction = technicalSanctionService.getTechDetails(workId);
		model.addAttribute("technicalSanction", technicalSanction);

		TenderingProcess tenderInfo = tenderProcessService.getTenderDetails(workId);
		model.addAttribute("tenderInfo",tenderInfo);
		TenderEvaluation tenderEvaluation = tenderEvaluationService.findTenderEvaluationByWork(workInfo);
		if (tenderEvaluation == null) {
			tenderEvaluation = new TenderEvaluation();
			tenderEvaluation.setWork(workInfo);
		}

		model.addAttribute("tenderEvaluation", tenderEvaluation);

		return "online-mis-tender-evaluation";
	}

	@PostMapping(path = { "/save" })
	public String saveTechnicalEvaluation(@ModelAttribute TenderEvaluation tenderEvaluation) {

		/* boolean isSave = tenderEvaluation.getId() == null; */
		LetterOfAcceptance letterofAcceptanceDetails = LOAService.findByWork(tenderEvaluation.getWork());
		boolean isSave = true;
		if (letterofAcceptanceDetails != null) {
			isSave = false;
		}
		tenderEvaluationService.saveOrUpdateTenderEvaluation(tenderEvaluation);
		/*
		 * return "redirect:/nextRoute/" + (isTenderEvaluationisNew ? "create" :
		 * "edit");
		 */

		if (isSave) {
			Works work = misService.getWorkInfo(tenderEvaluation.getWork().getId());
			work.setStatus(EnumWorkStatus.TENDER_EVALUATION_INFO.getStatus());
			misService.updateWork(work);
		}

		return "redirect:/letterOfAcceptance/" + (isSave ? "create" : "edit");

	}

}
