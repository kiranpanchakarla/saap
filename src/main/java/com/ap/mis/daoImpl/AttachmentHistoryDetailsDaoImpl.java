package com.ap.mis.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.AttachmentHistoryDetailsDao;
import com.ap.mis.entity.AttachmentHistoryDetails;
import com.ap.mis.entity.Works;

@Repository
@Transactional
public class AttachmentHistoryDetailsDaoImpl implements AttachmentHistoryDetailsDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<AttachmentHistoryDetails> findHistoryListById(Integer id) {
		@SuppressWarnings("unchecked")
		List<AttachmentHistoryDetails> attachHistoryDetailsList = sessionFactory.getCurrentSession()
				.createQuery("from AttachmentHistoryDetails where attach.id=:attachmentId")
				.setParameter("attachmentId", id).getResultList();
		return attachHistoryDetailsList;
	}

	@Override
	public AttachmentHistoryDetails save(AttachmentHistoryDetails attachHistDetails) {
		try {
			sessionFactory.getCurrentSession().save(attachHistDetails);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return attachHistDetails;
	}

	@Override
	public List<AttachmentHistoryDetails> findHistoryListByWorkId(Integer workId) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<AttachmentHistoryDetails> attachHistoryDetailsList = sessionFactory.getCurrentSession()
				.createQuery("from AttachmentHistoryDetails  where attach.workId=:workId")
				.setParameter("workId", workId).getResultList();
		return attachHistoryDetailsList;
	}

}
