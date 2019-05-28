package com.ap.mis.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.TenderingProcessDao;
import com.ap.mis.entity.Agency;
import com.ap.mis.entity.NoticeIssuingAuthorities;
import com.ap.mis.service.TenderingProcessService;

@Service
@Transactional
public class TenderingProcessServiceImpl implements TenderingProcessService {

	@Autowired
	public TenderingProcessDao tenderingProcessDao;
	@Override
	public List<NoticeIssuingAuthorities> getAuthoritiesList() {
		return tenderingProcessDao.getAuthoritiesList();
	}

	@Override
	public List<Agency> getAgencyList() {
		return tenderingProcessDao.getAgencyList()      ;
	}

}
