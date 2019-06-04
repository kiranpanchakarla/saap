
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
@Table(name = "tbl_sa_consultant_Info")
public class ConsultantInfo implements Serializable {
	private static final long serialVersionUID = -3465813074586302847L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, unique = true)
	private Integer id;

	@Column(name = "consultant_firm")
	private String consultant_firm;

	@Column(name = "pan_number")
	private String pan_number;

	@Column(name = "tin_number")
	private String tin_number;

	@Column(name = "mobile_no")
	private String mobile_no;

	@Column(name = "landline_no")
	private String landline_no;

	@Column(name = "emailId")
	private String emailId;

	@Column(name = "address")
	private String address;

	@Column(name = "bank_name")
	private String bank_name;

	@Column(name = "branch")
	private String branch;

	@Column(name = "account_type")
	private String account_type;

	@Column(name = "account_number")
	private long account_number;

	@Column(name = "ifsc_code")
	private String ifsc_code;

	@OneToOne(targetEntity = Works.class)
	@JoinColumn(name = "work_id", referencedColumnName = "id")
	private Works work;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getConsultant_firm() {
		return consultant_firm;
	}

	public void setConsultant_firm(String consultant_firm) {
		this.consultant_firm = consultant_firm;
	}

	public String getPan_number() {
		return pan_number;
	}

	public void setPan_number(String pan_number) {
		this.pan_number = pan_number;
	}

	public String getTin_number() {
		return tin_number;
	}

	public void setTin_number(String tin_number) {
		this.tin_number = tin_number;
	}

	public String getMobile_no() {
		return mobile_no;
	}

	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}

	public String getLandline_no() {
		return landline_no;
	}

	public void setLandline_no(String landline_no) {
		this.landline_no = landline_no;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getAccount_type() {
		return account_type;
	}

	public void setAccount_type(String account_type) {
		this.account_type = account_type;
	}

	public long getAccount_number() {
		return account_number;
	}

	public void setAccount_number(long account_number) {
		this.account_number = account_number;
	}

	public String getIfsc_code() {
		return ifsc_code;
	}

	public void setIfsc_code(String ifsc_code) {
		this.ifsc_code = ifsc_code;
	}

	public Works getWork() {
		return work;
	}

	public void setWork(Works work) {
		this.work = work;
	}

	@Override
	public String toString() {
		return "ConsultantInfo [id=" + id + ", consultant_firm=" + consultant_firm + ", pan_number=" + pan_number
				+ ", tin_number=" + tin_number + ", mobile_no=" + mobile_no + ", landline_no=" + landline_no
				+ ", emailId=" + emailId + ", address=" + address + ", bank_name=" + bank_name + ", branch=" + branch
				+ ", account_type=" + account_type + ", account_number=" + account_number + ", ifsc_code=" + ifsc_code
				+ ", work=" + work + "]";
	}



}
