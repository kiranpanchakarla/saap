package com.ap.mis.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.VillageDao;
import com.ap.mis.entity.Constituency;
import com.ap.mis.entity.District;
import com.ap.mis.entity.Village;


@Repository
@Transactional
public class VillageDaoImpl implements VillageDao {
	
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Village> findAll() {
		String ss="from Village";
		Query q=sessionFactory.getCurrentSession().createQuery(ss);
		List<Village> allVillages = q.list();
		return allVillages;
	}

	@Override
	public Village findById(int id) {
		Village village = new Village();
		village = (Village) sessionFactory.getCurrentSession().get(Village.class, id);
		return village;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Village> findByMandalId(int id) {
		List<Village> list = sessionFactory.getCurrentSession()
		        .createQuery( "from Village v where v.mandalId=' "+ id +"'" )
		        .list();
		return list;
	}

}
