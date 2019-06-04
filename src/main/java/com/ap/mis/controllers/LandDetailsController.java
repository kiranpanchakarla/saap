package com.ap.mis.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.DepartmentLinkingLine;
import com.ap.mis.entity.LandDetails;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.model.WorktoLandDetails;
import com.ap.mis.service.AdministrativeSectionService;
import com.ap.mis.service.ConstituencyService;
import com.ap.mis.service.DistrictService;
import com.ap.mis.service.LandDetailService;
import com.ap.mis.service.LineDepartmentService;
import com.ap.mis.service.MISService;
import com.ap.mis.service.MandalService;
import com.ap.mis.service.VillageService;
import com.ap.mis.util.ContextUtil;
import com.ap.mis.util.SecurityUtil;

@Controller
@RequestMapping("/landDetails")
public class LandDetailsController {
	private static final Logger log = Logger.getLogger(ContextUtil.class);
	@Autowired
	MISService misService;
	@Autowired
	DistrictService districtsService;
	@Autowired
	ConstituencyService constituencyService;
	@Autowired
	MandalService mandalService;
	@Autowired
	VillageService villageService;
	@Autowired
	AdministrativeSectionService administrativeSectionService;
	@Autowired
	LandDetailService landDetailService;
	@Autowired
	LineDepartmentService lineDepartmentService;

	@PostMapping(value = "/save")
	public String landDetailsSave(@ModelAttribute LandDetails landDetails, Model model, HttpServletRequest request,
			@RequestParam("file") MultipartFile file, HttpSession session) {

		User loggedInUser = SecurityUtil.getLoggedUser();
		landDetails.setUser(loggedInUser);
		landDetailService.landDetailsSave(landDetails, file);
		
		WorktoLandDetails obj = new WorktoLandDetails();
		obj = (WorktoLandDetails) session.getAttribute("generalInfo");
		obj.setLanddetails(landDetails);
		session.setAttribute("generalInfo", obj);

		Works workInfo=misService.getWorkInfo(obj.getWorks().getId());
		model.addAttribute("workInfo",workInfo);
		
		AdministrativeSection adminInfo = administrativeSectionService.getAdminInfo(obj.getAdministrativeesction().getId());
		model.addAttribute("adminInfo",adminInfo);
		
		DepartmentLinkingLine deptInfo = lineDepartmentService.getDeptInfo(obj.getDepartmentlinkingine().getId());
		model.addAttribute("deptInfo",deptInfo);
		
		LandDetails landinfo = landDetailService.getLandinfo(obj.getLanddetails().getId());
		model.addAttribute("landinfo",landinfo);
		
		
/*		model.addAttribute("districts", districtsService.findById(obj.getWorks().getDistrict()));
		model.addAttribute("constituency", constituencyService.findById(obj.getWorks().getConstituency()));
		model.addAttribute("mandal", mandalService.findById(obj.getWorks().getMandal()));
		model.addAttribute("village", villageService.findById(obj.getWorks().getVillage()));
		model.addAttribute("typeOfGrant",
				administrativeSectionService.findByGrantId(obj.getAdministrativeesction().getTypeOfGrant()));
		model.addAttribute("financialYear",
				administrativeSectionService.findById(obj.getAdministrativeesction().getFinancialYear()));
		model.addAttribute("executiveDept",
				administrativeSectionService.findByExecutiveDeptId(obj.getAdministrativeesction().getExecutiveDept()));
		model.addAttribute("consultant", administrativeSectionService
				.findByExecutiveConsultantId(obj.getAdministrativeesction().getConsultant()));
		model.addAttribute("division",
				landDetailService.findByDivisionId(obj.getDepartmentlinkingine().getDivisionName()));
		model.addAttribute("subdivisionName",
				landDetailService.findBySubDivision(obj.getDepartmentlinkingine().getSubdivisionName()));
		model.addAttribute("sectionName",
				landDetailService.findBySectionId(obj.getDepartmentlinkingine().getSectionName()));
*/
		if (obj.getAdministrativeesction().getPath() != null && !obj.getAdministrativeesction().getPath().equals("")) {
			model.addAttribute("filePath",
					ContextUtil.populateContext(request) + obj.getAdministrativeesction().getPath());
		} else {
			model.addAttribute("filePath", null);
		}

		if (obj.getLanddetails().getPath() != null && !obj.getLanddetails().getPath().equals("")) {

			model.addAttribute("landfilePath", ContextUtil.populateContext(request) + obj.getLanddetails().getPath());
		} else {
			model.addAttribute("landfilePath", null);
		}

		return "online-mis-general-information";

	}

	@GetMapping(value = "/generalInfo")
	public String generalInformation(Model model) {
		return "online-mis-consultant-information";

	}
}
