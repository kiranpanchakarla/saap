package com.ap.mis.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.AdministrativeSectionDao;
import com.ap.mis.entity.ExecutiveConsultant;
import com.ap.mis.entity.ExecutiveDept;
import com.ap.mis.entity.FinancialYear;
import com.ap.mis.entity.GrantType;

@Repository
@Transactional
public class AdministrativeSectionDaoImpl implements AdministrativeSectionDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<GrantType> findAll() {
		@SuppressWarnings("unchecked")
		List<GrantType> GrantTypeList= sessionFactory.getCurrentSession().createQuery("from GrantType").getResultList();
		return GrantTypeList;
	}

	@Override
	public List<FinancialYear> getfinancialYearList() {
		@SuppressWarnings("unchecked")
		List<FinancialYear> finList= sessionFactory.getCurrentSession().createQuery("from FinancialYear").getResultList();
		return finList;
	}

	@Override
	public List<ExecutiveDept> getExecutiveDeptList() {
		@SuppressWarnings("unchecked")
		List<ExecutiveDept> executiveDeptList= sessionFactory.getCurrentSession().createQuery("from ExecutiveDept").getResultList();
		return executiveDeptList;
	}

	@Override
	public List<ExecutiveConsultant> getExecutiveConsultantList() {
		@SuppressWarnings("unchecked")
		List<ExecutiveConsultant> excConsultantList= sessionFactory.getCurrentSession().createQuery("from ExecutiveConsultant").getResultList();
		return excConsultantList;
	}

}
