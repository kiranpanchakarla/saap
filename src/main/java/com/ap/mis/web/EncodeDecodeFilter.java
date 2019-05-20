package com.ap.mis.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class EncodeDecodeFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String queryString = httpRequest.getQueryString();
        if (httpRequest.getMethod().equalsIgnoreCase("GET") && queryString != null
                && !queryString.equalsIgnoreCase("v=4.6.3")) {
            Map<String, String[]> extraParams = new TreeMap<String, String[]>();
            String decodedString=APDRPUtil.decodeStringParameters(queryString);
            Map<String, String> requestParams = splitQuery(decodedString);
            for (String key : requestParams.keySet()) {
                String value = requestParams.get(key);
                String[] values = new String[1];
                values[0] = value;
                extraParams.put(key, values);
            }
            HttpServletRequest wrappedRequest = new PrettyFacesWrappedRequest(httpRequest, extraParams);
            chain.doFilter(wrappedRequest, response);
        } else {
            if(httpRequest.getMethod().equalsIgnoreCase("POST") && httpRequest.getRequestURI().equals("/OnlineMisApplication/j_spring_security_check")){
                
            }
           /* if(httpRequest.getMethod().equalsIgnoreCase("POST") && httpRequest.getRequestURI().equals("/mis/eMbook")) {
            	 String componentId = (String) request.getParameter("componentId");
            	 String activityId = (String) request.getParameter("activityId");
            	 String packageId = (String) request.getParameter("packageId");
            	 String workId = (String) request.getParameter("workId");
            	 String mileStoneId = (String) request.getParameter("mileStoneId");
            	 
            	 System.out.println("componentId" +componentId);
            	 System.out.println("activityId" +activityId);
            	 System.out.println("packageId" +packageId);
            	 System.out.println("workId" +workId);
            	 System.out.println("mileStoneId" +mileStoneId);
            	 
            	 System.out.println("workId" +workId);
            	 System.out.println("packageId" +packageId);
            	 
            	 System.out.println("getBody --->" + getBody(httpRequest));
            	 
            	 
            	
            }*/
            
            
            chain.doFilter(request, response);

      }

  }

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	
	 public Map<String, String> splitQuery(String query) throws UnsupportedEncodingException {
	        Map<String, String> query_pairs = new LinkedHashMap<String, String>();  
	        if (query != null && !query.equals("")) {
	        String[] pairs = query.split("&");
	        for (String pair : pairs) {
	            if(pair.contains("=")) {
	            int idx = pair.indexOf("=");
	            query_pairs.put(URLDecoder.decode(pair.substring(0, idx), "UTF-8"), URLDecoder.decode(pair.substring(idx + 1), "UTF-8"));
	            }
	        }
	    }
	    return query_pairs;
	}

}
