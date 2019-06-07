package com.ap.mis.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "tbl_sa_technicalsanction")
public class TechnicalSanction implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, unique = true)
	private Integer id;

	@Column(name = "techsanction_number")
	private int techSanction_no;

	@Column(name = "date")
	@DateTimeFormat(pattern = "yy-mm-dd")
	private Date date;

	@Column(name = "amount")
	private double amount;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "work_id", referencedColumnName = "id")
	private Works work;
	
	private transient String natureOfWork;
	
	private transient String workNumber;
	
	private transient String workName;
	
	

	public String getNatureOfWork() {
		return natureOfWork;
	}

	public void setNatureOfWork(String natureOfWork) {
		this.natureOfWork = natureOfWork;
	}

	public String getWorkNumber() {
		return workNumber;
	}

	public void setWorkNumber(String workNumber) {
		this.workNumber = workNumber;
	}

	public String getWorkName() {
		return workName;
	}

	public void setWorkName(String workName) {
		this.workName = workName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getTechSanction_no() {
		return techSanction_no;
	}

	public void setTechSanction_no(int techSanction_no) {
		this.techSanction_no = techSanction_no;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public Works getWork() {
		return work;
	}

	public void setWork(Works work) {
		this.work = work;
	}

	@Override
	public String toString() {
		return "TechnicalSanction [id=" + id + ", techSanction_no=" + techSanction_no + ", date=" + date + ", amount="
				+ amount + ", work=" + work + "]";
	}

}
