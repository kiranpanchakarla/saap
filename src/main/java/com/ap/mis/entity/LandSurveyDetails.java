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
@Table(name = "tbl_sa_surveyLand_details")
public class LandSurveyDetails extends AuditModel implements Serializable {
	private static final long serialVersionUID = -3724216488406858738L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, unique = true)
	private Integer id;

	/*
	 * @Column(name = "field_measurement_bk_details") private String bookDetails;
	 * 
	 * @Column(name = "survey_number") private String surveyNo;
	 * 
	 * @Column(name = "land_extend") private String landExtend;
	 * 
	 * @ManyToOne(fetch = FetchType.EAGER)
	 * 
	 * @JoinColumn(name = "type_of_land", referencedColumnName = "id") private Land
	 * typeOfLand;
	 */

	@OneToOne(targetEntity = LandDetails.class)
	@JoinColumn(name = "land_id", referencedColumnName = "id")
	private LandDetails landDetails;

	@OneToOne(targetEntity = User.class)
	@JoinColumn(name = "user_id", referencedColumnName = "user_id")
	private User user;

	@OneToOne(targetEntity = Works.class)
	@JoinColumn(name = "work_id", referencedColumnName = "id")
	private Works work;

	@Column(name = "survey_content")
	private String surveycontent;

	@Column(name = "comments")
	private String comments;

	public Integer getId() {
		return id;
	}

	public LandDetails getLandDetails() {
		return landDetails;
	}

	public void setLandDetails(LandDetails landDetails) {
		this.landDetails = landDetails;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Works getWork() {
		return work;
	}

	public void setWork(Works work) {
		this.work = work;
	}

	public String getSurveycontent() {
		return surveycontent;
	}

	public void setSurveycontent(String surveycontent) {
		this.surveycontent = surveycontent;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	

}
