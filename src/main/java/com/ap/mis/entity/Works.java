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
@Table(name = "tbl_sa_works")
public class Works implements Serializable {
	

	private static final long serialVersionUID = -3465813074586302847L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", nullable = false , unique = true)
	private int id;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="typeof_work", referencedColumnName = "id")
	private TypeOfWork  typeOfWork; 
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="natureof_work", referencedColumnName = "id")
	private NatureOfWork  natureOfWork; 

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="District", referencedColumnName = "district_id")
	private District  district; 

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="village", referencedColumnName = "village_id")
	private Village  village; 
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="mandal", referencedColumnName = "mandal_id")
	private Mandal  mandal; 

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="constituency", referencedColumnName = "constituency_id")
	private Constituency  constituency; 

	@Column
	private String location;

	@Column(name = "noof_works")
	private int noOfWorks;
	
	@Column(name = "work_username")
	private String workUserName;
	
	@Column(name = "work_number")
	private String workNo;
	
	@Column(name = "work_details")
	private String workDetails;
	
	@Column(name = "estimated_cost")
	private double cost;
	
	@OneToOne(targetEntity=User.class)
	@JoinColumn(name="user_id", referencedColumnName="user_id")
	private User user;
	
	
	public TypeOfWork getTypeOfWork() {
		return typeOfWork;
	}

	public void setTypeOfWork(TypeOfWork typeOfWork) {
		this.typeOfWork = typeOfWork;
	}

	public NatureOfWork getNatureOfWork() {
		return natureOfWork;
	}

	public void setNatureOfWork(NatureOfWork natureOfWork) {
		this.natureOfWork = natureOfWork;
	}
	
	public District getDistrict() {
		return district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}
	
	
	 public Village getVillage() {
		return village;
	}

	public void setVillage(Village village) {
		this.village = village;
	}

	public Mandal getMandal() {
		return mandal;
	}

	public void setMandal(Mandal mandal) {
		this.mandal = mandal;
	}

	public Constituency getConstituency() {
		return constituency;
	}

	public void setConstituency(Constituency constituency) {
		this.constituency = constituency;
	}

	public String getWorkDetails() {
		return workDetails;
	}

	public void setWorkDetails(String workDetails) {
		this.workDetails = workDetails;
	}

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getNoOfWorks() {
		return noOfWorks;
	}

	public void setNoOfWorks(int noOfWorks) {
		this.noOfWorks = noOfWorks;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getWorkUserName() {
		return workUserName;
	}

	public void setWorkUserName(String workUserName) {
		this.workUserName = workUserName;
	}

	public String getWorkNo() {
		return workNo;
	}

	public void setWorkNo(String workNo) {
		this.workNo = workNo;
	}
	
}
