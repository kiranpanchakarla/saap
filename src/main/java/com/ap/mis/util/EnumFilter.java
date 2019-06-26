package com.ap.mis.util;

public enum EnumFilter {

	OPEN("OPEN"),
	SAAP_APPROVED("SAAP_APPROVED"),
	DEPT_INPROGRESS("DEPT_INPROGRESS"),
	DEPT_APPROVED("DEPT_APPROVED"),
	CONST_INPROGRESS("CONST_INPROGRESS"),
	COMPLETED("COMPLETED"),
	ADMIN("ADMINISTRATIVE"),
	LANDDETAILS("LANDDETAILS"),
	TENDERPROCESS("TENDERPROCESS");
	
private String status;
	
	private EnumFilter(String status) {
		this.status = status;
	}
	public String getStatus() {
		return status;
	}
}
