package com.ap.mis.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.Attachements;
import com.ap.mis.entity.ConsultantInfo;
import com.ap.mis.entity.DepartmentLinkingLine;
import com.ap.mis.entity.GeotechnicalInvestigation;
import com.ap.mis.entity.LandDetails;
import com.ap.mis.entity.LandSurveyDetails;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.model.ViewDetails;
import com.ap.mis.service.AdministrativeSectionService;
import com.ap.mis.service.AttachmentService;
import com.ap.mis.service.ConsultantInfoService;
import com.ap.mis.service.GeotechnicalInvestigationService;
import com.ap.mis.service.LandDetailService;
import com.ap.mis.service.LandSurveyDetailService;
import com.ap.mis.service.LineDepartmentService;
import com.ap.mis.service.MISService;
import com.ap.mis.service.ViewDetailsService;
import com.ap.mis.util.ContextUtil;
import com.ap.mis.util.EnumFilter;
import com.ap.mis.util.EnumWorkStatus;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping(path="/workApprovals")
public class WorkApprovalController {
	
	private static final Logger log = Logger.getLogger(WorkApprovalController.class);
	
	@Autowired
	ViewDetailsService viewDetailsService;

	
	@Autowired
	AttachmentService attachmentService;

	@Autowired
	MISService misService;

	@Autowired
	ConsultantInfoService consultantService;

	@Autowired
	LandSurveyDetailService landSurveyDetailsService;

	@Autowired
	LandDetailService LandDetailService;

	@Autowired
	GeotechnicalInvestigationService geotechnicalInvestigationService;
	
	@Autowired
	LineDepartmentService lineDepartmentService;
	
	@Autowired
	AdministrativeSectionService admService;


	
	@RequestMapping(value = "/pending" , method = RequestMethod.GET)
	public String viewDetails(@ModelAttribute User userObject, Model model,HttpServletRequest request) {
		
		User loggedInUser = SecurityUtil.getLoggedUser();
		model.addAttribute("userRole", loggedInUser.getRole().getRoleName());
		
		List<ViewDetails> viewList = viewDetailsService.getApprovalDetials();
		model.addAttribute("viewList", viewList); 
		
		return "online-mis-approval";
	}
	
	
	@GetMapping(path="/work/{workId}")
	public String loadPendingWorkAprroval(Model model, HttpSession session, @PathVariable(value="workId") Integer workId, HttpServletRequest request) {

			session.setAttribute("workIdSession", workId);
			
			log.info("Work id " + workId);
			
			/*Work Details*/
			Works work=misService.getWorkInfo(workId);
			model.addAttribute("work",work);
			
			/*Administrative Sanction Details*/
			
	        AdministrativeSection adminInfo = admService.getAdminDetails(workId);
	        List<Attachements> adminattachements=attachmentService.getAttachementsDetails(workId,EnumFilter.ADMIN.getStatus());
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
			LandDetails landInfo = LandDetailService.getLandDetails(workId);
			Map<String, String> landFile = new HashMap<String, String>();
			List<Attachements> landattachements=attachmentService.getAttachementsDetails(workId,EnumFilter.LANDDETAILS.getStatus());
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
			
			DepartmentLinkingLine deptInfo = lineDepartmentService.getdepartDetails(workId);
			model.addAttribute("deptInfo",deptInfo);
			
			User loggedInUser = SecurityUtil.getLoggedUser();
			model.addAttribute("userRole", loggedInUser.getRole().getRoleName());
			
			ConsultantInfo consultant = consultantService.getConsultDetails(workId);
			
								
			LandDetails landDetail = LandDetailService.getLandDetails(workId);
			LandSurveyDetails landSurveyDetails = landSurveyDetailsService.findByWork(work);
			landSurveyDetails.setLandDetails(landDetail);

			GeotechnicalInvestigation geotechnicalInvestigation = geotechnicalInvestigationService.findByWork(work);

			List<Attachements> landSurveyAttachmentFiles = attachmentService.getAttachementsDetails(workId,
					EnumFilter.LAND_SURVEY_DETAILS.getStatus());
			List<Attachements> PPLayoutAttachmentFiles = attachmentService.getAttachementsDetails(workId,
					EnumFilter.PRELIMINARY_PREPARATION_LAYOUT.getStatus());
			List<Attachements> GIAttachmentFiles = attachmentService.getAttachementsDetails(workId,
					EnumFilter.GEOTECHNICAL_INVESTIGATION.getStatus());

		
			model.addAttribute("consultant", consultant);
			model.addAttribute("workLineItems", work.getWorkLineItemsList().get(0));
			model.addAttribute("landSurveyDetails", landSurveyDetails);
			model.addAttribute("geotechnicalInvestigation", geotechnicalInvestigation);

			model.addAttribute("landAttachmentFiles", landattachements);
			model.addAttribute("landSurveyAttachmentFiles", landSurveyAttachmentFiles);
			model.addAttribute("PPLayoutAttachmentFiles", PPLayoutAttachmentFiles);
			model.addAttribute("GIAttachmentFiles", GIAttachmentFiles);
			model.addAttribute("SAAP_APPROVED_STATUS", EnumWorkStatus.SAAP_APPROVED.getStatus());
			model.addAttribute("PENDING_SAAP_APPROVAL", EnumWorkStatus.PENDING_SAAP_APPROVAL.getStatus());
			return "online-mis-work-consultancy-approvals";
	}
	
}
