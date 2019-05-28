package com.ap.mis.util;

import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

import com.ap.mis.entity.User;
import com.ap.mis.exceptions.InvalidSessionException;

public class SecurityUtil {

	public static User getLoggedUser(){

		User user = null;
		SecurityContext securityContext = SecurityContextHolder.getContext();
		if (securityContext != null && securityContext.getAuthentication() != null) {
			try {
				user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			} catch (Exception e) {
				throw new InvalidSessionException("Session Expired/Invalid Session");
			}
		}
		return user;
	}
	
	public static User inValidateSession() {

		User user = null;
		SecurityContext securityContext = SecurityContextHolder.getContext();
		if (securityContext != null && securityContext.getAuthentication() != null) {
			securityContext.setAuthentication(null);
		}
		return user;
	}
}
