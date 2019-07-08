package com.ap.mis.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ap.mis.dao.LandSurveyDetailsDao;
import com.ap.mis.entity.LandSurveyDetails;
import com.ap.mis.entity.Works;

@Repository
public class LandSurveyDetailsDaoImpl implements LandSurveyDetailsDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<LandSurveyDetails> findAll() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from LandSurveyDetails").getResultList();
	}

	@Override
	public LandSurveyDetails findById(int landSurveyId) {
		// TODO Auto-generated method stub
		return (LandSurveyDetails) sessionFactory.getCurrentSession()
				.createQuery("from LandSurveyDetails where id = :id").setParameter("id", landSurveyId).uniqueResult();
	}

	@Override
	public LandSurveyDetails findByWork(Works work) {
		// TODO Auto-generated method stub
		return (LandSurveyDetails) sessionFactory.getCurrentSession()
				.createQuery("from LandSurveyDetails where work = :work").setParameter("work", work).uniqueResult();
	}

	@Override
	public LandSurveyDetails save(LandSurveyDetails landSurveyDetails) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(landSurveyDetails);
		return landSurveyDetails;
	}

}
