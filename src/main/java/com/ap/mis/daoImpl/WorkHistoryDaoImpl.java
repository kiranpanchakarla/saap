package com.ap.mis.daoImpl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ap.mis.dao.WorkHistoryDao;
import com.ap.mis.entity.WorkHistory;

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

}
