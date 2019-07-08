package com.ap.mis.model;

public class OnlineMisDetails {
	
	private String departmentName;
	private int noOfWorks;
	private double estimatedCost;
	
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public int getNoOfWorks() {
		return noOfWorks;
	}
	public void setNoOfWorks(int noOfWorks) {
		this.noOfWorks = noOfWorks;
	}
	public double getEstimatedCost() {
		return estimatedCost;
	}
	public void setEstimatedCost(double estimatedCost) {
		this.estimatedCost = estimatedCost;
	}
	@Override
	public String toString() {
		return "OnlineMisDetails [departmentName=" + departmentName + ", noOfWorks=" + noOfWorks + ", estimatedCost="
				+ estimatedCost + "]";
	}
	
	

}
