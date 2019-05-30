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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ap.mis.entity.Constituency;
import com.ap.mis.entity.Mandal;
import com.ap.mis.entity.NatureOfWork;
import com.ap.mis.entity.TypeOfWork;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Village;
import com.ap.mis.service.ConstituencyService;
import com.ap.mis.service.DistrictService;
import com.ap.mis.service.MISService;
import com.ap.mis.service.MandalService;
import com.ap.mis.service.VillageService;
import com.ap.mis.util.SecurityUtil;
import com.google.gson.Gson;

@Controller
@RequestMapping("/workCreationView")
public class HomeController {
	
	
	@Autowired MISService misService;
	@Autowired DistrictService districtsService;
	/*@Autowired MandalService  mandalService;
	@Autowired VillageService villageService;
	@Autowired ConstituencyService  constituencyService;
	*/
	@RequestMapping(value = "/view")
	public String validatingLoginUser(@ModelAttribute User userObject, Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		userObject = SecurityUtil.getLoggedUser();
		model.addAttribute("districts", districtsService.findAll());
	    userObject =misService.verifyUser(userObject);
		session.setAttribute("loggedInUserObj", userObject);
		List<TypeOfWork> typeOfWork=misService.findAll();
		model.addAttribute("typeOfWork", typeOfWork);
		List<NatureOfWork> natureOfWork=misService.natureOfDetails();
		model.addAttribute("natureOfWork", natureOfWork);
	    return "online-mis";
		
		
	}
	
	   @RequestMapping(value="/constituency", method=RequestMethod.GET)
	    public @ResponseBody String constituencyInfo(String PlaceId) {
			List<Constituency> constituencyDetails=misService.constituencyDetails(Integer.parseInt(PlaceId));
			return new Gson().toJson(constituencyDetails);
	    }
		
		@RequestMapping(value="/mandal", method=RequestMethod.GET)
	    public @ResponseBody String mandalInfo(String PlaceId) {
			List<Mandal> mandalDetails=misService.mandalDetails(Integer.parseInt(PlaceId));
		    return new Gson().toJson(mandalDetails);
	    }
		
		@RequestMapping(value="/village", method=RequestMethod.GET)
	    public @ResponseBody String villageInfo(String PlaceId) {
			List<Village> villageDetails=misService.villageDetails(Integer.parseInt(PlaceId));
			return new Gson().toJson(villageDetails);
	    }
	 
}
