package com.ap.mis.daoImpl;

import javax.persistence.EntityNotFoundException;
import javax.persistence.NoResultException;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ap.mis.dao.TenderEvaluationDao;
import com.ap.mis.entity.TenderEvaluation;
import com.ap.mis.entity.Works;

@Repository
public class TenderEvaluationDaoImpl implements TenderEvaluationDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public TenderEvaluation findTenderEvaluationByWork(Works work) {
		// TODO Auto-generated method stub
		try {
			return (TenderEvaluation) sessionFactory.getCurrentSession()
					.createQuery("from  TenderEvaluation where work=:work").setParameter("work", work)
					.getSingleResult();
		} catch (EntityNotFoundException | NoResultException e) {
			return null;
		}

	}

	@Override
	public TenderEvaluation saveTenderEvaluation(TenderEvaluation tenderEvaluation) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(tenderEvaluation);
		return tenderEvaluation;
	}

}
