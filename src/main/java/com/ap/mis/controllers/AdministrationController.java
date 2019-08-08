package com.ap.mis.controllers;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.ap.mis.entity.Attachements;
import com.ap.mis.entity.DepartmentLinkingLine;
import com.ap.mis.entity.User;
import com.ap.mis.entity.WorkHistory;
import com.ap.mis.entity.Works;
import com.ap.mis.service.AdministrativeSectionService;
import com.ap.mis.service.AttachmentService;
import com.ap.mis.service.LineDepartmentService;
import com.ap.mis.service.MISService;
import com.ap.mis.service.WorkHistroyService;
import com.ap.mis.util.ContextUtil;
import com.ap.mis.util.EnumFilter;
import com.ap.mis.util.EnumWorkStatus;
import com.ap.mis.util.FileUploadConstraintsUtil;
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

	@Autowired
	FileUploadConstraintsUtil fileUploadConstraint;

	@Autowired
	AttachmentService attachmentService;

	@Autowired
	WorkHistroyService workHistroyService;

	@PostMapping(value = "/save/{workId}")
	public String administrativeSectionSave(@ModelAttribute AdministrativeSection adminSecObject, Model model,
			HttpServletRequest request, HttpSession session,@PathVariable("workId") Integer workid) {

		boolean isSave = false;
		if(workid==null) {
		 workid = (int) session.getAttribute("workIdSession");
		}
		/* Integer idVal = adminSecObject.getWork().getId(); */
		User loggedInUser = SecurityUtil.getLoggedUser();
		adminSecObject.setUser(loggedInUser);
		/* Integer workId=adminSecObject.getWork().getId(); */
		Works workInfo = misService.getWorkInfo(workid);
		/* String moduleName=EnumFilter.ADMIN.getStatus(); */

		WorkHistory workHistory = new WorkHistory();
		workHistory.setActionPerform(
				adminSecObject.getId() == null ? EnumFilter.SAVED.getStatus() : EnumFilter.UPDATED.getStatus());
		workHistory.setModule(EnumFilter.ADMINISTRATOR.getStatus());
		workHistory.setSubModule(EnumWorkStatus.ADMIN.getStatus());
		workHistory.setCreatedDate(new Date());
		workHistory.setUser(loggedInUser);
		workHistory.setWork(workInfo);
		workHistroyService.saveWorks(workHistory);

		if (adminSecObject.getId() == null) {
			isSave = true;
			admService.adminstrativeSectionSave(adminSecObject);
			workInfo.setStatus(EnumWorkStatus.ADMIN.getStatus());
			workInfo.setWorkStatus(EnumWorkStatus.ADMIN.getStatus());
			misService.updateWork(workInfo);

		} else {
			admService.adminstrativeSectionUpdate(adminSecObject);
			// checking... Department is created or not
			DepartmentLinkingLine deptInfo = lineDepartmentService.getdepartDetails(workid);
			if (deptInfo == null) {
				isSave = true;
			}
		}
		session.setAttribute("workIdSession", workid);
		session.setAttribute("workInfo", workInfo);

		/*
		 * WorktoLandDetails obj = new WorktoLandDetails(); obj = (WorktoLandDetails)
		 * session.getAttribute("generalInfo");
		 * obj.setAdministrativeSection(adminSecObject);
		 * session.setAttribute("generalInfo", obj);
		 */

		if (isSave == true) {
			return "redirect:/lineDepartment/create/" + workid;
		} else {
			return "redirect:/lineDepartment/edit/" + workid;
		}

	}

	@GetMapping(value = "/create/{workId}")
	public String create(@ModelAttribute User userObject, Model model, HttpServletRequest request,@PathVariable("workId") Integer workid) {
		HttpSession session = request.getSession();
		userObject = SecurityUtil.getLoggedUser();
		userObject = misService.verifyUser(userObject);
		model.addAttribute("adminSecObject", new AdministrativeSection());
		session.setAttribute("loggedInUserObj", userObject);
		session.getAttribute("workInfo");
		if(workid==null) {
		workid = (int) session.getAttribute("workIdSession");
		}
		Works workInfo = misService.getWorkInfo(workid);
		EnumFilter workModuleStatus = EnumFilter.ADMIN;
		model.addAttribute("moduleName", workModuleStatus.getStatus());
		model.addAttribute("workObject", workInfo);
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));
		model.addAttribute("grantTypeList", admService.findAll());
		model.addAttribute("finYearList", admService.getfinancialYearList());
		model.addAttribute("executiveDeptList", admService.getExecutiveDeptList());
		model.addAttribute("executiveConsultantList", admService.getExecutiveConsultantList());
		model.addAttribute("fileUploadConstraint", fileUploadConstraint);
		return "online-mis-administrative-section";
	}

	@GetMapping(value = "/view")
	public String view(Model model, String workId, HttpServletRequest request) {
		AdministrativeSection adminInfo = admService.getAdminDetails(Integer.parseInt(workId));
		List<Attachements> attachements = attachService.getAttachementsDetails(Integer.parseInt(workId),
				EnumFilter.ADMIN.getStatus());
		Map<String, String> attachFile = new HashMap<String, String>();
		for (Attachements attachDetails : attachements) {
			if (attachDetails.getPath() != null && !attachDetails.getPath().equals("")) {
				String attachmentPath = ContextUtil.populateContext(request) + attachDetails.getPath();
				String attachmentFileName = attachDetails.getPath()
						.substring(attachDetails.getPath().lastIndexOf('\\') + 1);
				attachFile.put(attachmentPath, attachmentFileName);
			}
		}
		model.addAttribute("filePath", attachFile);
		model.addAttribute("adminInfo", adminInfo);
		DepartmentLinkingLine departInfo = lineDepartmentService.getdepartDetails(Integer.parseInt(workId));
		model.addAttribute("deptInfo", departInfo);
		return "online-mis-adminView";
	}

	@GetMapping(value = "/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id, HttpServletRequest request, HttpSession session) {

		AdministrativeSection adminInfo = admService.getAdminDetails(id);
		int workId = adminInfo.getWork().getId();
		EnumFilter workModuleStatus = EnumFilter.ADMIN;
		session.setAttribute("workIdSession", workId);

		List<Attachements> attachments = attachmentService.getAttachementsDetails(workId, workModuleStatus.getStatus());
		Works workInfo = misService.getWorkInfo(adminInfo.getWork().getId());
		model.addAttribute("adminAttachmentFiles", attachments);
		model.addAttribute("moduleName", workModuleStatus.getStatus());
		model.addAttribute("workObject", adminInfo.getWork());
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));
		model.addAttribute("grantTypeList", admService.findAll());
		model.addAttribute("finYearList", admService.getfinancialYearList());
		model.addAttribute("executiveDeptList", admService.getExecutiveDeptList());
		model.addAttribute("executiveConsultantList", admService.getExecutiveConsultantList());
		model.addAttribute("adminSecObject", adminInfo);
		model.addAttribute("fileUploadConstraint", fileUploadConstraint);

		/*
		 * WorktoLandDetails obj = new WorktoLandDetails(); obj.setWorks(workInfo);
		 * session.setAttribute("generalInfo", obj);
		 */

		return "online-mis-administrative-section";
	}

}
