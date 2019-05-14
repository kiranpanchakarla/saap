package com.ap.mis.entity;

import javax.persistence.*;

@Entity
@Table(name = "villages")

public class Village {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "village_id")
    private int id;

    @Column(name = "village_name")
    private String name;

    @Column(name = "mandal_id")
    private Long mandalId;

    @Column(name = "village_isactive")
    private boolean active;

    @Column(name = "village_isdeleted")
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

	public Long getMandalId() {
		return mandalId;
	}

	public void setMandalId(Long mandalId) {
		this.mandalId = mandalId;
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
