package com.ap.mis.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_sa_department_linking_line")
public final class DepartmentLinkingLine implements Serializable{

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
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="division_name", referencedColumnName = "id")
	private Division  divisionName; 
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="subdivision_name", referencedColumnName = "id")
	private Subdivision  subdivisionName; 
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="section_name", referencedColumnName = "id")
	private Section  sectionName; 
	
	
/*	@Column(name = "division_name")
	private int divisionName;*/
	
/*	@Column(name = "subdivision_name")
	private int subdivisionName;*/
	
/*	@Column(name = "section_name")
	private int sectionName;*/
	
	@Column(name = "section_officer_name")
	private String sectionOfficerName;
	
	@Column(name = "mobile_no")
	private String mobileNo;
	
	@Column(name = "email_id")
	private String email;
	
	@OneToOne(targetEntity=Works.class)
	@JoinColumn(name="work_id", referencedColumnName="id")
	private Works work;
	
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

/*	public int getDivisionName() {
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
	}*/

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

	public Division getDivisionName() {
		return divisionName;
	}

	public void setDivisionName(Division divisionName) {
		this.divisionName = divisionName;
	}

	public Subdivision getSubdivisionName() {
		return subdivisionName;
	}

	public void setSubdivisionName(Subdivision subdivisionName) {
		this.subdivisionName = subdivisionName;
	}

	public Section getSectionName() {
		return sectionName;
	}

	public void setSectionName(Section sectionName) {
		this.sectionName = sectionName;
	}

	public Works getWork() {
		return work;
	}

	public void setWork(Works work) {
		this.work = work;
	}

/*	public int getWork() {
		return work;
	}

	public void setWork(int work) {
		this.work = work;
	}*/
}
