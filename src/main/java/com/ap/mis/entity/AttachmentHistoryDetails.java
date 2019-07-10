package com.ap.mis.entity;

import java.util.Date;

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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name="tbl_sa_attachmentHistoryDetails")
public class AttachmentHistoryDetails {
	
	private static final long serialversionUID=1L;
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id",nullable=false,unique=true)
	private Integer id;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="attach_id")
	private Attachements attach;
	
	@Column(name="log")
	private String log;
		
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_date",nullable=false,updatable=false)
	private Date createdDate;
	
	
	@Column(name="created_by")
	private String createdBy;


	public AttachmentHistoryDetails(Integer id, Attachements attach, String log, Date createdDate,
			String createdBy) {
		super();
		this.id = id;
		this.attach = attach;
		this.log = log;
		this.createdDate = createdDate;
		this.createdBy = createdBy;
	}


	public AttachmentHistoryDetails() {
	
		// TODO Auto-generated constructor stub
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Attachements getAttach() {
		return attach;
	}


	public void setAttach(Attachements attach) {
		this.attach = attach;
	}


	public String getLog() {
		return log;
	}


	public void setLog(String log) {
		this.log = log;
	}

	public Date getCreatedDate() {
		return createdDate;
	}


	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}


	public String getCreatedBy() {
		return createdBy;
	}


	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}


	

	
	
	
	

}
