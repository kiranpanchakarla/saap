package com.ap.mis.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.WorkHistoryDao;
import com.ap.mis.entity.WorkHistory;
import com.ap.mis.service.WorkHistroyService;

@Service
@Transactional
public class WorkHistoryServiceImpl implements WorkHistroyService {

	@Autowired
	WorkHistoryDao workHistoryDao;
	
	@Override
	public WorkHistory saveWorks(WorkHistory workHistory) {
		return workHistoryDao.saveWorks(workHistory);
	}

}
