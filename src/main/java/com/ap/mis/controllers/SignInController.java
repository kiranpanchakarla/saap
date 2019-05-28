package com.ap.mis.controllers;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ap.mis.entity.User;

@Controller
public class SignInController {

	public static final String URL = "/signIn.html";
	
	
	@RequestMapping(value = { "/", URL }, method = RequestMethod.GET)
	public String signInPage(@ModelAttribute User userObject, Model model, String error,HttpServletRequest request,HttpServletResponse response) throws IOException {
		if (error != null) {
		
			model.addAttribute("error", error);
		}
		return "online-admin";
	}
	
}
