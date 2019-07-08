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

import com.ap.mis.entity.Role;
import com.ap.mis.entity.User;
import com.ap.mis.service.UserCreationService;
import com.ap.mis.service.UserService;

@Controller
@RequestMapping("/userCreation")
public class UserCreationController {
	
	@Autowired UserCreationService userCreationService;
	@Autowired UserService userService;
	
	@GetMapping
	public String userCreationReg(@ModelAttribute User userObj,Model model,HttpServletRequest request) {
		model.addAttribute("roleList",userCreationService.getRoleList());
		return  "online-mis-user-creation";
	}
	
	@PostMapping(value = "/save")
	public String userCreationSave(@ModelAttribute User userObj,Model model,HttpServletRequest request) {
		int roleid = Integer.parseInt(request.getParameter("userRole"))  ;
		Role role = new Role();
		role.setId(roleid);
		userObj.setRole(role);
		userObj.setIsActive(true);
		User usr = userService.getUserByName(userObj.getName());
		if(usr == null ) {
			int i = userCreationService.saveNewUser(userObj);
			if(i != 0) {
				return "online-admin";
			}
		}else {
			model.addAttribute("usernameErr", "User Name Existed");
		}
		return  "online-mis-user-creation";
	}

}
