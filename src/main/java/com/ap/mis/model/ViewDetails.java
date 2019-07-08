package com.ap.mis.model;

public class ViewDetails {
	private String typeOfWork;
	private String natureOfWork;
	private String nameOfWork;
	private String  workNo;
	private String surveyNo;
	private String workDetails;
	private String departmentName;
	private String consultantfirm;
	private String agencyName;
	private Integer id;
	private String status;
	
	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
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
	
	public String getWorkNo() {
		return workNo;
	}
	public void setWorkNo(String workNo) {
		this.workNo = workNo;
	}
	public String getSurveyNo() {
		return surveyNo;
	}
	public void setSurveyNo(String surveyNo) {
		this.surveyNo = surveyNo;
	}
	
	

}
