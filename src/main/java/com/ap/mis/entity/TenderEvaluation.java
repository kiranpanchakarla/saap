package com.ap.mis.entity;

import java.io.Serializable;
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
@Table(name = "tbl_sa_tender_evaluation")
public class TenderEvaluation extends AuditModel implements Serializable  {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, unique = true)
	private Integer id;
	
	/*
	@Column(name = "estimate_amount")
	private int estimateAmount;
	
	@Column(name = "administrative_sanctioned_date")
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date administrativeSanctionedDate;
	
	@Column(name = "administrative_sanctioned_amount")
	private double administrativeSanctionedAmount;
	
	@Column(name = "technical_sanctioned_number")
	private int technicalSanctionedNumber;
	
	@Column(name = "technical_sanctioned_amount")
	private double technicalSanctionedAmount;
	
	@Column(name = "technical_sanctioned_date")
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date technicalSanctionedDate;
	*/
	
	@Column(name = "estimate_contract_value")
	private int estimateContractValue;
	
	@Column(name = "agreement_category")
	private String agreementCategory;
	
	@Column(name = "agreement_number")
	private String agreementNumber;
	
	@Column(name = "name_of_contractor")
	private String  nameOfContractor;
	
	@Column(name = "tender_premium")
	private int tenderPremium;
	
	@Column(name = "tender_premium_pay")
	private String tenderPremiumPay;
	
	@Column(name = "original_or_supplemental")
	private String originalOrSupplemental;
	
	@Column(name = "approximate_value_of_work")
	private int approximateValueOfWork;
	
	@Column(name = "reasons_recorded")
	private String reasonsRecorded;
	
	@Column(name = "no_of_tenders_received")
	private int noOfTendersReceived;
	
	@Column(name = "time_allowed_for_this_tender")
	private int timeAllowedForThisTender;
	
	@Column(name = "contractor_signed")
	private String contractorSigned;
	
	@Column(name = " date_furnished")
	private String  dateFurnished;
	
	@Column(name = " estimate_rates_comments")
	private String  estimateRatesComments;
	
	@Column(name = "commencementDate")
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date commencementDate;
	
	@Column(name = "actual_completion")
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date actualCompletion;
	
	@Column(name = "probable_completion")
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date probableCompletion;
	
	@Column(name = "contracting_agency")
	private String  contractingAgency;
	
	@OneToOne(targetEntity = Works.class)
	@JoinColumn(name = "work_id", referencedColumnName = "id")
	private Works work;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getEstimateContractValue() {
		return estimateContractValue;
	}

	public void setEstimateContractValue(int estimateContractValue) {
		this.estimateContractValue = estimateContractValue;
	}

	public String getAgreementCategory() {
		return agreementCategory;
	}

	public void setAgreementCategory(String agreementCategory) {
		this.agreementCategory = agreementCategory;
	}

	public String getAgreementNumber() {
		return agreementNumber;
	}

	public void setAgreementNumber(String agreementNumber) {
		this.agreementNumber = agreementNumber;
	}

	public String getNameOfContractor() {
		return nameOfContractor;
	}

	public void setNameOfContractor(String nameOfContractor) {
		this.nameOfContractor = nameOfContractor;
	}

	public int getTenderPremium() {
		return tenderPremium;
	}

	public void setTenderPremium(int tenderPremium) {
		this.tenderPremium = tenderPremium;
	}

	public String getTenderPremiumPay() {
		return tenderPremiumPay;
	}

	public void setTenderPremiumPay(String tenderPremiumPay) {
		this.tenderPremiumPay = tenderPremiumPay;
	}

	public String getOriginalOrSupplemental() {
		return originalOrSupplemental;
	}

	public void setOriginalOrSupplemental(String originalOrSupplemental) {
		this.originalOrSupplemental = originalOrSupplemental;
	}

	public int getApproximateValueOfWork() {
		return approximateValueOfWork;
	}

	public void setApproximateValueOfWork(int approximateValueOfWork) {
		this.approximateValueOfWork = approximateValueOfWork;
	}

	public String getReasonsRecorded() {
		return reasonsRecorded;
	}

	public void setReasonsRecorded(String reasonsRecorded) {
		this.reasonsRecorded = reasonsRecorded;
	}

	public int getNoOfTendersReceived() {
		return noOfTendersReceived;
	}

	public void setNoOfTendersReceived(int noOfTendersReceived) {
		this.noOfTendersReceived = noOfTendersReceived;
	}

	public int getTimeAllowedForThisTender() {
		return timeAllowedForThisTender;
	}

	public void setTimeAllowedForThisTender(int timeAllowedForThisTender) {
		this.timeAllowedForThisTender = timeAllowedForThisTender;
	}

	public String getContractorSigned() {
		return contractorSigned;
	}

	public void setContractorSigned(String contractorSigned) {
		this.contractorSigned = contractorSigned;
	}

	public String getDateFurnished() {
		return dateFurnished;
	}

	public void setDateFurnished(String dateFurnished) {
		this.dateFurnished = dateFurnished;
	}

	public String getEstimateRatesComments() {
		return estimateRatesComments;
	}

	public void setEstimateRatesComments(String estimateRatesComments) {
		this.estimateRatesComments = estimateRatesComments;
	}

	public Date getCommencementDate() {
		return commencementDate;
	}

	public void setCommencementDate(Date commencementDate) {
		this.commencementDate = commencementDate;
	}

	public Date getActualCompletion() {
		return actualCompletion;
	}

	public void setActualCompletion(Date actualCompletion) {
		this.actualCompletion = actualCompletion;
	}

	public Date getProbableCompletion() {
		return probableCompletion;
	}

	public void setProbableCompletion(Date probableCompletion) {
		this.probableCompletion = probableCompletion;
	}

	public String getContractingAgency() {
		return contractingAgency;
	}

	public void setContractingAgency(String contractingAgency) {
		this.contractingAgency = contractingAgency;
	}

	public Works getWork() {
		return work;
	}

	public void setWork(Works work) {
		this.work = work;
	}

	
	
	
	
}
