package com.ap.mis.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.TenderingProcessDao;
import com.ap.mis.entity.Agency;
import com.ap.mis.entity.GrantType;
import com.ap.mis.entity.NoticeIssuingAuthorities;

@Repository
@Transactional
public class TenderingProcessDaoImpl implements TenderingProcessDao  {

	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public List<NoticeIssuingAuthorities> getAuthoritiesList() {
		@SuppressWarnings("unchecked")
		List<NoticeIssuingAuthorities> authoritiesTypeList= sessionFactory.getCurrentSession().createQuery("from NoticeIssuingAuthorities").getResultList();
		return authoritiesTypeList;
	}

	@Override
	public List<Agency> getAgencyList() {
		@SuppressWarnings("unchecked")
		List<Agency> agencyList= sessionFactory.getCurrentSession().createQuery("from Agency").getResultList();
		return agencyList;
	}

}
