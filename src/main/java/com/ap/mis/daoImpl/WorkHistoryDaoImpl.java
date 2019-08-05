package com.ap.mis.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ap.mis.dao.WorkHistoryDao;
import com.ap.mis.entity.WorkHistory;
import com.ap.mis.entity.Works;

@Repository
public class WorkHistoryDaoImpl implements WorkHistoryDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public WorkHistory saveWorks(WorkHistory workHistory) {
		try {
			sessionFactory.getCurrentSession().save(workHistory);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return workHistory;
	}

	@Override
	public List<WorkHistory> getAllWorkHistoryByWork(Works work) {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession()
				.createQuery("from WorkHistory as wrkh where wrkh.work = :work", WorkHistory.class)
				.setParameter("work", work).getResultList();

	}

}
