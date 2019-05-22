package com.ap.mis.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.LandDetailDao;
import com.ap.mis.entity.Land;
@Repository
@Transactional
public class LandDetailDaoImpl implements LandDetailDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Land> getLandTypeList() {
		@SuppressWarnings("unchecked")
		List<Land> LandTypeList= sessionFactory.getCurrentSession().createQuery("from Land").getResultList();
		return LandTypeList;
	}

}
