package com.ap.mis.entity;

import javax.persistence.*;

@Entity
@Table(name = "tbl_sa_villages")

public class Village {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "village_id")
    private int id;

    @Column(name = "village_name")
    private String name;
  
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="mandal_id", referencedColumnName = "mandal_id")
	private Mandal  mandalId; 
   
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

	public Mandal getMandalId() {
		return mandalId;
	}

	public void setMandalId(Mandal mandalId) {
		this.mandalId = mandalId;
	}
    
    
}
