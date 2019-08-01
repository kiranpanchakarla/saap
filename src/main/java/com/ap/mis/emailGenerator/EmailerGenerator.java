package com.ap.mis.emailGenerator;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;



@Component
public abstract class EmailerGenerator  {
	private static final Logger log = Logger.getLogger(EmailerGenerator.class);

	@Value(value = "${domain}")
	private static String domain;

	@Value(value = "${support.email}")
	private String SUPPORT_EMAIL;

	@Value("#{'${support.email.bcc}'.split(',')}")
	private String SUPPORT_BCC_EMAIL;
	
	@Value("#{'${support.email.cc}'.split(',')}")
	private String SUPPORT_CC_EMAIL;
	
	private  String bccMail;
	
	private  String ccMail;
	
	@Value(value = "${brandName}")
	private static String brandName;
	
	@Value(value = "${send.email}")
	private String SEND_EMAIL;
	
	
	
	public static String getDomain() {
		return domain;
	}

	public static void setDomain(String domain) {
		EmailerGenerator.domain = domain;
	}

	public String getSUPPORT_EMAIL() {
		return SUPPORT_EMAIL;
	}
	
	public String getDefaultEmailFromAddress() {
        return SUPPORT_EMAIL;
    }
	 public String getDefaultBccEmailFromAddress() {
	        return SUPPORT_BCC_EMAIL;
	    }

	public void setSUPPORT_EMAIL(String sUPPORT_EMAIL) {
		SUPPORT_EMAIL = sUPPORT_EMAIL;
	}

	public String getSUPPORT_BCC_EMAIL() {
		return SUPPORT_BCC_EMAIL;
	}

	public void setSUPPORT_BCC_EMAIL(String sUPPORT_BCC_EMAIL) {
		SUPPORT_BCC_EMAIL = sUPPORT_BCC_EMAIL;
	}

	public String getSUPPORT_CC_EMAIL() {
		return SUPPORT_CC_EMAIL;
	}

	public void setSUPPORT_CC_EMAIL(String sUPPORT_CC_EMAIL) {
		SUPPORT_CC_EMAIL = sUPPORT_CC_EMAIL;
	}

	public String getBccMail() {
		return bccMail;
	}

	public void setBccMail(String bccMail) {
		this.bccMail = bccMail;
	}

	public String getCcMail() {
		return ccMail;
	}

	public void setCcMail(String ccMail) {
		this.ccMail = ccMail;
	}

	public static String getBrandName() {
		return brandName;
	}

	public static void setBrandName(String brandName) {
		EmailerGenerator.brandName = brandName;
	}

	public String getSEND_EMAIL() {
		return SEND_EMAIL;
	}

	public void setSEND_EMAIL(String sEND_EMAIL) {
		SEND_EMAIL = sEND_EMAIL;
	}


	
	

	
	protected boolean  shouldNotify()
	{
		return true;
	}
	
}
