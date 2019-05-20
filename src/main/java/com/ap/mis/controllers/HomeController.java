package com.ap.mis.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.AgreementDetails;
import com.ap.mis.entity.Constituency;
import com.ap.mis.entity.ConsultantInfo;
import com.ap.mis.entity.DepartmentLinkingLine;
import com.ap.mis.entity.District;
import com.ap.mis.entity.LandDetails;
import com.ap.mis.entity.Mandal;
import com.ap.mis.entity.TechnicalSanction;
import com.ap.mis.entity.TenderingProcess;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Village;
import com.ap.mis.entity.Works;
import com.ap.mis.model.WorktoLandDetails;
import com.ap.mis.service.ConstituencyService;
import com.ap.mis.service.DistrictService;
import com.ap.mis.service.MISService;
import com.ap.mis.service.MandalService;
import com.ap.mis.service.VillageService;
import com.ap.mis.util.SecurityUtil;

@Controller
public class HomeController {
	
	
	@Autowired MISService misService;
	@Autowired DistrictService districtsService;
	@Autowired MandalService  mandalService;
	@Autowired VillageService villageService;
	@Autowired ConstituencyService  constituencyService;
	
	
	/*@RequestMapping(value = "/")
	public String loginPageDisplay(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("generalInfo");
		session.removeAttribute("loggedInUserObj");
		return "online-admin";
	}*/
	
	@RequestMapping(value = "/adminloggedin" , method = RequestMethod.GET)
	public String validatingLoginUser(@ModelAttribute User userObject, Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		userObject = SecurityUtil.getLoggedUser();
		model.addAttribute("districts", districtsService.findAll());
		model.addAttribute("allMandals", mandalService.findAll());
		model.addAttribute("allVillages", villageService.findAll());
		model.addAttribute("allConstituencs", constituencyService.findAll());
		userObject =misService.verifyUser(userObject);
		session.setAttribute("loggedInUserObj", userObject);
		//if(userObject != null && userObject.getRole().getRoleName().equalsIgnoreCase("ADMIN"))
			return "online-mis";
		//else
			//model.addAttribute("invalidUser", "invalidUser");
		//	return "online-admin";
		
	} 
	
	/*@RequestMapping(value = "/worksCreation", method = RequestMethod.GET)
	public String workCreationSave(@ModelAttribute  Works  workObject,Model model,HttpServletRequest request) {
		System.out.println("workObject :"+workObject);
		HttpSession session = request.getSession();
		User loggedInUser = (User) session.getAttribute("loggedInUserObj");
		loggedInUser = SecurityUtil.getLoggedUser();
		workObject.setUser(loggedInUser);
		WorktoLandDetails obj = new WorktoLandDetails(); 
		int i = misService.saveWorks(workObject);
		if(i != 0){
			obj.setWorks(workObject);
			session.setAttribute("generalInfo", obj);
			
			session.setAttribute("workIdSession", i);
			return  "online-mis-administrative-section";
		}
		else
			return "online-mis";
	}*/
	
	/*@RequestMapping(value = "/adminSection", method = RequestMethod.GET)
	public String administrativeSectionSave(@ModelAttribute  AdministrativeSection  adminSecObject,Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		User loggedInUser = (User) session.getAttribute("loggedInUserObj");
		adminSecObject.setUser(loggedInUser);
		int i = misService.adminstrativeSectionSave(adminSecObject);
		WorktoLandDetails obj = new WorktoLandDetails(); 
		if(i != 0){
			obj = (WorktoLandDetails) session.getAttribute("generalInfo");
		    obj.setAdministrativeesction(adminSecObject);
		    session.setAttribute("generalInfo", obj);
			return  "online-mis-line-department";
		}
		else
			return "online-mis-administrative-section";
	}*/
	
	@RequestMapping(value = "/lineDepartment", method = RequestMethod.POST)
	public String lineDepatmentSave(@ModelAttribute  DepartmentLinkingLine  lineDeptObj,Model model,HttpServletRequest request) {
		Works  workInfo=null;
		HttpSession session = request.getSession();
		int wrokid =(int) session.getAttribute("workIdSession");
		User loggedInUser = (User) session.getAttribute("loggedInUserObj");
		lineDeptObj.setUser(loggedInUser);	
		int i = misService.departmentLinkingLineSave(lineDeptObj);
		workInfo=misService.getWorkInfo(wrokid);
		model.addAttribute("workInfo", workInfo);
		WorktoLandDetails obj = new WorktoLandDetails(); 
		if(i != 0){
			obj = (WorktoLandDetails) session.getAttribute("generalInfo");
			obj.setDepartmentlinkingine(lineDeptObj);
			session.setAttribute("generalInfo", obj);
			return "online-mis-land-details";
		}
		else
			return  "online-mis-line-department";
	}
	
	@RequestMapping(value = "/landDetails", method = RequestMethod.POST)
	public String landDetailsSave(@ModelAttribute  LandDetails  landDetails,Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		User loggedInUser = (User) session.getAttribute("loggedInUserObj");
		landDetails.setUser(loggedInUser);
		int i = misService.landDetailsSave(landDetails);
		WorktoLandDetails obj = new WorktoLandDetails(); 
		if(i != 0){
			obj = (WorktoLandDetails) session.getAttribute("generalInfo");
			obj.setLanddetails(landDetails);
			session.setAttribute("generalInfo", obj);
			return "online-mis-general-information";
		}
		else
			return "online-mis-land-details";		
	}

	
	@RequestMapping(value = "/generalInfo")
	public String generalInformation(Model model) {
		return  "online-mis-consultant-information";
		
	}
	
	@RequestMapping(value = "/consultantInfo")
	public String saveConsultantInfo(@ModelAttribute  ConsultantInfo  consultantInfoObject,Model model,HttpServletRequest request) {
		Works  workInfo=null;
		HttpSession session = request.getSession();
		int wrokid =(int) session.getAttribute("workIdSession");
		consultantInfoObject.setWorkId(wrokid);	
		int i = misService.saveConsultantInfo(consultantInfoObject);
		workInfo=misService.getWorkInfo(wrokid);
		model.addAttribute("workInfo", workInfo);
		if(i != 0)
		return  "online-mis-technical-sanction";
		else
		return  "online-mis-consultant-information";
		
	}
	
	/*@RequestMapping(value = "/technicalSanction", method = RequestMethod.POST)
	public String saveTechSanction(@ModelAttribute  TechnicalSanction  techSanctionObj,Model model,HttpServletRequest request ) {
		System.out.println("saveTechSanction()");
		int i = misService.saveTechSanction(techSanctionObj);
		return  "online-mis-technical-sanction";
		
	}*/
	
	
	/*@RequestMapping(value = "/technicalSanction")
	public String technicalSanction(Model model,HttpServletRequest request) {
		
		
		return "online-mis-technical-sanction";
		
	}*/
	
	
	@RequestMapping(value = "/technicalSanctionSave", method = RequestMethod.POST)
	public String technicalSanctionSave(@ModelAttribute TechnicalSanction techsanc ,Model model,HttpServletRequest request) {	
		System.out.println("techsanc...."+techsanc);
		Works  workInfo=null;
		HttpSession session = request.getSession();
		int wrokid =(int) session.getAttribute("workIdSession");
		techsanc.setWorkId(wrokid);	
		int i = misService.saveTechSanction(techsanc);
		workInfo=misService.getWorkInfo(wrokid);
		model.addAttribute("workInfo", workInfo);
		if(i != 0)
			return "online-mis-tendering-process";
		else
			return "online-mis-technical-sanction";
	}	
		
		
		@RequestMapping(value = "/tenderingProcess", method = RequestMethod.POST)
		public String saveTenderingProcess(@ModelAttribute TenderingProcess tenderingProcessObj ,Model model,HttpServletRequest request) {	
			System.out.println("tenderingProcessObj...."+tenderingProcessObj);
			Works  workInfo=null;
			TenderingProcess tenderingInfo=null;
			HttpSession session = request.getSession();
			int wrokid =(int) session.getAttribute("workIdSession");
			tenderingProcessObj.setWorkId(wrokid);	
			int i = misService.saveTenderingProcess(tenderingProcessObj);
			workInfo=misService.getWorkInfo(wrokid);
			model.addAttribute("workInfo", workInfo);
			if(i != 0){
			   session.setAttribute("tenderingIdSession", i);
			   int tenderingId =(int) session.getAttribute("tenderingIdSession");
			   tenderingInfo=misService.getTenderingInfo(tenderingId);
			   model.addAttribute("tenderingInfo", tenderingInfo);
			   return "online-mis-agreement-details";
			} 	
			else
				return "online-mis-tendering-process";
			//return "online-mis-agreement-details";
	   }

		
		@RequestMapping(value = "/agreementDetails", method = RequestMethod.POST)
		public String saveAgreementDetails(@ModelAttribute AgreementDetails agreementDetailsObj ,Model model,HttpServletRequest request) {	
			System.out.println("saveAgreementDetails()");
			System.out.println("agreementDetailsObj :"+agreementDetailsObj);
			Works  workInfo=null;
			HttpSession session = request.getSession();
			int wrokid =(int) session.getAttribute("workIdSession");
			agreementDetailsObj.setWorkId(wrokid);	
			int i = misService.saveAgreementDetails(agreementDetailsObj);
			workInfo=misService.getWorkInfo(wrokid);
			model.addAttribute("workInfo", workInfo);
			/*if(i != 0)
				return "online-mis-details";
			else*/
				return "online-mis-details";
		}		
	
	

}
