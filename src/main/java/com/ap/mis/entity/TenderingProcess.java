package com.ap.mis.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tendering_process")
public class TenderingProcess {

	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name="ifb_preparation_date")
	private Date ifbPreperationDate;
	
	@Column(name="tender_notice_number")
	private String tenderNoticeNumber;
	
	@Column(name="tender_notice_issuedDate")
	private Date tenderNoticeIssuedDate;
	
	@Column(name="notice_issusing_authorities")
	private String noticeIssuingAuthorities;
	
	@Column(name="eng_newspaper_name")
	private String englishNewspaperName;
	
	@Column(name="english_newspaper_date")
	private Date engNewsPaperDate;
	
	@Column(name="tel_newspaper_name")
	private String teluguNewspaperName;
	
	@Column(name="telugu_newspaper_date")
	private Date telNewspaperDate;
	
	@Column(name="bid_start_date")
	private Date bidStrartDate;
	
	@Column(name="bid_closing_date")
	private Date bidClosingDate;
	
	@Column(name="bid_opening_date")
	private Date bidOpeningDate;
	
	@Column(name="bids_received")
	private int bidsReceived;
	
	@Column(name="hardcopies_submitted")
	private int hardCopiesSubmitted;
	
	@Column(name="bidsForPriceBid")
	private int bidsForPriceBid;
	
	@Column(name="evaluationCompleted_date")
	private Date dateOfEvaluationCompleted;
	
	@Column(name="contractvalue")
	private double contractValue;
	
	@Column(name="contractvalue_L1bidder")
	private double contractValueByL1Bidder;
	
	@Column(name="percentage_quoted")
	private int percentageQuoted;
	
	@Column(name="bidstatus")
	private String bidStatus;
	
	@Column(name="loa_issued_date")
	private Date dateOfLoaIssued;
	
	@Column(name="agency_name")
	private String angencyName;
	
	@Column(name="work_id")
	private int workId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
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

	public String getNoticeIssuingAuthorities() {
		return noticeIssuingAuthorities;
	}

	public void setNoticeIssuingAuthorities(String noticeIssuingAuthorities) {
		this.noticeIssuingAuthorities = noticeIssuingAuthorities;
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

	public int getBidsReceived() {
		return bidsReceived;
	}

	public void setBidsReceived(int bidsReceived) {
		this.bidsReceived = bidsReceived;
	}

	public int getHardCopiesSubmitted() {
		return hardCopiesSubmitted;
	}

	public void setHardCopiesSubmitted(int hardCopiesSubmitted) {
		this.hardCopiesSubmitted = hardCopiesSubmitted;
	}

	public int getBidsForPriceBid() {
		return bidsForPriceBid;
	}

	public void setBidsForPriceBid(int bidsForPriceBid) {
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

	public String getAngencyName() {
		return angencyName;
	}

	public void setAngencyName(String angencyName) {
		this.angencyName = angencyName;
	}

	public int getWorkId() {
		return workId;
	}

	public void setWorkId(int workId) {
		this.workId = workId;
	}

	@Override
	public String toString() {
		return "TenderingProcess [id=" + id + ", ifbPreperationDate=" + ifbPreperationDate + ", tenderNoticeNumber="
				+ tenderNoticeNumber + ", tenderNoticeIssuedDate=" + tenderNoticeIssuedDate
				+ ", noticeIssuingAuthorities=" + noticeIssuingAuthorities + ", englishNewspaperName="
				+ englishNewspaperName + ", engNewsPaperDate=" + engNewsPaperDate + ", teluguNewspaperName="
				+ teluguNewspaperName + ", telNewspaperDate=" + telNewspaperDate + ", bidStrartDate=" + bidStrartDate
				+ ", bidClosingDate=" + bidClosingDate + ", bidOpeningDate=" + bidOpeningDate + ", bidsReceived="
				+ bidsReceived + ", hardCopiesSubmitted=" + hardCopiesSubmitted + ", bidsForPriceBid=" + bidsForPriceBid
				+ ", dateOfEvaluationCompleted=" + dateOfEvaluationCompleted + ", contractValue=" + contractValue
				+ ", contractValueByL1Bidder=" + contractValueByL1Bidder + ", percentageQuoted=" + percentageQuoted
				+ ", bidStatus=" + bidStatus + ", dateOfLoaIssued=" + dateOfLoaIssued + ", angencyName=" + angencyName
				+ ", workId=" + workId + "]";
	}
		
	
	
}
