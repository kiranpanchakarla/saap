package com.ap.mis.exceptions;

public class InvalidSessionException extends RuntimeException{

	private static final long serialVersionUID = -7106896690311649933L;
	private String errorCode="1020";
	
	public InvalidSessionException(String message){
		super(message);
	}

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}
}
