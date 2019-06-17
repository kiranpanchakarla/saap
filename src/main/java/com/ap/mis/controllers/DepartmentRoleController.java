package com.ap.mis.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.DepartmentLinkingLine;
import com.ap.mis.entity.LandDetails;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.service.AdministrativeSectionService;
import com.ap.mis.service.LandDetailService;
import com.ap.mis.service.LineDepartmentService;
import com.ap.mis.service.MISService;
import com.ap.mis.util.ContextUtil;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping("/department")
public class DepartmentRoleController {

	@Autowired
	MISService misService;
	
	@Autowired
	AdministrativeSectionService admService;
	
	@Autowired
	LandDetailService landDetailService;
	
	@Autowired
	LineDepartmentService lineDepartmentService;
	
	@GetMapping(value = "/view")
	public String view(Model model, String workId,HttpServletRequest request,HttpSession session) {
		/*Work Details*/
		Works workInfo=misService.getWorkInfo(Integer.parseInt(workId));
		model.addAttribute("workInfo",workInfo);
		session.setAttribute("workIdSession", Integer.parseInt(workId));
		/*Administrative Sanction Details*/
		
        AdministrativeSection adminInfo = admService.getAdminDetails(Integer.parseInt(workId));
		
		if (adminInfo.getPath() != null && !adminInfo.getPath().equals("")) {
			model.addAttribute("filePath",ContextUtil.populateContext(request) + adminInfo.getPath());
		} else {
			model.addAttribute("filePath", null);
		}
		model.addAttribute("adminInfo",adminInfo);
		
		/*Land Details*/
		LandDetails landInfo = landDetailService.getLandDetails(Integer.parseInt(workId));
		if (landInfo.getPath() != null && !landInfo.getPath().equals("")) {
			model.addAttribute("filePath",ContextUtil.populateContext(request) + landInfo.getPath());
		} else {
			model.addAttribute("filePath", null);
		}
		model.addAttribute("landInfo",landInfo);
		
		DepartmentLinkingLine deptInfo = lineDepartmentService.getdepartDetails(Integer.parseInt(workId));
		model.addAttribute("deptInfo",deptInfo);
		
		User loggedInUser = SecurityUtil.getLoggedUser();
		model.addAttribute("userRole", loggedInUser.getRole().getRoleName());
		
	    return "online-mis-departmentRoleView";
	}
}
