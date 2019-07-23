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
@Table(name = "tbl_sa_tenderevaluation")
public class TenderEvaluation extends AuditModel implements Serializable  {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, unique = true)
	private Integer id;
	
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
	
	@Column(name = "estimate_contract_value")
	private int estimateContractValue;
	
	@Column(name = "agreement_category")
	private String agreementCategory;
	
	@Column(name = "agreement_number")
	private int agreementNumber;
	
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
}
