package com.ap.mis.util;

public enum EnumWorkStatus {

	WORK("Work_Created"),
	ADMIN("Admin_Sanction"),
	DEPARTMENT("Line_Department"),
	LAND("Land_Details"),
	GENERAL("General_Info"),
	
	CONSULTANT_INFO("CONSLTNT_INFO"),
	LAND_SURVEY_DETAILS("LAND_SURVY_INFO"),
	PRELIMINARY_PREPARATION_LAYOUT_DETAILS("PP_LAYOUT_INFO"),
	GEOTECHNICAL_INVESTIGATION("GEO_TECHNCL_INFO"),	
	PENDING_SAAP_APPROVAL("PEND_SAAP_APRVL"),
	SAAP_APPROVED("SAAP_APRVD"),
	
	WORK_ESTIMATION_COMPLETED("WORK_ESTMASN_CMPLTD"),
	TECHNICAL_SANCTION_COMPLETED("TECHNICL_SANKSN_CMPLTD"),
	
	TENDER_PROCESS_INFO("TENDR_PROCES_INFO"),
	TENDER_EVALUATION_INFO("TENDR_EVALUASN_INFO"),
	LETTER_OF_ACCEPTANCE("LOA"),
	
	COMPLETED("Completed");
	
private String status;
	
	private EnumWorkStatus(String status) {
		this.status = status;
	}
	public String getStatus() {
		return status;
	}
}

