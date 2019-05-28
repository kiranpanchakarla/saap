package com.ap.mis.exceptions;

public class RequestedResourceNotAvailable {

	private String errorCode="1020";
	
	public RequestedResourceNotAvailable(String message){
		super();
	}

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}
	
}
