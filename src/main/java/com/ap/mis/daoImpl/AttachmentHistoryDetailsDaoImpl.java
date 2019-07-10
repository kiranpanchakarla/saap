package com.ap.mis.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.AttachmentHistoryDetailsDao;
import com.ap.mis.entity.AttachmentHistoryDetails;
@Repository
@Transactional
public class AttachmentHistoryDetailsDaoImpl implements AttachmentHistoryDetailsDao{

	
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public List<AttachmentHistoryDetails> findHistoryListById(Integer id) {
		@SuppressWarnings("unchecked")
		List<AttachmentHistoryDetails> attachHistoryDetailsList =sessionFactory.getCurrentSession().createQuery("from AttachmentHistoryDetails").getResultList();
		return attachHistoryDetailsList;
	}
	@Override
	public AttachmentHistoryDetails save(AttachmentHistoryDetails attachHistDetails) {
	try {
		sessionFactory.getCurrentSession().save(attachHistDetails);
	}catch(Exception ex) {
		ex.printStackTrace();
	}
		return attachHistDetails;
	}

}
