package com.ap.mis.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
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

import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.Attachements;
import com.ap.mis.entity.DepartmentLinkingLine;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.model.WorktoLandDetails;
import com.ap.mis.service.AdministrativeSectionService;
import com.ap.mis.service.AttachmentService;
import com.ap.mis.service.LineDepartmentService;
import com.ap.mis.service.MISService;
import com.ap.mis.util.ContextUtil;
import com.ap.mis.util.EnumFilter;
import com.ap.mis.util.EnumWorkStatus;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping("/administrativeSection")
public class AdministrationController {
	private static final Logger log = Logger.getLogger(AdministrationController.class);
	@Autowired
	MISService misService;

	@Autowired
	AdministrativeSectionService admService;
	
	@Autowired
	AttachmentService attachService;

	@Autowired
	LineDepartmentService lineDepartmentService;

	@PostMapping(value = "/save")
	public String administrativeSectionSave(@ModelAttribute AdministrativeSection adminSecObject, Model model,
			HttpServletRequest request, @RequestParam("file") MultipartFile[] file, HttpSession session) {

		boolean isSave = false;
		int workid = (int) session.getAttribute("workIdSession");
		Integer idVal = adminSecObject.getWork().getId();
		User loggedInUser = SecurityUtil.getLoggedUser();
		adminSecObject.setUser(loggedInUser);
		Integer workId=adminSecObject.getWork().getId();
		Works workInfo = misService.getWorkInfo(workid);
		String moduleName=EnumFilter.ADMIN.getStatus();
		if (adminSecObject.getId() == null) {
			isSave = true;
		    admService.adminstrativeSectionSave(adminSecObject);
		    workInfo.setStatus(EnumFilter.OPEN.getStatus());
		    workInfo.setWorkStatus(EnumWorkStatus.ADMIN.getStatus());
		    misService.updateWork(workInfo);
			attachService.saveAttachedDetails(workId,moduleName, file);
		} else {
			/*admService.adminstrativeSectionUpdate(adminSecObject, file);*/
			// checking... Department is created or not
			DepartmentLinkingLine deptInfo = lineDepartmentService.getdepartDetails(idVal);
			if (deptInfo == null) {
				isSave = true;
			}
		}
		
		session.setAttribute("workInfo", workInfo);

		WorktoLandDetails obj = new WorktoLandDetails();
		obj = (WorktoLandDetails) session.getAttribute("generalInfo");
		obj.setAdministrativeesction(adminSecObject);
		session.setAttribute("generalInfo", obj);

		log.info("==idVal===:" + idVal);
		if (isSave == true) {
			return "redirect:/lineDepartment/create";
		} else {
			return "redirect:/lineDepartment/edit/" + idVal;
		}

	}
	
	
	
	@GetMapping(value = "/create")
	public String create(@ModelAttribute User userObject, Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		userObject = SecurityUtil.getLoggedUser();
	    userObject =misService.verifyUser(userObject);
	    model.addAttribute("adminSecObject", new AdministrativeSection());
		session.setAttribute("loggedInUserObj", userObject);
		session.getAttribute("workInfo");
		int workid = (int) session.getAttribute("workIdSession");
		Works workInfo = misService.getWorkInfo(workid);
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));
		model.addAttribute("grantTypeList", admService.findAll());
		model.addAttribute("finYearList", admService.getfinancialYearList());
		model.addAttribute("executiveDeptList", admService.getExecutiveDeptList());
		model.addAttribute("executiveConsultantList", admService.getExecutiveConsultantList());
	    return "online-mis-administrative-section";
	}
	
	@GetMapping(value = "/view")
	public String view(Model model, String workId,HttpServletRequest request) {
		AdministrativeSection adminInfo = admService.getAdminDetails(Integer.parseInt(workId));
		log.info("===adminInfo===:"+adminInfo);
		
		List<Attachements> attachements=attachService.getAttachementsDetails(Integer.parseInt(workId),EnumFilter.ADMIN.getStatus());
		List<String> filePath = new ArrayList<String>();
		log.info("===attachements===:"+attachements);
		for(Attachements attachDetails :attachements) {
			if (attachDetails.getPath() != null && !attachDetails.getPath().equals("")) {
				String attachmentPath=ContextUtil.populateContext(request) + attachDetails.getPath();
				log.info("==attachmentPath==:"+attachmentPath);
				filePath.add(attachmentPath);
				model.addAttribute("filePath",filePath);
				
			} else {
				model.addAttribute("filePath", null);
			}
		}
		
		model.addAttribute("adminInfo",adminInfo);
		DepartmentLinkingLine departInfo = lineDepartmentService.getdepartDetails(Integer.parseInt(workId));
		model.addAttribute("deptInfo",departInfo);
	    return "online-mis-adminView";
	}
	
	@GetMapping(value = "/edit/{id}")
	public String edit(Model model,@PathVariable("id") Integer id,HttpServletRequest request,HttpSession session) {
		
		AdministrativeSection adminInfo = admService.getAdminDetails(id);
		List<Attachements> attachements=attachService.getAttachementsDetails(id,EnumFilter.ADMIN.getStatus());
		List<String> filePath = new ArrayList<String>();
		List<String> fileName = new ArrayList<String>();
		log.info("===attachements===:"+attachements);
		for(Attachements attachDetails :attachements) {
			if (attachDetails.getPath() != null && !attachDetails.getPath().equals("")) {
				String attachmentPath=ContextUtil.populateContext(request) + attachDetails.getPath();
				String fileNameVal=attachDetails.getPath().substring(attachDetails.getPath().lastIndexOf('\\') + 1);
				log.info("==attachmentPath==:"+attachmentPath);
				filePath.add(attachmentPath);
				fileName.add(fileNameVal);
				model.addAttribute("filePath",filePath);
				model.addAttribute("fileName",fileName);
				
			} else {
				model.addAttribute("filePath", null);
			}
		}
		
	
		Works workInfo = misService.getWorkInfo(adminInfo.getWork().getId());
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));
		model.addAttribute("grantTypeList", admService.findAll());
		model.addAttribute("finYearList", admService.getfinancialYearList());
		model.addAttribute("executiveDeptList", admService.getExecutiveDeptList());
		model.addAttribute("executiveConsultantList", admService.getExecutiveConsultantList());
		model.addAttribute("adminSecObject",adminInfo);
		
		return "online-mis-administrative-section";
	}
	
	
	
	
	
}
