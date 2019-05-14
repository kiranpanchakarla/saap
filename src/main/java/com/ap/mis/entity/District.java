package com.ap.mis.entity;


import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name = "districts")
public class District implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "district_id")
    private int id;

    @Column(name = "district_name")
    private String name;

    @Column(name = "state_id")
    private Long stateId;

    @Column(name = "district_isactive")
    private boolean active;

    @Column(name = "district_isdeleted")
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

	public Long getStateId() {
		return stateId;
	}

	public void setStateId(Long stateId) {
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
    
    
}
