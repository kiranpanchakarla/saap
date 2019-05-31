package com.ap.mis.entity;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name = "tbl_sa_constituency")

public class Constituency implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "constituency_id")
    private int id;

    @Column(name = "constituency_name")
    private String name;
    
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="district_id", referencedColumnName = "district_id")
	private District  districtId; 

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

	public District getDistrictId() {
		return districtId;
	}

	public void setDistrictId(District districtId) {
		this.districtId = districtId;
	}
    
    
}
