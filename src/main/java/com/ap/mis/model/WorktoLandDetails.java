package com.ap.mis.model;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.DepartmentLinkingLine;
import com.ap.mis.entity.LandDetails;
import com.ap.mis.entity.Works;

public class WorktoLandDetails implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5723112479319013984L;

	private Works works;

	private AdministrativeSection administrativeesction;

	private DepartmentLinkingLine departmentlinkingine;

	private LandDetails landdetails;

	

	public Works getWorks() {
		return works;
	}

	public void setWorks(Works works) {
		this.works = works;
	}

	public AdministrativeSection getAdministrativeesction() {
		return administrativeesction;
	}

	public void setAdministrativeesction(AdministrativeSection administrativeesction) {
		this.administrativeesction = administrativeesction;
	}

	public DepartmentLinkingLine getDepartmentlinkingine() {
		return departmentlinkingine;
	}

	public void setDepartmentlinkingine(DepartmentLinkingLine departmentlinkingine) {
		this.departmentlinkingine = departmentlinkingine;
	}

	public LandDetails getLanddetails() {
		return landdetails;
	}

	public void setLanddetails(LandDetails landdetails) {
		this.landdetails = landdetails;
	}

	@Override
	public String toString() {
		return "WorktoLandDetails [works=" + works + ", administrativeesction=" + administrativeesction
				+ ", departmentlinkingine=" + departmentlinkingine + ", landdetails=" + landdetails + "]";
	}

	

}
