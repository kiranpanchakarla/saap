package com.ap.mis.entity;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "tbl_sa_workshistory")
public class WorkHistory implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "history_id", nullable = false, unique = true)
	private Integer historyId;

	@Column(name = "module")
	private String module;

	@Column(name = "sub_module")
	private String subModule;

	@Column(name = "action")
	private String actionPerform;

	@ManyToOne(targetEntity = User.class)
	@JoinColumn(name = "user_id", referencedColumnName = "user_id")
	private User user;

	@Column(name = "created_date")
	private Date createdDate;

	@ManyToOne(targetEntity = Works.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "work_id", referencedColumnName = "id")
	private Works work;

	@Transient
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	public Integer getHistoryId() {
		return historyId;
	}

	public void setHistoryId(Integer historyId) {
		this.historyId = historyId;
	}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public String getSubModule() {
		return subModule;
	}

	public void setSubModule(String subModule) {
		this.subModule = subModule;
	}

	public String getActionPerform() {
		return actionPerform;
	}

	public void setActionPerform(String actionPerform) {
		this.actionPerform = actionPerform;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Works getWork() {
		return work;
	}

	public void setWork(Works work) {
		this.work = work;
	}

	@Transient
	public Date onlyDate() {
		try {
			return sdf.parse(sdf.format(this.getCreatedDate()));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
