package com.ap.mis.entity;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name = "tbl_sa_districts")
public class District implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "district_id",nullable = false, unique = true)
	private Integer id;

	@Column(name = "district_name")
	private String name;

	@Column(name = "state_id")
	private Integer stateId;

	@Column(name = "district_isactive")
	private boolean active;

	@Column(name = "district_isdeleted")
	private boolean deleted;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getStateId() {
		return stateId;
	}

	public void setStateId(Integer stateId) {
		this.stateId = stateId;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public boolean isDeleted() {
		return deleted;
	}

	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}

	@Override
	public String toString() {
		return "District [id=" + id + ", name=" + name + ", stateId=" + stateId + ", active=" + active + ", deleted="
				+ deleted + "]";
	}

}
