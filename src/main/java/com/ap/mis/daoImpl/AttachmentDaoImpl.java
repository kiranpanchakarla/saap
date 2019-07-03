package com.ap.mis.daoImpl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.AttachmentDao;
import com.ap.mis.entity.Attachements;

@Repository
@Transactional
public class AttachmentDaoImpl implements AttachmentDao{
	private static final Logger log = Logger.getLogger(AttachmentDaoImpl.class);
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public List<Attachements> saveAttachedDetails(List<Attachements> attachments) {
		try {
			for(Attachements attachmentDetails : attachments) {
				  sessionFactory.getCurrentSession().save(attachmentDetails);
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return   attachments;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Attachements> getAttachementsDetails(int workId, String moduleName) {
		log.info("===module==:"+moduleName);
			List<Attachements> attachments=sessionFactory.getCurrentSession().createQuery("from Attachements where workId="+workId+" and module='"+moduleName+"'").list();
	return attachments;
	}
	
	@Override
	public Attachements findById(Integer uploadFileId) {
		
		return (Attachements)sessionFactory.getCurrentSession().get(Attachements.class,uploadFileId);
	}
	@Override
	public Attachements deleteAttachedDetails(Attachements attachInfo) {
		sessionFactory.getCurrentSession().update(attachInfo);
		return attachInfo;
	}
	

}
