package com.ap.mis.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.ConstituencyDao;
import com.ap.mis.entity.Constituency;
import com.ap.mis.entity.District;


@Repository
@Transactional
public class ConstituencyDaoImpl implements ConstituencyDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Constituency> findAll() {
		String ss="from Constituency";
		Query q=sessionFactory.getCurrentSession().createQuery(ss);
		List<Constituency> allConstituencs = q.list();
		return allConstituencs;
	}

	@Override
	public Constituency findById(int id) {
		Constituency constituency = new Constituency();
		constituency = (Constituency) sessionFactory.getCurrentSession().get(Constituency.class, id);
		return constituency;
	}

}
