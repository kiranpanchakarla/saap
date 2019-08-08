package com.ap.mis.util;

public enum EnumFilter {

	OPEN("OPEN"),
	SAAP_APPROVED("SAAP_APPROVED"),
	DEPT_INPROGRESS("DEPT_INPROGRESS"),
	DEPT_APPROVED("DEPT_APPROVED"),
	CONST_INPROGRESS("CONST_INPROGRESS"),
	COMPLETED("COMPLETED"),
	ADMIN("ADMINISTRATIVE"),
	SAAP("ADMIN"),
	LANDDETAILS("LANDDETAILS"),
	LAND_SURVEY_DETAILS("LAND_SURVEY"),
	PRELIMINARY_PREPARATION_LAYOUT("PP_LAYOUT"),
	GEOTECHNICAL_INVESTIGATION("GEOTECH_INVSTGSN"),
	TENDERPROCESSFORENG("TENDERPROCESSFORENG"),
	TENDERPROCESSFORTEL("TENDERPROCESSFORTEL"),
	APPROVAL("APPROVAL"),
	SAVED("SAVED"),
	UPDATED("UPDATED"),
	ATTACHMENT_APPROVED("APPRVD"),
	ATTACHMENT_REJECTED("REJCTD"),
	ACTIVE("ACTIVE"),
	DELETED("DELETED"),
	LOA("LETTER_OF_ACCEPTANCE"),
	ADMINISTRATOR("ADMINISTRATOR"),
	CONSULTANT("CONSULTANT"),
	DEPARTMENT("DEPARTMENT")
	;
	
	
private String status;
	
	private EnumFilter(String status) {
		this.status = status;
	}
	public String getStatus() {
		return status;
	}
}
