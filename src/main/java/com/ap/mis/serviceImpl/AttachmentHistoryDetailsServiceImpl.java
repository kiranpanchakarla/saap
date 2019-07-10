package com.ap.mis.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ap.mis.dao.AttachmentHistoryDetailsDao;
import com.ap.mis.entity.AttachmentHistoryDetails;
import com.ap.mis.service.AttachmentHistoryDetailsService;
@Service
public class AttachmentHistoryDetailsServiceImpl implements AttachmentHistoryDetailsService{
@Autowired
private AttachmentHistoryDetailsDao attachmentHistoryDetailsDao;
	
	@Override
	public List<AttachmentHistoryDetails> findHistoryListById(Integer id) {
		
		return attachmentHistoryDetailsDao.findHistoryListById(id);
	}

	@Override
	public AttachmentHistoryDetails save(AttachmentHistoryDetails attachHistDetails) {
		// TODO Auto-generated method stub
		return attachmentHistoryDetailsDao.save(attachHistDetails);
	}

}
