package com.ap.mis.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_sa_works")
public class Works extends AuditModel implements Serializable {

	private static final long serialVersionUID = -3465813074586302847L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, unique = true)
	private Integer id;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "typeof_work", referencedColumnName = "id")
	private TypeOfWork typeOfWork;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "natureof_work", referencedColumnName = "id")
	private NatureOfWork natureOfWork;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "District", referencedColumnName = "district_id")
	private District district;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "village", referencedColumnName = "village_id")
	private Village village;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "mandal", referencedColumnName = "mandal_id")
	private Mandal mandal;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "constituency", referencedColumnName = "constituency_id")
	private Constituency constituency;
	
	
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.EAGER )
	@JoinColumn(name = "worklineitems_id", referencedColumnName = "id")
    private List<WorkLineItemsList> WorkLineItemsList;
	
	@Column(name = "status")
	private String status;
	
	@Column(name = "work_status")
	private String workStatus;
 
	@Column
	private String location;

	@Column(name = "noof_works")
	private Integer noOfWorks;

	@Column(name = "work_number")
	private String workNo;

	@Column(name = "work_details")
	private String workDetails;

	@Column(name = "estimated_cost")
	private double cost;

	@OneToOne(targetEntity = User.class)
	@JoinColumn(name = "user_id", referencedColumnName = "user_id")
	private User user;
	
	@Column(name="is_active")
	private Boolean isActive = true;
	

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

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

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getNoOfWorks() {
		return noOfWorks;
	}

	public void setNoOfWorks(Integer noOfWorks) {
		this.noOfWorks = noOfWorks;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}


	public String getWorkNo() {
		return workNo;
	}

	public void setWorkNo(String workNo) {
		this.workNo = workNo;
	}
	
	public List<WorkLineItemsList> getWorkLineItemsList() {
		return WorkLineItemsList;
	}

	public void setWorkLineItemsList(List<WorkLineItemsList> workLineItemsList) {
		WorkLineItemsList = workLineItemsList;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	

	public String getWorkStatus() {
		return workStatus;
	}

	public void setWorkStatus(String workStatus) {
		this.workStatus = workStatus;
	}

	@Override
	public String toString() {
		return "Works [id=" + id + ", typeOfWork=" + typeOfWork + ", natureOfWork=" + natureOfWork + ", district="
				+ district + ", village=" + village + ", mandal=" + mandal + ", constituency=" + constituency
				+ ", WorkLineItemsList=" + WorkLineItemsList + ", status=" + status + ", workStatus=" + workStatus
				+ ", location=" + location + ", noOfWorks=" + noOfWorks + ", workNo=" + workNo + ", workDetails="
				+ workDetails + ", cost=" + cost + ", user=" + user + ", isActive=" + isActive + "]";
	}

	 
}
