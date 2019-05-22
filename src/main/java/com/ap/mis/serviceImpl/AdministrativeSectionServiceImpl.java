package com.ap.mis.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.AdministrativeSectionDao;
import com.ap.mis.entity.ExecutiveConsultant;
import com.ap.mis.entity.ExecutiveDept;
import com.ap.mis.entity.FinancialYear;
import com.ap.mis.entity.GrantType;
import com.ap.mis.service.AdministrativeSectionService;

@Service
@Transactional
public class AdministrativeSectionServiceImpl implements AdministrativeSectionService {

	@Autowired AdministrativeSectionDao administrativeSectionDao;
	@Override
	public List<GrantType> findAll() {
		return administrativeSectionDao.findAll();
	}
	@Override
	public List<FinancialYear> getfinancialYearList() {
		return administrativeSectionDao.getfinancialYearList();
	}
	@Override
	public List<ExecutiveDept> getExecutiveDeptList() {
		return administrativeSectionDao.getExecutiveDeptList();
	}
	@Override
	public List<ExecutiveConsultant> getExecutiveConsultantList() {
		return administrativeSectionDao.getExecutiveConsultantList();
	}

}
