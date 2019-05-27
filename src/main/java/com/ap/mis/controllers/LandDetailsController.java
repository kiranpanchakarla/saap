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

import com.ap.mis.entity.LandDetails;
import com.ap.mis.entity.User;
import com.ap.mis.model.WorktoLandDetails;
import com.ap.mis.service.AdministrativeSectionService;
import com.ap.mis.service.ConstituencyService;
import com.ap.mis.service.DistrictService;
import com.ap.mis.service.LandDetailService;
import com.ap.mis.service.MISService;
import com.ap.mis.service.MandalService;
import com.ap.mis.service.VillageService;
import com.ap.mis.util.ContextUtil;

@Controller
@RequestMapping("/landDetails")
public class LandDetailsController {
	private static final Logger log=Logger.getLogger(ContextUtil.class);
	@Autowired MISService misService;
	@Autowired DistrictService districtsService;
	@Autowired ConstituencyService  constituencyService;
	@Autowired MandalService  mandalService;
	@Autowired VillageService villageService;
	@Autowired AdministrativeSectionService administrativeSectionService;
	@Autowired LandDetailService landDetailService;

	
	@PostMapping(value = "/save")
	public String landDetailsSave(@ModelAttribute  LandDetails  landDetails,Model model,HttpServletRequest request,@RequestParam("file") MultipartFile file) {
		HttpSession session = request.getSession();
		User loggedInUser = (User) session.getAttribute("loggedInUserObj");
		landDetails.setUser(loggedInUser);
		
		int i = misService.landDetailsSave(landDetails,file);
		WorktoLandDetails obj = new WorktoLandDetails(); 
		if(i != 0){
			obj = (WorktoLandDetails) session.getAttribute("generalInfo");
			obj.setLanddetails(landDetails);
			session.setAttribute("generalInfo", obj);
			
			
		    model.addAttribute("districts", districtsService.findById(obj.getWorks().getDistrict()));
		    model.addAttribute("constituency", constituencyService.findById(obj.getWorks().getConstituency()));
		    model.addAttribute("mandal", mandalService.findById(obj.getWorks().getMandal()));
		    model.addAttribute("village", villageService.findById(obj.getWorks().getVillage()));
		    model.addAttribute("typeOfGrant", administrativeSectionService.findByGrantId(obj.getAdministrativeesction().getTypeOfGrant()));
		    model.addAttribute("financialYear", administrativeSectionService.findById(obj.getAdministrativeesction().getFinancialYear()));
		    model.addAttribute("executiveDept",administrativeSectionService.findByExecutiveDeptId(obj.getAdministrativeesction().getExecutiveDept()));
		    model.addAttribute("consultant", administrativeSectionService.findByExecutiveConsultantId(obj.getAdministrativeesction().getConsultant()));
		    model.addAttribute("division", landDetailService.findByDivisionId(obj.getDepartmentlinkingine().getDivisionName()));
		    model.addAttribute("subdivisionName",landDetailService.findBySubDivision(obj.getDepartmentlinkingine().getSubdivisionName()));
		    model.addAttribute("sectionName", landDetailService.findBySectionId(obj.getDepartmentlinkingine().getSectionName()));
			
			if (obj.getAdministrativeesction().getPath()!= null && !obj.getAdministrativeesction().getPath().equals("")) {
				model.addAttribute("filePath", ContextUtil.populateContext(request)+obj.getAdministrativeesction().getPath());
			} else {
				model.addAttribute("filePath", null);
			}
			
			if (obj.getLanddetails().getPath()!= null && !obj.getLanddetails().getPath().equals("")) {
			
				model.addAttribute("landfilePath", ContextUtil.populateContext(request)+obj.getLanddetails().getPath());
			} else {
				model.addAttribute("landfilePath", null);
			}
			
			return "online-mis-general-information";
		}
		else
			return "online-mis-land-details";		
	}
	
	@GetMapping(value = "/generalInfo")
    public String generalInformation(Model model) {
        return  "online-mis-consultant-information";
        
    }
}
