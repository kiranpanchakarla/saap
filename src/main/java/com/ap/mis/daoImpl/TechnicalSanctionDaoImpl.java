package com.ap.mis.daoImpl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.TechnicalSanctionDao;
import com.ap.mis.entity.TechnicalSanction;

@Repository
@Transactional
public class TechnicalSanctionDaoImpl implements TechnicalSanctionDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public TechnicalSanction saveTechSanction(TechnicalSanction techsanc) {

		try {
			sessionFactory.getCurrentSession().save(techsanc);

		} catch (Exception e) {
			e.printStackTrace();

		}
		return techsanc;
	}

}
