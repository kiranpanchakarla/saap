package com.ap.mis.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.hibernate.Query;

import com.ap.mis.dao.DistrictDao;
import com.ap.mis.entity.District;

@Repository
@Transactional
public class DistrictDaoImpl implements DistrictDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<District> findAll() {
		 	String ss="from District";
			Query q=sessionFactory.getCurrentSession().createQuery(ss);
			List<District> allDistricts=q.list();
			return allDistricts;
	}

	@Override
	public List<District> findByState(int stateId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public District findById(int id) {
		District district = new District();
		district = (District) sessionFactory.getCurrentSession().get(District.class, id);
		return district;
	}
	
	

}
