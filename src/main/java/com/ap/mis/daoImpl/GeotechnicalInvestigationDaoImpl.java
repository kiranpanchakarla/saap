package com.ap.mis.daoImpl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ap.mis.dao.GeotechnicalInvestigationDao;
import com.ap.mis.entity.GeotechnicalInvestigation;
import com.ap.mis.entity.Works;

@Repository
public class GeotechnicalInvestigationDaoImpl implements GeotechnicalInvestigationDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public GeotechnicalInvestigation findByWork(Works work) {

		GeotechnicalInvestigation geotechnicalInvestigation = (GeotechnicalInvestigation) sessionFactory
				.getCurrentSession().createQuery("from GeotechnicalInvestigation where work = :work")
				.setParameter("work", work).uniqueResult();
		return geotechnicalInvestigation;
	}

	@Override
	public GeotechnicalInvestigation findById(int id) {
		// TODO Auto-generated method stub
		GeotechnicalInvestigation geotechnicalInvestigation = (GeotechnicalInvestigation) sessionFactory
				.getCurrentSession().createQuery("from GeotechnicalInvestigation where id= :id").setParameter("id", id)
				.uniqueResult();

		return geotechnicalInvestigation;
	}

	@Override
	public GeotechnicalInvestigation save(GeotechnicalInvestigation geotechnicalInvestigation) {
		// TODO Auto-generated method stub

		sessionFactory.getCurrentSession().saveOrUpdate(geotechnicalInvestigation);

		return geotechnicalInvestigation;
	}

}
