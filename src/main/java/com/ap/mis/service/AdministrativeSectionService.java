package com.ap.mis.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ap.mis.entity.ExecutiveConsultant;
import com.ap.mis.entity.ExecutiveDept;
import com.ap.mis.entity.FinancialYear;
import com.ap.mis.entity.GrantType;

@Service
public interface AdministrativeSectionService {

	public List<GrantType> findAll();
	public List<FinancialYear> getfinancialYearList();
	public List<ExecutiveDept> getExecutiveDeptList();
	public List<ExecutiveConsultant> getExecutiveConsultantList();

	
}
