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

import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.lang.Nullable;

@Entity
@Table(name = "tbl_sa_tendering_process")
public class TenderingProcess extends AuditModel{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, unique = true)
	private Integer id;

	@Column(name = "ifb_preparation_date")
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date ifbPreperationDate;

	@Column(name = "tender_notice_number")
	private String tenderNoticeNumber;

	@Column(name = "tender_notice_issuedDate")
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date tenderNoticeIssuedDate;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "notice_issusing_authorities", referencedColumnName = "id")
	private NoticeIssuingAuthorities noticeIssuingAuthorities;

	@Column(name = "eng_newspaper_name")
	private String englishNewspaperName;

	@Nullable
	@Column(name = "english_newspaper_date")
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date engNewsPaperDate;

	@Column(name = "tel_newspaper_name")
	private String teluguNewspaperName;

	@Nullable
	@Column(name = "telugu_newspaper_date")
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date telNewspaperDate;

	@Nullable
	@Column(name = "bid_start_date")
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date bidStrartDate;

	@Nullable
	@Column(name = "bid_closing_date")
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date bidClosingDate;

	@Nullable
	@Column(name = "bid_opening_date")
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date bidOpeningDate;

	@Column(name = "bids_received")
	private Integer bidsReceived;

	@Column(name = "hardcopies_submitted")
	private Integer hardCopiesSubmitted;

	@Column(name = "bidsForPriceBid")
	private Integer bidsForPriceBid;

	@Nullable
	@Column(name = "evaluationCompleted_date")
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date dateOfEvaluationCompleted;

	@Column(name = "contractvalue")
	private double contractValue;

	@Column(name = "contractvalue_L1bidder")
	private double contractValueByL1Bidder;

	@Nullable
	@Column(name = "percentage_quoted")
	private int percentageQuoted;

	@Nullable
	@Column(name = "bidstatus")
	private String bidStatus;

	@Nullable
	@Column(name = "loa_issued_date")
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date dateOfLoaIssued;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "agency_name", referencedColumnName = "id")
	private Agency angencyName;

	@OneToOne(targetEntity = Works.class)
	@JoinColumn(name = "work_id", referencedColumnName = "id")
	private Works work;

	
	
	private transient String workNumber;
	
	private transient String workName;

	
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

	public Date getIfbPreperationDate() {
		return ifbPreperationDate;
	}

	public void setIfbPreperationDate(Date ifbPreperationDate) {
		this.ifbPreperationDate = ifbPreperationDate;
	}

	public String getTenderNoticeNumber() {
		return tenderNoticeNumber;
	}

	public void setTenderNoticeNumber(String tenderNoticeNumber) {
		this.tenderNoticeNumber = tenderNoticeNumber;
	}

	public Date getTenderNoticeIssuedDate() {
		return tenderNoticeIssuedDate;
	}

	public void setTenderNoticeIssuedDate(Date tenderNoticeIssuedDate) {
		this.tenderNoticeIssuedDate = tenderNoticeIssuedDate;
	}

	public String getEnglishNewspaperName() {
		return englishNewspaperName;
	}

	public void setEnglishNewspaperName(String englishNewspaperName) {
		this.englishNewspaperName = englishNewspaperName;
	}

	public Date getEngNewsPaperDate() {
		return engNewsPaperDate;
	}

	public void setEngNewsPaperDate(Date engNewsPaperDate) {
		this.engNewsPaperDate = engNewsPaperDate;
	}

	public String getTeluguNewspaperName() {
		return teluguNewspaperName;
	}

	public void setTeluguNewspaperName(String teluguNewspaperName) {
		this.teluguNewspaperName = teluguNewspaperName;
	}

	public Date getTelNewspaperDate() {
		return telNewspaperDate;
	}

	public void setTelNewspaperDate(Date telNewspaperDate) {
		this.telNewspaperDate = telNewspaperDate;
	}

	public Date getBidStrartDate() {
		return bidStrartDate;
	}

	public void setBidStrartDate(Date bidStrartDate) {
		this.bidStrartDate = bidStrartDate;
	}

	public Date getBidClosingDate() {
		return bidClosingDate;
	}

	public void setBidClosingDate(Date bidClosingDate) {
		this.bidClosingDate = bidClosingDate;
	}

	public Date getBidOpeningDate() {
		return bidOpeningDate;
	}

	public void setBidOpeningDate(Date bidOpeningDate) {
		this.bidOpeningDate = bidOpeningDate;
	}

	public Integer getBidsReceived() {
		return bidsReceived;
	}

	public void setBidsReceived(Integer bidsReceived) {
		this.bidsReceived = bidsReceived;
	}

	public Integer getHardCopiesSubmitted() {
		return hardCopiesSubmitted;
	}

	public void setHardCopiesSubmitted(Integer hardCopiesSubmitted) {
		this.hardCopiesSubmitted = hardCopiesSubmitted;
	}

	public Integer getBidsForPriceBid() {
		return bidsForPriceBid;
	}

	public void setBidsForPriceBid(Integer bidsForPriceBid) {
		this.bidsForPriceBid = bidsForPriceBid;
	}

	public Date getDateOfEvaluationCompleted() {
		return dateOfEvaluationCompleted;
	}

	public void setDateOfEvaluationCompleted(Date dateOfEvaluationCompleted) {
		this.dateOfEvaluationCompleted = dateOfEvaluationCompleted;
	}

	public double getContractValue() {
		return contractValue;
	}

	public void setContractValue(double contractValue) {
		this.contractValue = contractValue;
	}

	public double getContractValueByL1Bidder() {
		return contractValueByL1Bidder;
	}

	public void setContractValueByL1Bidder(double contractValueByL1Bidder) {
		this.contractValueByL1Bidder = contractValueByL1Bidder;
	}

	public int getPercentageQuoted() {
		return percentageQuoted;
	}

	public void setPercentageQuoted(int percentageQuoted) {
		this.percentageQuoted = percentageQuoted;
	}

	public String getBidStatus() {
		return bidStatus;
	}

	public void setBidStatus(String bidStatus) {
		this.bidStatus = bidStatus;
	}

	public Date getDateOfLoaIssued() {
		return dateOfLoaIssued;
	}

	public void setDateOfLoaIssued(Date dateOfLoaIssued) {
		this.dateOfLoaIssued = dateOfLoaIssued;
	}

	public NoticeIssuingAuthorities getNoticeIssuingAuthorities() {
		return noticeIssuingAuthorities;
	}

	public void setNoticeIssuingAuthorities(NoticeIssuingAuthorities noticeIssuingAuthorities) {
		this.noticeIssuingAuthorities = noticeIssuingAuthorities;
	}

	public Agency getAngencyName() {
		return angencyName;
	}

	public void setAngencyName(Agency angencyName) {
		this.angencyName = angencyName;
	}

	public Works getWork() {
		return work;
	}

	public void setWork(Works work) {
		this.work = work;
	}

	

}
