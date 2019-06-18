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
import com.ap.mis.entity.ConsultantInfo;
import com.ap.mis.entity.DepartmentLinkingLine;
import com.ap.mis.entity.LandDetails;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.model.WorktoLandDetails;
import com.ap.mis.service.AdministrativeSectionService;
import com.ap.mis.service.ConstituencyService;
import com.ap.mis.service.ConsultantInfoService;
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
	@Autowired
	ConsultantInfoService consultantInfoService;

	@PostMapping(value = "/save")
	public String landDetailsSave(@ModelAttribute LandDetails landDetails, Model model, HttpServletRequest request,
			@RequestParam("file") MultipartFile file, HttpSession session) {
		
		boolean isSave=false;
		User loggedInUser = SecurityUtil.getLoggedUser();
		landDetails.setUser(loggedInUser);
		
		if (landDetails.getId() == null) {
			landDetailService.landDetailsSave(landDetails, file);
			isSave = true;
		} else {
			landDetailService.landDetailsUpdate(landDetails, file);
		}
		WorktoLandDetails obj = new WorktoLandDetails();
		obj = (WorktoLandDetails) session.getAttribute("generalInfo");
		obj.setLanddetails(landDetails);
		session.setAttribute("generalInfo", obj);

		Works workInfo=misService.getWorkInfo(obj.getWorks().getId());
		model.addAttribute("workInfo",workInfo);
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));
		
		AdministrativeSection adminInfo = administrativeSectionService.getAdminInfo(obj.getAdministrativeesction().getId());
		model.addAttribute("adminInfo",adminInfo);
		
		DepartmentLinkingLine deptInfo = lineDepartmentService.getDeptInfo(obj.getDepartmentlinkingine().getId());
		model.addAttribute("deptInfo",deptInfo);
		
		LandDetails landinfo = landDetailService.getLandinfo(obj.getLanddetails().getId());
		model.addAttribute("landinfo",landinfo);
				
		if (isSave == true) {
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
		
			model.addAttribute("userRole", loggedInUser.getRole().getRoleName());
			
			 //checking... ConsultantInfo is created or not
			ConsultantInfo consultantInfo = consultantInfoService.getConsultDetails(landDetails.getWork().getId());
	        if(consultantInfo == null) {
	            isSave = true;
	        }  
			
			return "online-mis-general-information";
		} else {
			return "redirect:/ConsultantInfo/edit/" + landDetails.getWork().getId();
		}


	}

	@GetMapping(value = "/generalInfo")
	public String generalInformation(Model model) {
		return "online-mis-consultant-information";

	}
	
	@GetMapping(value = "/create")
	public String create(@ModelAttribute User userObject, Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		userObject = SecurityUtil.getLoggedUser();
	    userObject =misService.verifyUser(userObject);
		int workid = (int) session.getAttribute("workIdSession");
		Works workInfo = misService.getWorkInfo(workid);
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));
	    model.addAttribute("landDetails", new LandDetails());
		session.setAttribute("loggedInUserObj", userObject);
		session.getAttribute("workInfo");
		model.addAttribute("LandTypeList", landDetailService.getLandTypeList());
		return "online-mis-land-details";
	}
	
	
	@GetMapping(value = "/view")
	public String view(Model model, String workId,HttpServletRequest request) {
		LandDetails landInfo = landDetailService.getLandDetails(Integer.parseInt(workId));
		if (landInfo.getPath() != null && !landInfo.getPath().equals("")) {
			model.addAttribute("filePath",ContextUtil.populateContext(request) + landInfo.getPath());
		} else {
			model.addAttribute("filePath", null);
		}
		Works workInfo = misService.getWorkInfo(landInfo.getWork().getId());
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));
		model.addAttribute("landInfo",landInfo);
		
	    return "online-mis-landDetailsView";
	}
	
	
	@GetMapping(value = "/edit/{id}")
	public String edit(Model model,@PathVariable("id") Integer id,HttpServletRequest request) {
		LandDetails landInfo = landDetailService.getLandDetails(id);
		log.info("===landInfo===:"+landInfo);
		model.addAttribute("landDetails",landInfo);
		model.addAttribute("LandTypeList", landDetailService.getLandTypeList());
		Works workInfo = misService.getWorkInfo(landInfo.getWork().getId());
		model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));
		if (landInfo.getPath() != null && !landInfo.getPath().equals("")) {
			model.addAttribute("filePath",ContextUtil.populateContext(request) + landInfo.getPath());
		} else {
			model.addAttribute("filePath", null);
		}
		return "online-mis-land-details";
		
	}
	
	
	
	
}
