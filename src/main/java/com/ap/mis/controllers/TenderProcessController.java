package com.ap.mis.controllers;

import java.util.ArrayList;
import java.util.List;

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
import com.ap.mis.entity.Attachements;
import com.ap.mis.entity.TechnicalSanction;
import com.ap.mis.entity.TenderingProcess;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.service.AgreementDetailService;
import com.ap.mis.service.AttachmentService;
import com.ap.mis.service.MISService;
import com.ap.mis.service.TenderingProcessService;
import com.ap.mis.util.ContextUtil;
import com.ap.mis.util.EnumFilter;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping("/tenderProcess")
public class TenderProcessController {

	@Autowired
	MISService misService;

	@Autowired
	TenderingProcessService tenderProcessService;

	@Autowired
	AgreementDetailService agreementDetailService;

	@Autowired
	AttachmentService attachService;

	@PostMapping(value = "/save")
	public String saveTenderingProcess(@ModelAttribute TenderingProcess tenderingProcessObj, Model model,
			HttpServletRequest request, @RequestParam("engfile") MultipartFile[] engfile,
			@RequestParam("telugufile") MultipartFile[] telugufile, HttpSession session) {
		System.out.println("Save called");
		boolean isSave = tenderingProcessObj.getId() == null;
		int workId = (int) session.getAttribute("workIdSession");

		tenderProcessService.saveTenderingProcess(tenderingProcessObj);
		attachService.saveAttachedDetails(workId, EnumFilter.TENDERPROCESSFORENG.getStatus(), engfile);
		attachService.saveAttachedDetails(workId, EnumFilter.TENDERPROCESSFORTEL.getStatus(), telugufile);

		return "redirect:/tenderEvaluation/" + (isSave ? "create" : "edit");

		/*
		 * String engModule = EnumFilter.TENDERPROCESSFORENG.getStatus(); String
		 * telModule = EnumFilter.TENDERPROCESSFORTEL.getStatus();
		 * 
		 * if (tenderingProcessObj.getId() == null) {
		 * 
		 * tenderProcessService.saveTenderingProcess(tenderingProcessObj);
		 * attachService.saveAttachedDetails(workId, engModule, engfile);
		 * attachService.saveAttachedDetails(workId, telModule, telugufile); isSave =
		 * true; } else {
		 * 
		 * //
		 * tenderProcess.updateTenderingProcess(tenderingProcessObj,engfile,telugufile);
		 * 
		 * // checking... agreementDetails is created or not AgreementDetails
		 * agreementDetails = agreementDetailService.getAgreementDetails(workId); if
		 * (agreementDetails == null) { isSave = true; } }
		 * 
		 * 
		 * 
		 * 
		 * Works workInfo = misService.getWorkInfo(workId);
		 * model.addAttribute("workInfo", workInfo);
		 * 
		 * session.setAttribute("tenderingIdSession", tenderingProcessObj.getId());
		 * 
		 * 
		 * 
		 * if (isSave == true) { return "redirect:/agreementDetails/create"; } else {
		 * return "redirect:/agreementDetails/edit/" + workId; }
		 */

	}

	@GetMapping(value = "/create")
	public String create(String workId, Model model, HttpServletRequest request) {
		/*
		 * HttpSession session = request.getSession(); userObject =
		 * SecurityUtil.getLoggedUser(); userObject =misService.verifyUser(userObject);
		 * model.addAttribute("tenderingProcessObj", new TenderingProcess());
		 * session.getAttribute("workInfo"); int workid = (int)
		 * session.getAttribute("workIdSession"); Works workInfo =
		 * misService.getWorkInfo(workid); model.addAttribute("workLineItems",
		 * workInfo.getWorkLineItemsList().get(0));
		 * session.setAttribute("loggedInUserObj", userObject);
		 * model.addAttribute("authoritiesTypeList",
		 * tenderProcess.getAuthoritiesList()); model.addAttribute("agencyList",
		 * tenderProcess.getAgencyList());
		 * 
		 * return "online-mis-tendering-process";
		 */

		HttpSession session = request.getSession();
		Works workInfo = misService.getWorkInfo(Integer.parseInt(workId));
		TenderingProcess tenderProcess = tenderProcessService.getTenderDetails(Integer.parseInt(workId));
		if (tenderProcess == null) {
			tenderProcess = new TenderingProcess();
			tenderProcess.setWork(workInfo);
		}

		model.addAttribute("tenderingProcessObj", tenderProcess);
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));
		model.addAttribute("workInfo", workInfo);
		model.addAttribute("authoritiesTypeList", tenderProcessService.getAuthoritiesList());
		model.addAttribute("agencyList", tenderProcessService.getAgencyList());
		session.setAttribute("workIdSession", workInfo.getId());
		return "online-mis-tendering-process";
	}

	@GetMapping(value = "/view")
	public String view(Model model, String workId, HttpServletRequest request) {
		TenderingProcess tenderInfo = tenderProcessService.getTenderDetails(Integer.parseInt(workId));
		List<Attachements> engAttachements = attachService.getAttachementsDetails(Integer.parseInt(workId),
				EnumFilter.TENDERPROCESSFORENG.getStatus());
		List<String> engFilePath = new ArrayList<String>();
		if (engAttachements.size() > 0) {
			for (Attachements engAttachDetails : engAttachements) {
				if (engAttachDetails.getPath() != null && !engAttachDetails.getPath().equals("")) {
					String engAttachmentPath = ContextUtil.populateContext(request) + engAttachDetails.getPath();
					engFilePath.add(engAttachmentPath);
					model.addAttribute("engUpload", engFilePath);

				} else {
					model.addAttribute("engUpload", null);
				}
			}
		}
		List<Attachements> telAttachements = attachService.getAttachementsDetails(Integer.parseInt(workId),
				EnumFilter.TENDERPROCESSFORTEL.getStatus());
		List<String> telFilePath = new ArrayList<String>();
		if (telAttachements.size() > 0) {
			for (Attachements telAttachDetails : telAttachements) {
				if (telAttachDetails.getPath() != null && !telAttachDetails.getPath().equals("")) {
					String telAttachmentPath = ContextUtil.populateContext(request) + telAttachDetails.getPath();
					telFilePath.add(telAttachmentPath);
					model.addAttribute("telUpload", telFilePath);

				} else {
					model.addAttribute("telUpload", null);
				}
			}
		}

		model.addAttribute("tenderInfo", tenderInfo);
		Works workInfo = misService.getWorkInfo(tenderInfo.getWork().getId());
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));
		AgreementDetails agreementInfo = agreementDetailService.getAgreementDetails(Integer.parseInt(workId));
		model.addAttribute("agreementInfo", agreementInfo);

		return "online-mis-tenderView";
	}

	@GetMapping(value = "/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("workIdSession", id);
		TenderingProcess tenderInfo = tenderProcessService.getTenderDetails(id);
		List<Attachements> engAttachements = attachService.getAttachementsDetails(id,
				EnumFilter.TENDERPROCESSFORENG.getStatus());
		List<String> engFilePath = new ArrayList<String>();
		if (engAttachements.size() > 0) {
			for (Attachements engAttachDetails : engAttachements) {
				if (engAttachDetails.getPath() != null && !engAttachDetails.getPath().equals("")) {
					String engAttachmentPath = ContextUtil.populateContext(request) + engAttachDetails.getPath();
					engFilePath.add(engAttachmentPath);
					model.addAttribute("engUpload", engFilePath);

				} else {
					model.addAttribute("engUpload", null);
				}
			}
		}
		List<Attachements> telAttachements = attachService.getAttachementsDetails(id,
				EnumFilter.TENDERPROCESSFORTEL.getStatus());
		List<String> telFilePath = new ArrayList<String>();
		if (telAttachements.size() > 0) {
			for (Attachements telAttachDetails : telAttachements) {
				if (telAttachDetails.getPath() != null && !telAttachDetails.getPath().equals("")) {
					String telAttachmentPath = ContextUtil.populateContext(request) + telAttachDetails.getPath();
					telFilePath.add(telAttachmentPath);
					model.addAttribute("telUpload", telFilePath);

				} else {
					model.addAttribute("telUpload", null);
				}
			}
		}
		/*
		 * if (tenderInfo.getEngUpload() != null &&
		 * !tenderInfo.getEngUpload().equals("")) {
		 * model.addAttribute("engUpload",ContextUtil.populateContext(request) +
		 * tenderInfo.getEngUpload()); } else { model.addAttribute("engUpload", null); }
		 * if (tenderInfo.getTelUpload() != null &&
		 * !tenderInfo.getTelUpload().equals("")) {
		 * model.addAttribute("telUpload",ContextUtil.populateContext(request) +
		 * tenderInfo.getTelUpload()); } else { model.addAttribute("telUpload", null); }
		 */
		Works workInfo = misService.getWorkInfo(tenderInfo.getWork().getId());
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));
		model.addAttribute("authoritiesTypeList", tenderProcessService.getAuthoritiesList());
		model.addAttribute("agencyList", tenderProcessService.getAgencyList());
		model.addAttribute("tenderingProcessObj", tenderInfo);
		return "online-mis-tendering-process";
	}

}
