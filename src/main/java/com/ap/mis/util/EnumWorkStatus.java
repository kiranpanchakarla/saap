package com.ap.mis.util;

public enum EnumWorkStatus {

	WORK("Work_Created"),
	ADMIN("Admin_Sanction"),
	DEPARTMENT("Line_Department"),
	LAND("Land_Details"),
	GENERAL("General_Info"),
	PENDING_SAAP_APPROVAL("PEND_SAAP_APRVL"),
	SAAP_APPROVED("SAAP_APRVD"),
	COMPLETED("Completed");
	
private String status;
	
	private EnumWorkStatus(String status) {
		this.status = status;
	}
	public String getStatus() {
		return status;
	}
}

