package com.ap.mis.dao;

import java.util.List;

import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.ExecutiveConsultant;
import com.ap.mis.entity.ExecutiveDept;
import com.ap.mis.entity.FinancialYear;
import com.ap.mis.entity.GrantType;

public interface AdministrativeSectionDao {

	public List<GrantType> findAll();
	public List<FinancialYear> getfinancialYearList();
	public List<ExecutiveDept> getExecutiveDeptList();
	public List<ExecutiveConsultant> getExecutiveConsultantList();
	public FinancialYear findById(int id);
	public ExecutiveDept findByExecutiveDeptId(int id);
	public ExecutiveConsultant findByExecutiveConsultantId(int id);
	public GrantType findByGrantId(int id);
	public AdministrativeSection adminstrativeSectionSave(AdministrativeSection adminSecObject);
	public AdministrativeSection getAdminInfo(int id);
	public AdministrativeSection getAdminDetails(int id);

		
}
