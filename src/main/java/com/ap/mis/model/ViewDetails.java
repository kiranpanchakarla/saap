package com.ap.mis.model;

public class ViewDetails {
	private String typeOfWork;
	private String natureOfWork;
	private String nameOfWork;
	private int workNo;
	private String surveyNo;
	private String workDetails;
	private String departmentName;
	private String consultantfirm;
	private String agencyName;
	/* a.typeof_work ,a.natureof_work a,a.work_details,a.work_number,b.department_name,d.survey_number,e.consultant_firm,g.agency_name*/
	
	
	
	public String getTypeOfWork() {
		return typeOfWork;
	}
	public String getWorkDetails() {
		return workDetails;
	}
	public void setWorkDetails(String workDetails) {
		this.workDetails = workDetails;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getConsultantfirm() {
		return consultantfirm;
	}
	public void setConsultantfirm(String consultantfirm) {
		this.consultantfirm = consultantfirm;
	}
	public String getAgencyName() {
		return agencyName;
	}
	public void setAgencyName(String agencyName) {
		this.agencyName = agencyName;
	}
	public void setTypeOfWork(String typeOfWork) {
		this.typeOfWork = typeOfWork;
	}
	public String getNatureOfWork() {
		return natureOfWork;
	}
	public void setNatureOfWork(String natureOfWork) {
		this.natureOfWork = natureOfWork;
	}
	public String getNameOfWork() {
		return nameOfWork;
	}
	public void setNameOfWork(String nameOfWork) {
		this.nameOfWork = nameOfWork;
	}
	public int getWorkNo() {
		return workNo;
	}
	public void setWorkNo(int workNo) {
		this.workNo = workNo;
	}
	public String getSurveyNo() {
		return surveyNo;
	}
	public void setSurveyNo(String surveyNo) {
		this.surveyNo = surveyNo;
	}
	
	

}
