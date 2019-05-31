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
@Table(name = "tbl_sa_administrative_section")
public class AdministrativeSection implements Serializable{
	
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
		
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="typeof_grant", referencedColumnName = "id")
	private GrantType  typeOfGrant; 
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="financial_year", referencedColumnName = "id")
	private FinancialYear  financialYear; 
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="executive_dept", referencedColumnName = "id")
	private ExecutiveDept  executiveDept; 
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="consultant", referencedColumnName = "id")
	private ExecutiveConsultant  consultant; 
		
	@OneToOne(targetEntity=Works.class)
	@JoinColumn(name="work_id", referencedColumnName="id")
	private Works work;
	 
	@Column(name = "path")
	private String path;
	
	@OneToOne(targetEntity=User.class)
	@JoinColumn(name="user_id", referencedColumnName="user_id")
	private User user;


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

	public GrantType getTypeOfGrant() {
		return typeOfGrant;
	}

	public void setTypeOfGrant(GrantType typeOfGrant) {
		this.typeOfGrant = typeOfGrant;
	}

	public FinancialYear getFinancialYear() {
		return financialYear;
	}

	public void setFinancialYear(FinancialYear financialYear) {
		this.financialYear = financialYear;
	}

	public ExecutiveDept getExecutiveDept() {
		return executiveDept;
	}

	public void setExecutiveDept(ExecutiveDept executiveDept) {
		this.executiveDept = executiveDept;
	}

	public ExecutiveConsultant getConsultant() {
		return consultant;
	}

	public void setConsultant(ExecutiveConsultant consultant) {
		this.consultant = consultant;
	}



	@Override
	public String toString() {
		return "AdministrativeSection [id=" + id + ", workName=" + workName + ", workNumber=" + workNumber
				+ ", sanctionedDetails=" + sanctionedDetails + ", typeOfGrant=" + typeOfGrant + ", financialYear="
				+ financialYear + ", executiveDept=" + executiveDept + ", consultant=" + consultant + ", user=" + user
				+ "]";
	}


}
