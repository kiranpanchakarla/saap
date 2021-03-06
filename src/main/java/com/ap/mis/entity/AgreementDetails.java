package com.ap.mis.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "tbl_sa_agreement_details")
public class AgreementDetails extends AuditModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, unique = true)
	private Integer id;

	@Column(name = "perf_securityAmount")
	private double performanceSecurityAmount;
	
	@Column(name = "bgAmount")
	private double bgAmount;

	@Column(name = "sitehandover_date")
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date siteHandOverDate;

	@Column(name = "agreementConcluded_date")
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date agreementCouncludedDate;

	@Column(name = "periodofcontract")
	private int periodOfContract;

	@Column(name = "expcompletion_date")
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date expectedCompletionDate;

	@Column(name = "agreement_number")
	private String agreementNumber;

	@Column(name = "bank_gauranteedetails")
	private String bankGuaranteeDetails;

	@Column(name = "demanddraft_details")
	private String demandDraftDetails;

	@Column(name = "others")
	private String others;

	@OneToOne(targetEntity = Works.class)
	@JoinColumn(name = "work_id", referencedColumnName = "id")
	private Works work;
	
    private transient String natureOfWork;
	
	private transient String workNo;
	
	private transient String contratorName;
	
	//private transient double bgAmount;
	
	@OneToOne(targetEntity = TenderingProcess.class)
	   @JoinColumn(name = "tender_id", referencedColumnName = "id")
	   private TenderingProcess tenderingProcess;

	   public TenderingProcess getTenderingProcess() {
	       return tenderingProcess;
	   }

	   public void setTenderingProcess(TenderingProcess tenderingProcess) {
	       this.tenderingProcess = tenderingProcess;
	   }
	

	public String getNatureOfWork() {
		return natureOfWork;
	}

	public void setNatureOfWork(String natureOfWork) {
		this.natureOfWork = natureOfWork;
	}

	public String getWorkNo() {
		return workNo;
	}

	public void setWorkNo(String workNo) {
		this.workNo = workNo;
	}

	public String getContratorName() {
		return contratorName;
	}

	public void setContratorName(String contratorName) {
		this.contratorName = contratorName;
	}

	public double getBgAmount() {
		return bgAmount;
	}

	public void setBgAmount(double bgAmount) {
		this.bgAmount = bgAmount;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
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

	public Works getWork() {
		return work;
	}

	public void setWork(Works work) {
		this.work = work;
	}

	@Override
	public String toString() {
		return "AgreementDetails [id=" + id + ", performanceSecurityAmount=" + performanceSecurityAmount
				+ ", siteHandOverDate=" + siteHandOverDate + ", agreementCouncludedDate=" + agreementCouncludedDate
				+ ", periodOfContract=" + periodOfContract + ", expectedCompletionDate=" + expectedCompletionDate
				+ ", agreementNumber=" + agreementNumber + ", bankGuaranteeDetails=" + bankGuaranteeDetails
				+ ", demandDraftDetails=" + demandDraftDetails + ", others=" + others + ", work=" + work + "]";
	}



}
