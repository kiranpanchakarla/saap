package com.ap.mis.daoImpl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ap.mis.dao.LetterOfAcceptanceDao;
import com.ap.mis.entity.LetterOfAcceptance;
import com.ap.mis.entity.Works;
@Repository
public class LetterOfAcceptanceDaoImpl implements LetterOfAcceptanceDao{

	
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public LetterOfAcceptance save(LetterOfAcceptance letterOfAcceptance) {
		
		 sessionFactory.getCurrentSession().saveOrUpdate(letterOfAcceptance);
		 return letterOfAcceptance;
	}
	
	@Override
	public LetterOfAcceptance findByWork(Works work) {
		LetterOfAcceptance letterOfAcceptance = (LetterOfAcceptance) sessionFactory.getCurrentSession()
				.createQuery("from LetterOfAcceptance where work=:work")
				.setParameter("work", work).uniqueResult();
		return letterOfAcceptance;
	}

	

}
