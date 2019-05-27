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
@Table(name = "administrative_section")
public class AdministrativeSection implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7281661295866227383L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "work_name")
	private String workName;

	@Column(name = "work_number")
	private String workNumber;
	
	@Column(name = "sanctioned_details")
	private String sanctionedDetails;
	
	@Column(name = "typeof_grant")
	private int typeOfGrant;	

	@Column(name = "financial_year")
	private int financialYear;
	
	@Column(name = "executive_dept")
	private int executiveDept;
	
	@Column(name = "consultant")
	private int consultant;
	
	@OneToOne(targetEntity=User.class)
	@JoinColumn(name="user_id", referencedColumnName="user_id")
	private User user;
	 
	 @Column(name = "path")
	 private String path;


	public int getId() {
		return id;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getWorkName() {
		return workName;
	}

	public void setWorkName(String workName) {
		this.workName = workName;
	}

	public String getWorkNumber() {
		return workNumber;
	}

	public void setWorkNumber(String workNumber) {
		this.workNumber = workNumber;
	}


	public String getSanctionedDetails() {
		return sanctionedDetails;
	}

	public void setSanctionedDetails(String sanctionedDetails) {
		this.sanctionedDetails = sanctionedDetails;
	}

	public int getTypeOfGrant() {
		return typeOfGrant;
	}

	public void setTypeOfGrant(int typeOfGrant) {
		this.typeOfGrant = typeOfGrant;
	}

	public int getExecutiveDept() {
		return executiveDept;
	}

	public void setExecutiveDept(int executiveDept) {
		this.executiveDept = executiveDept;
	}

	public int getConsultant() {
		return consultant;
	}

	public void setConsultant(int consultant) {
		this.consultant = consultant;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getFinancialYear() {
		return financialYear;
	}

	public void setFinancialYear(int financialYear) {
		this.financialYear = financialYear;
	}

	@Override
	public String toString() {
		return "AdministrativeSection [id=" + id + ", workName=" + workName + ", workNumber=" + workNumber
				+ ", sanctionedDetails=" + sanctionedDetails + ", typeOfGrant=" + typeOfGrant + ", financialYear="
				+ financialYear + ", executiveDept=" + executiveDept + ", consultant=" + consultant + ", user=" + user
				+ "]";
	}
	


}
