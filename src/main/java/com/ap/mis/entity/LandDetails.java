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
@Table(name = "land_details")
public class LandDetails implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3724216488406858738L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;
	
	@Column(name = "type_of_land")
	private String typeOfLand;

	@Column(name = "field_measurement_bk_details")
	private String bookDetails;
	
	@Column(name = "survey_number")
	private int surveyNo;
	
	@Column(name = "land_extend")
	private String landExtend;
	
	@OneToOne(targetEntity=User.class)
	@JoinColumn(name="user_id", referencedColumnName="user_id")
	private User user;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTypeOfLand() {
		return typeOfLand;
	}

	public void setTypeOfLand(String typeOfLand) {
		this.typeOfLand = typeOfLand;
	}

	public String getBookDetails() {
		return bookDetails;
	}

	public void setBookDetails(String bookDetails) {
		this.bookDetails = bookDetails;
	}

	public int getSurveyNo() {
		return surveyNo;
	}

	public void setSurveyNo(int surveyNo) {
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

	@Override
	public String toString() {
		return "LandDetails [id=" + id + ", typeOfLand=" + typeOfLand + ", bookDetails=" + bookDetails + ", surveyNo="
				+ surveyNo + ", landExtend=" + landExtend + ", user=" + user + "]";
	}


}
