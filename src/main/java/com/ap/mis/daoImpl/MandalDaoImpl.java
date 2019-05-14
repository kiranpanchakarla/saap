package com.ap.mis.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.MandalDao;
import com.ap.mis.entity.Mandal;
import com.ap.mis.entity.Village;

@Repository
@Transactional
public class MandalDaoImpl implements MandalDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public List<Mandal> findAll() {
		String ss="from Mandal";
		Query q=sessionFactory.getCurrentSession().createQuery(ss);
		List<Mandal> allmandals = q.list();
		return allmandals;
	}

	@Override
	public Mandal findById(int id) {
		Mandal mandal = new Mandal();
		mandal = (Mandal) sessionFactory.getCurrentSession().get(Mandal.class, id);
		return mandal;
	}

}
