package com.ap.mis.serviceImpl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ap.mis.controllers.UploadController;
import com.ap.mis.dao.AttachmentHistoryDetailsDao;
import com.ap.mis.entity.Attachements;
import com.ap.mis.entity.AttachmentHistoryDetails;
import com.ap.mis.entity.Works;
import com.ap.mis.service.AttachmentHistoryDetailsService;
import com.ap.mis.util.EnumFilter;

@Service
public class AttachmentHistoryDetailsServiceImpl implements AttachmentHistoryDetailsService {
	private static final Logger log = Logger.getLogger(AttachmentHistoryDetailsServiceImpl.class);

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

	@Override
	public List<AttachmentHistoryDetails> findHistoryListByWork(Works work) {
		// TODO Auto-generated method stub
		return attachmentHistoryDetailsDao.findHistoryListByWorkId(work.getId());
	}

}
