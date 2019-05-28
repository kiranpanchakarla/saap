package com.ap.mis.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name ="technicalsanction")
public class TechnicalSanction implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	/*@Column(name="natureof_work")
	private String work;
	
	@Column(name = "work_number")
	private int workNumber;
	
	@Column(name = "work_name")
	private String workName;*/
	
	@Column(name="techsanction_number")
	private int techSanction_no;
	
	@Column(name="date")
	@DateTimeFormat(pattern = "yy-mm-dd") 
	private Date date;
	
	@Column(name="amount")
	private double amount;
	
	@Column(name="work_id")
	private int workId;

	public int getWorkId() {
		return workId;
	}

	public void setWorkId(int workId) {
		this.workId = workId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	/*public String getWork() {
		return work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	public int getWorkNumber() {
		return workNumber;
	}

	public void setWorkNumber(int workNumber) {
		this.workNumber = workNumber;
	}

	public String getWorkName() {
		return workName;
	}

	public void setWorkName(String workName) {
		this.workName = workName;
	}*/

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

	@Override
	public String toString() {
		return "TechnicalSanction [id=" + id + ", techSanction_no=" + techSanction_no + ", date=" + date + ", amount="
				+ amount + ", workId=" + workId + "]";
	}

	/*@Override
	public String toString() {
		return "TechnicalSanction [id=" + id + ", work=" + work + ", workNumber=" + workNumber + ", workName="
				+ workName + ", techSanction_no=" + techSanction_no + ", date=" + date + ", amount=" + amount
				+ ", workId=" + workId + "]";
	}*/

	
	
	
	

}
