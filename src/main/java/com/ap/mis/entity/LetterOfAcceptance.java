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
@Table(name="tbl_sa_letter_Of_Acceptance")
public class LetterOfAcceptance extends AuditModel implements Serializable{
	
	private static final long serialVersionUID=1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, unique = true)
	private Integer id;
	
	
	@Column(name="name")
	private String name;

	@OneToOne
	@JoinColumn(columnDefinition="work_id", referencedColumnName = "id")
	private Works work;

	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Works getWork() {
		return work;
	}


	public void setWork(Works work) {
		this.work = work;
	}
	
	

}
