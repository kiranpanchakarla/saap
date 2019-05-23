package com.ap.mis.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.ap.mis.service.MISService;

@Controller
@RequestMapping("/landDetails")
public class LandDetailsController {

	@Autowired MISService misService;

	
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
