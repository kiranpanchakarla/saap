package com.ap.mis.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorController {

	 @RequestMapping(value = "error", method = RequestMethod.GET)
	    public ModelAndView renderErrorPage(HttpServletRequest httpRequest) {
	         
	        ModelAndView errorPage = new ModelAndView("errorPage");
	        String errorMsg = "";
	        int httpErrorCode = getErrorCode(httpRequest);
	 
	        switch (httpErrorCode) {
	        case 400: {
	            errorMsg = "Http Error Code: 400. Bad Request";
	            break;
	        }
	        case 401: {
	            errorMsg = "Http Error Code: 401. Unauthorized";
	            break;
	        }
	        case 402: {
	            errorMsg = "Http Error Code: 402. Payment Required";
	            break;
	        }
	        case 403: {
	            errorMsg = "Http Error Code: 403. Forbidden";
	            break;
	        }
	        case 404: {
	            errorMsg = "Http Error Code: 404. Requested Resource not Available";
	            break;
	        }
	        case 405: {
	            errorMsg = "Http Error Code: 405. Method Not Allowed";
	            break;
	        }
	        case 406: {
	            errorMsg = "Http Error Code: 406. Not Acceptable";
	            break;
	        }
	        case 407: {
	            errorMsg = "Http Error Code: 407. Proxy Authentication Required";
	            break;
	        }
	        case 408: {
	            errorMsg = "Http Error Code: 408. Request Timeout";
	            break;
	        }
	        case 409: {
	            errorMsg = "Http Error Code: 409. Conflict";
	            break;
	        }
	        case 410: {
	            errorMsg = "Http Error Code: 410. Gone";
	            break;
	        }
	        case 411: {
	            errorMsg = "Http Error Code: 411. Length Required";
	            break;
	        }
	        case 412: {
	            errorMsg = "Http Error Code: 412. Precondition Failed";
	            break;
	        }
	        case 413: {
	            errorMsg = "Http Error Code: 413. Request Entity Too Large";
	            break;
	        }
	        case 414: {
	            errorMsg = "Http Error Code: 414. Request-URI Too Long";
	            break;
	        }
	        case 415: {
	            errorMsg = "Http Error Code: 415. Unsupported Media Type";
	            break;
	        }
	        case 416: {
	            errorMsg = "Http Error Code: 416. Requested Range Not Satisfiable";
	            break;
	        }
	        case 417: {
	            errorMsg = "Http Error Code: 417. Expectation Failed";
	            break;
	        }

	        case 500: {
	            errorMsg = "Http Error Code: 500. Internal Server Error";
	            break;
	        }
	        case 501: {
	            errorMsg = "Http Error Code: 501. Not Implemented";
	            break;
	        }
	        case 502: {
	            errorMsg = "Http Error Code: 502. Bad Gateway";
	            break;
	        }
	        case 503: {
	            errorMsg = "Http Error Code: 503. Service Unavailable";
	            break;
	        }
	        case 504: {
	            errorMsg = "Http Error Code: 504. Gateway Timeout";
	            break;
	        }
	        case 505: {
	            errorMsg = "Http Error Code: 505. HTTP Version Not Supported";
	            break;
	        }
	        default: {
	            errorMsg = "Internal Server Error";
	            break;
	        }
	        }
	        errorPage.addObject("errorMsg", errorMsg);
	        return errorPage;
	    }
	     
	    private int getErrorCode(HttpServletRequest httpRequest) {
	        return (Integer) httpRequest
	          .getAttribute("javax.servlet.error.status_code");
	    }
	    
}
