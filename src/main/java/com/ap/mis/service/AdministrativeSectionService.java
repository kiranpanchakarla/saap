package com.ap.mis.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.Attachements;
import com.ap.mis.entity.ExecutiveConsultant;
import com.ap.mis.entity.ExecutiveDept;
import com.ap.mis.entity.FinancialYear;
import com.ap.mis.entity.GrantType;
import com.ap.mis.entity.Village;

@Service
public interface AdministrativeSectionService {

	public List<GrantType> findAll();

	public List<FinancialYear> getfinancialYearList();

	public List<ExecutiveDept> getExecutiveDeptList();

	public List<ExecutiveConsultant> getExecutiveConsultantList();

	public FinancialYear findById(int id);

	public ExecutiveDept findByExecutiveDeptId(int id);

	public ExecutiveConsultant findByExecutiveConsultantId(int id);
	
	public AdministrativeSection adminstrativeSectionSave(AdministrativeSection adminSecObject);

	public GrantType findByGrantId(int id);

	public AdministrativeSection getAdminInfo(int id);

	public AdministrativeSection getAdminDetails(int id);

	public AdministrativeSection adminstrativeSectionUpdate(AdministrativeSection adminSecObject);

	

	

}
