package com.ap.mis.controllers;

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
import com.ap.mis.entity.DepartmentLinkingLine;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.model.WorktoLandDetails;
import com.ap.mis.service.AdministrativeSectionService;
import com.ap.mis.service.LineDepartmentService;
import com.ap.mis.service.MISService;
import com.ap.mis.util.ContextUtil;
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
	LineDepartmentService lineDepartmentService;

	@PostMapping(value = "/save")
	public String administrativeSectionSave(@ModelAttribute AdministrativeSection adminSecObject, Model model,
			HttpServletRequest request, @RequestParam("file") MultipartFile file, HttpSession session) {

		boolean isSave = false;
		int workid = (int) session.getAttribute("workIdSession");
		Integer idVal = adminSecObject.getWork().getId();
		User loggedInUser = SecurityUtil.getLoggedUser();
		adminSecObject.setUser(loggedInUser);
		if (adminSecObject.getId() == null) {
			isSave = true;
			admService.adminstrativeSection(adminSecObject, file);
		} else {
			admService.adminstrativeSectionUpdate(adminSecObject, file);
			// checking... Department is created or not
			DepartmentLinkingLine deptInfo = lineDepartmentService.getdepartDetails(idVal);
			if (deptInfo == null) {
				isSave = true;
			}
		}
		Works workInfo = misService.getWorkInfo(workid);
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
		
		if (adminInfo.getPath() != null && !adminInfo.getPath().equals("")) {
			model.addAttribute("filePath",ContextUtil.populateContext(request) + adminInfo.getPath());
		} else {
			model.addAttribute("filePath", null);
		}
		model.addAttribute("adminInfo",adminInfo);
		DepartmentLinkingLine departInfo = lineDepartmentService.getdepartDetails(Integer.parseInt(workId));
		model.addAttribute("deptInfo",departInfo);
	    return "online-mis-adminView";
	}
	
	@GetMapping(value = "/edit/{id}")
	public String edit(Model model,@PathVariable("id") Integer id,HttpServletRequest request,HttpSession session) {
		
		AdministrativeSection adminInfo = admService.getAdminDetails(id);
	   if (adminInfo.getPath() != null && !adminInfo.getPath().equals("")) {
			model.addAttribute("filePath",ContextUtil.populateContext(request) + adminInfo.getPath());
			/*model.addAttribute("fileName",adminInfo.getPath().substring(adminInfo.getPath().lastIndexOf('\\') + 1));*/
			
		} else {
			model.addAttribute("filePath", null);
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
