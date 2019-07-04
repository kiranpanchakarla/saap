package com.ap.mis.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.Attachements;
import com.ap.mis.entity.ConsultantInfo;
import com.ap.mis.entity.DepartmentLinkingLine;
import com.ap.mis.entity.LandDetails;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.service.AdministrativeSectionService;
import com.ap.mis.service.AttachmentService;
import com.ap.mis.service.ConsultantInfoService;
import com.ap.mis.service.LandDetailService;
import com.ap.mis.service.LineDepartmentService;
import com.ap.mis.service.MISService;
import com.ap.mis.util.ContextUtil;
import com.ap.mis.util.EnumFilter;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping("/consultant")
public class ConsultantRoleController {

	@Autowired
	MISService misService;
	
	@Autowired
	AdministrativeSectionService admService;
	
	@Autowired
	LandDetailService landDetailService;
	
	@Autowired
	LineDepartmentService lineDepartmentService;
	
	@Autowired
	AttachmentService attachService;
	
	@Autowired ConsultantInfoService consultantInfoService;
	
	@GetMapping(value = "/view")
	public String view(Model model, String workId,HttpServletRequest request,HttpSession session) {
		/*Work Details*/
		Works workInfo=misService.getWorkInfo(Integer.parseInt(workId));
		model.addAttribute("workInfo",workInfo);
		session.setAttribute("workIdSession", Integer.parseInt(workId));
		/*Administrative Sanction Details*/
		
        AdministrativeSection adminInfo = admService.getAdminDetails(Integer.parseInt(workId));
        List<Attachements> adminattachements=attachService.getAttachementsDetails(Integer.parseInt(workId),EnumFilter.ADMIN.getStatus());
		List<String> filePath = new ArrayList<String>();
		for(Attachements adminattachDetails :adminattachements) {
			if (adminattachDetails.getPath() != null && !adminattachDetails.getPath().equals("")) {
				String adminattachmentPath=ContextUtil.populateContext(request) + adminattachDetails.getPath();
				filePath.add(adminattachmentPath);
				model.addAttribute("filePath",filePath);
				
			} else {
				model.addAttribute("filePath", null);
			}
		}
		model.addAttribute("adminInfo",adminInfo);
		LandDetails landInfo = landDetailService.getLandDetails(Integer.parseInt(workId));
		List<String> landFilePath = new ArrayList<String>();
		List<Attachements> landattachements=attachService.getAttachementsDetails(Integer.parseInt(workId),EnumFilter.LANDDETAILS.getStatus());
		for(Attachements landattachDetails :landattachements) {
			if (landattachDetails.getPath() != null && !landattachDetails.getPath().equals("")) {
				String landattachmentPath=ContextUtil.populateContext(request) + landattachDetails.getPath();
				landFilePath.add(landattachmentPath);
				model.addAttribute("landfilePath",landFilePath);
				
			} else {
				model.addAttribute("landfilePath", null);
			}
		}
		model.addAttribute("landInfo",landInfo);
		
		DepartmentLinkingLine deptInfo = lineDepartmentService.getdepartDetails(Integer.parseInt(workId));
		model.addAttribute("deptInfo",deptInfo);
		
		User loggedInUser = SecurityUtil.getLoggedUser();
		model.addAttribute("userRole", loggedInUser.getRole().getRoleName());
		
		ConsultantInfo consltInfo = consultantInfoService.getConsultDetails(Integer.parseInt(workId));
		model.addAttribute("consultantInfoObject",consltInfo);
		
	    return "online-mis-consultantRoleView";
	}
}
