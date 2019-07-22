package com.ap.mis.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ap.mis.dao.WorkEstimationsDao;
import com.ap.mis.entity.WorkEstimations;
import com.ap.mis.entity.Works;
import com.ap.mis.util.EnumFilter;

@Repository
public class WorkEstimationsDaoImpl implements WorkEstimationsDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public WorkEstimations getWorkEstimationById(int id) {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().get(WorkEstimations.class, id);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<WorkEstimations> findAll() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from WorkEstimations").list();
	}

	@Override
	public WorkEstimations findByWork(Works work) {
		// TODO Auto-generated method stub
		return (WorkEstimations) sessionFactory.getCurrentSession()
				.createQuery("from WorkEstimations where work = :work and status = :status").setParameter("work", work)
				.setParameter("status", EnumFilter.ACTIVE.getStatus()).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<WorkEstimations> findAllWhereStausIsActive() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from WorkEstimations status = :status")
				.setParameter("status", EnumFilter.ACTIVE.getStatus()).list();

	}

	@Override
	public WorkEstimations saveWorkEstimation(WorkEstimations workEstimations) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(workEstimations);

		return workEstimations;
	}

	@Override
	public void deleteWorkEstimation(WorkEstimations workEstimations) {
		sessionFactory.getCurrentSession().update(workEstimations);

	}
}
