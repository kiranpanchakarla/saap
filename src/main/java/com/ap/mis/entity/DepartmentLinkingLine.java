package com.ap.mis.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "department_linking_line")
public final class DepartmentLinkingLine implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2498915935089096549L;


	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;

	
	@Column(name = "department_name")
	private String departmentName;

	@Column(name = "work_nature")
	private String workNature;
	
	@Column(name = "circle")
	private String circle;
	
	@Column(name = "division_name")
	private int divisionName;
	
	@Column(name = "subdivision_name")
	private int subdivisionName;
	
	@Column(name = "section_name")
	private int sectionName;
	
	@Column(name = "section_officer_name")
	private String sectionOfficerName;
	
	@Column(name = "mobile_no")
	private String mobileNo;
	
	@Column(name = "email_id")
	private String email;
	
	@Column(name = "work_id")
    private int  work;
	
	 @OneToOne(targetEntity=User.class)
	 @JoinColumn(name="user_id", referencedColumnName="user_id")
	 private User user;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getWorkNature() {
		return workNature;
	}

	public void setWorkNature(String workNature) {
		this.workNature = workNature;
	}

	public String getCircle() {
		return circle;
	}

	public void setCircle(String circle) {
		this.circle = circle;
	}

	public int getDivisionName() {
		return divisionName;
	}

	public void setDivisionName(int divisionName) {
		this.divisionName = divisionName;
	}

	public int getSubdivisionName() {
		return subdivisionName;
	}

	public void setSubdivisionName(int subdivisionName) {
		this.subdivisionName = subdivisionName;
	}

	public int getSectionName() {
		return sectionName;
	}

	public void setSectionName(int sectionName) {
		this.sectionName = sectionName;
	}

	public String getSectionOfficerName() {
		return sectionOfficerName;
	}

	public void setSectionOfficerName(String sectionOfficerName) {
		this.sectionOfficerName = sectionOfficerName;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getWork() {
		return work;
	}

	public void setWork(int work) {
		this.work = work;
	}

	
	 
	 

}
