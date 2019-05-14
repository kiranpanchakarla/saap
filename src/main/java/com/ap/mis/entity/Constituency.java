package com.ap.mis.entity;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name = "constituency")

public class Constituency implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "constituency_id")
    private int id;

    @Column(name = "constituency_name")
    private String name;

    @Column(name = "district_id")
    private Long districtId;

    @Column(name = "constituency_isactive")
    private boolean active;

    @Column(name = "constituency_isdeleted")
    private boolean deleted;

	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getDistrictId() {
		return districtId;
	}

	public void setDistrictId(Long districtId) {
		this.districtId = districtId;
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
    
    
}
