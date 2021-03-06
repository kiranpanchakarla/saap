package com.ap.mis.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.ap.mis.entity.GeotechnicalInvestigation;
import com.ap.mis.entity.LandDetails;
import com.ap.mis.entity.LandSurveyDetails;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.service.AdministrativeSectionService;
import com.ap.mis.service.AttachmentService;
import com.ap.mis.service.ConsultantInfoService;
import com.ap.mis.service.GeotechnicalInvestigationService;
import com.ap.mis.service.LandDetailService;
import com.ap.mis.service.LandSurveyDetailService;
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
	
	@Autowired
	LandSurveyDetailService landSurveyDetailsService;
	
	@Autowired
	GeotechnicalInvestigationService geotechnicalInvestigation;
	
	@GetMapping(value = "/view")
	public String view(Model model, String workId,HttpServletRequest request,HttpSession session) {
		/*Work Details*/
		Works workInfo=misService.getWorkInfo(Integer.parseInt(workId));
		model.addAttribute("workInfo",workInfo);
		model.addAttribute("workLineItems",workInfo.getWorkLineItemsList().get(0));
		model.addAttribute("workObject", workInfo);
		session.setAttribute("workIdSession", Integer.parseInt(workId));
		
		/*Administrative Sanction Details*/
		
        AdministrativeSection adminInfo = admService.getAdminDetails(Integer.parseInt(workId));
        List<Attachements> adminattachements=attachService.getAttachementsDetails(Integer.parseInt(workId),EnumFilter.ADMIN.getStatus());
        Map<String, String> adminFile = new HashMap<String, String>();
		for(Attachements adminattachDetails :adminattachements) {
			if (adminattachDetails.getPath() != null && !adminattachDetails.getPath().equals("")) {
				String adminattachmentPath=ContextUtil.populateContext(request) + adminattachDetails.getPath();
				String fileNameVal=adminattachDetails.getPath().substring(adminattachDetails.getPath().lastIndexOf('\\') + 1);
				adminFile.put(fileNameVal, adminattachmentPath);
				model.addAttribute("adminFile",adminFile);
				
			} else {
				model.addAttribute("filePath", null);
			}
		}
		model.addAttribute("adminInfo",adminInfo);
		LandDetails landInfo = landDetailService.getLandDetails(Integer.parseInt(workId));
		Map<String, String> landFile = new HashMap<String, String>();
		List<Attachements> landattachements=attachService.getAttachementsDetails(Integer.parseInt(workId),EnumFilter.LANDDETAILS.getStatus());
		for(Attachements landattachDetails :landattachements) {
			if (landattachDetails.getPath() != null && !landattachDetails.getPath().equals("")) {
				String landattachmentPath=ContextUtil.populateContext(request) + landattachDetails.getPath();
				String fileNameVal=landattachDetails.getPath().substring(landattachDetails.getPath().lastIndexOf('\\') + 1);
				landFile.put(fileNameVal, landattachmentPath);
				model.addAttribute("landFile",landFile);
				
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
		model.addAttribute("consltInfo",consltInfo);
		
		LandSurveyDetails existedLandSurveyDetails = landSurveyDetailsService.findByWork(workInfo);
		model.addAttribute("landSurvey",existedLandSurveyDetails);
		
		GeotechnicalInvestigation geotechnicalInvestigationDetails = geotechnicalInvestigation.findByWork(workInfo);
		model.addAttribute("investigation",geotechnicalInvestigationDetails);
		
	    return "online-mis-consultantRoleView";
	}
}
