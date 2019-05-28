package com.ap.mis.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.LandDetailDao;
import com.ap.mis.entity.Division;
import com.ap.mis.entity.Land;
import com.ap.mis.entity.Section;
import com.ap.mis.entity.Subdivision;
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

	

	@Override
	public Division findByDivisionId(int id) {
		// TODO Auto-generated method stub
		return (Division)sessionFactory.getCurrentSession().get(Division.class, id);
	}

	@Override
	public Subdivision findBySubDivision(int id) {
		// TODO Auto-generated method stub
		return (Subdivision)sessionFactory.getCurrentSession().get(Subdivision.class, id);
	}

	@Override
	public Section findBySectionId(int id) {
		// TODO Auto-generated method stub
		return (Section)sessionFactory.getCurrentSession().get(Section.class, id);
	}
	


}
