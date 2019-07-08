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
@Table(name="tbl_sa_geotechnical_investigation")
public class GeotechnicalInvestigation extends AuditModel implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, unique = true)
	private Integer id;
	
	@Column(name = "comments")
	private String comments;
	
	@OneToOne
	@JoinColumn(columnDefinition="work_id", referencedColumnName = "id")
	private Works work;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Works getWork() {
		return work;
	}

	public void setWork(Works work) {
		this.work = work;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
	
	

	

}
