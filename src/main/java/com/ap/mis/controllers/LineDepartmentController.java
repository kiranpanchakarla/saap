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

import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.DepartmentLinkingLine;
import com.ap.mis.entity.LandDetails;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.model.WorktoLandDetails;
import com.ap.mis.service.LandDetailService;
import com.ap.mis.service.LineDepartmentService;
import com.ap.mis.service.MISService;
import com.ap.mis.util.EnumFilter;
import com.ap.mis.util.EnumWorkStatus;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping("/lineDepartment")
public class LineDepartmentController {
	private static final Logger log = Logger.getLogger(LineDepartmentController.class);
	@Autowired
	MISService misService;
	@Autowired
	LandDetailService landDetailService;
	@Autowired
	LineDepartmentService lineDepartService;

	@PostMapping(value = "/save")
	public String lineDepatmentSave(@ModelAttribute DepartmentLinkingLine lineDeptObj, Model model,
			HttpServletRequest request, HttpSession session) {
		boolean isSave=false;
		User loggedInUser = SecurityUtil.getLoggedUser();
		int workid = (int) session.getAttribute("workIdSession");
		Integer idVal=lineDeptObj.getWork().getId();
		Works workInfo = misService.getWorkInfo(workid);
		session.setAttribute("workInfo", workInfo);
		
		lineDeptObj.setUser(loggedInUser);
		if(lineDeptObj.getId()==null) {
			log.info("inside save:"+lineDeptObj.getId());
			isSave=true;
		    lineDepartService.departmentLinkingLineSave(lineDeptObj);
		    workInfo.setStatus(EnumFilter.OPEN.getStatus());
		    workInfo.setWorkStatus(EnumWorkStatus.DEPARTMENT.getStatus());
		    misService.updateWork(workInfo);
		}else {
			log.info("inside update:"+lineDeptObj.getId());
			lineDepartService.departmentLinkingLineUpdate(lineDeptObj);
			 //checking... LandDetails is created or not
			LandDetails landInfo = landDetailService.getLandDetails(idVal);
	        if(landInfo == null) {
	            isSave = true;
	        } 
		}
		
		
		WorktoLandDetails obj = new WorktoLandDetails();
        obj = (WorktoLandDetails) session.getAttribute("generalInfo");
		obj.setDepartmentlinkingine(lineDeptObj);
		session.setAttribute("generalInfo", obj);
		if(isSave==true) {
		return "redirect:/landDetails/create";
		}else {
	    return "redirect:/landDetails/edit/"+idVal;
		}
		
	}
	
	@GetMapping(value = "/create")
	public String create(@ModelAttribute User userObject, Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		userObject = SecurityUtil.getLoggedUser();
	    userObject =misService.verifyUser(userObject);
	    model.addAttribute("lineDeptObj", new DepartmentLinkingLine());
		session.setAttribute("loggedInUserObj", userObject);
		session.getAttribute("workInfo");
		model.addAttribute("divisionList", lineDepartService.getDivisionList());
		model.addAttribute("subdivisionList", lineDepartService.getSubdivisionList());
		model.addAttribute("sectionList", lineDepartService.getSectionList());
	    return "online-mis-line-department";
	}
	
	@GetMapping(value = "/view")
	public String view(Model model, String workId) {
		DepartmentLinkingLine departInfo = lineDepartService.getdepartDetails(Integer.parseInt(workId));
		model.addAttribute("deptInfo",departInfo);
		LandDetails landInfo = landDetailService.getLandDetails(Integer.parseInt(workId));
		model.addAttribute("landInfo",landInfo);
	    return "online-mis-departView";
	}
	
	@GetMapping(value = "/edit/{id}")
	public String edit(Model model, String workId,@PathVariable("id") Integer id) {
		DepartmentLinkingLine departInfo = lineDepartService.getdepartDetails(id);
		model.addAttribute("divisionList", lineDepartService.getDivisionList());
		model.addAttribute("subdivisionList", lineDepartService.getSubdivisionList());
		model.addAttribute("sectionList", lineDepartService.getSectionList());
		model.addAttribute("lineDeptObj",departInfo);
		return "online-mis-line-department";
	}
	
	
	
}
