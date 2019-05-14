package com.ap.mis.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="agreement_details")
public class AgreementDetails {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name="perf_securityAmount")
	private double performanceSecurityAmount;
	
	@Column(name="sitehandover_date")
	private Date siteHandOverDate;
	
	@Column(name="agreementConcluded_date")
	private Date agreementCouncludedDate;
	
	@Column(name="periodofcontract")
	private int periodOfContract;
	
	@Column(name="expcompletion_date")
	private Date expectedCompletionDate;
	
	@Column(name="agreement_number")
	private String agreementNumber;
	
	@Column(name="bank_gauranteedetails")
	private String bankGuaranteeDetails;
	
	@Column(name="demanddraft_details")
	private String demandDraftDetails;
	
	@Column(name="others")
	private String others;
	
	@Column(name="work_id")
	private int workId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getPerformanceSecurityAmount() {
		return performanceSecurityAmount;
	}

	public void setPerformanceSecurityAmount(double performanceSecurityAmount) {
		this.performanceSecurityAmount = performanceSecurityAmount;
	}

	public Date getSiteHandOverDate() {
		return siteHandOverDate;
	}

	public void setSiteHandOverDate(Date siteHandOverDate) {
		this.siteHandOverDate = siteHandOverDate;
	}

	public Date getAgreementCouncludedDate() {
		return agreementCouncludedDate;
	}

	public void setAgreementCouncludedDate(Date agreementCouncludedDate) {
		this.agreementCouncludedDate = agreementCouncludedDate;
	}

	public int getPeriodOfContract() {
		return periodOfContract;
	}

	public void setPeriodOfContract(int periodOfContract) {
		this.periodOfContract = periodOfContract;
	}

	public Date getExpectedCompletionDate() {
		return expectedCompletionDate;
	}

	public void setExpectedCompletionDate(Date expectedCompletionDate) {
		this.expectedCompletionDate = expectedCompletionDate;
	}

	public String getAgreementNumber() {
		return agreementNumber;
	}

	public void setAgreementNumber(String agreementNumber) {
		this.agreementNumber = agreementNumber;
	}

	public String getBankGuaranteeDetails() {
		return bankGuaranteeDetails;
	}

	public void setBankGuaranteeDetails(String bankGuaranteeDetails) {
		this.bankGuaranteeDetails = bankGuaranteeDetails;
	}

	public String getDemandDraftDetails() {
		return demandDraftDetails;
	}

	public void setDemandDraftDetails(String demandDraftDetails) {
		this.demandDraftDetails = demandDraftDetails;
	}

	public String getOthers() {
		return others;
	}

	public void setOthers(String others) {
		this.others = others;
	}

	public int getWorkId() {
		return workId;
	}

	public void setWorkId(int workId) {
		this.workId = workId;
	}

	@Override
	public String toString() {
		return "AgreementDetails [id=" + id + ", performanceSecurityAmount=" + performanceSecurityAmount
				+ ", siteHandOverDate=" + siteHandOverDate + ", agreementCouncludedDate=" + agreementCouncludedDate
				+ ", periodOfContract=" + periodOfContract + ", expectedCompletionDate=" + expectedCompletionDate
				+ ", agreementNumber=" + agreementNumber + ", bankGuaranteeDetails=" + bankGuaranteeDetails
				+ ", demandDraftDetails=" + demandDraftDetails + ", others=" + others + ", workId=" + workId + "]";
	}
	
	
	
}
