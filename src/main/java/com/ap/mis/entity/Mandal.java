package com.ap.mis.entity;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name = "tbl_sa_mandals")
public class Mandal implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name = "mandal_id")
	private int id;

	@Column(name = "mandal_name")
	private String name;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "constituency_id", referencedColumnName = "constituency_id")
	private Constituency constituencyId;

	@Column(name = "mandal_isactive")
	private boolean active;

	@Column(name = "mandal_isdeleted")
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

	public Constituency getConstituencyId() {
		return constituencyId;
	}

	public void setConstituencyId(Constituency constituencyId) {
		this.constituencyId = constituencyId;
	}
}
