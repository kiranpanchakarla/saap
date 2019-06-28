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
@Table(name = "tbl_sa_land_details")
public class LandDetails extends AuditModel implements Serializable {

	private static final long serialVersionUID = -3724216488406858738L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, unique = true)
	private Integer id;
 
	private transient String natureofwork;
	
	private transient String worknum;
	
	private transient String nameofwork;
	
	@Column(name = "field_measurement_bk_details")
	private String bookDetails;

	@Column(name = "survey_number")
	private String surveyNo;

	@Column(name = "land_extend")
	private String landExtend;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "type_of_land", referencedColumnName = "id")
	private Land typeOfLand;

	@OneToOne(targetEntity = User.class)
	@JoinColumn(name = "user_id", referencedColumnName = "user_id")
	private User user;

	@OneToOne(targetEntity = Works.class)
	@JoinColumn(name = "work_id", referencedColumnName = "id")
	private Works work;

	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBookDetails() {
		return bookDetails;
	}

	public void setBookDetails(String bookDetails) {
		this.bookDetails = bookDetails;
	}

	public String getSurveyNo() {
		return surveyNo;
	}

	public void setSurveyNo(String surveyNo) {
		this.surveyNo = surveyNo;
	}

	public String getLandExtend() {
		return landExtend;
	}

	public void setLandExtend(String landExtend) {
		this.landExtend = landExtend;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Land getTypeOfLand() {
		return typeOfLand;
	}

	public void setTypeOfLand(Land typeOfLand) {
		this.typeOfLand = typeOfLand;
	}

	public Works getWork() {
		return work;
	}

	public void setWork(Works work) {
		this.work = work;
	}

	public String getNatureofwork() {
		return natureofwork;
	}

	public void setNatureofwork(String natureofwork) {
		this.natureofwork = natureofwork;
	}

	public String getWorknum() {
		return worknum;
	}

	public void setWorknum(String worknum) {
		this.worknum = worknum;
	}

	public String getNameofwork() {
		return nameofwork;
	}

	public void setNameofwork(String nameofwork) {
		this.nameofwork = nameofwork;
	}

	@Override
	public String toString() {
		return "LandDetails [id=" + id + ", bookDetails=" + bookDetails + ", surveyNo=" + surveyNo + ", landExtend="
				+ landExtend + ", typeOfLand=" + typeOfLand + ", user=" + user + ", work=" + work + "]";
	}

	

}
