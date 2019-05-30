package com.ap.mis.daoImpl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.ConsultantInfoDao;
import com.ap.mis.entity.ConsultantInfo;

@Repository
@Transactional
public class ConsultantInfoDaoImpl implements ConsultantInfoDao{
    @Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public ConsultantInfo saveConsultantInfo(ConsultantInfo consultantInfo) {
		
		
		try{
			sessionFactory.getCurrentSession().save(consultantInfo);	
			
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
		return consultantInfo;
	}

}
