package com.ap.mis.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.ConsultantInfoDao;
import com.ap.mis.entity.ConsultantInfo;
import com.ap.mis.service.ConsultantInfoService;

@Service
@Transactional
public class ConsultantInfoServiceImpl implements ConsultantInfoService {
  
	@Autowired ConsultantInfoDao constInfDao;
	
	@Override
	public ConsultantInfo saveConsultantInfo(ConsultantInfo consultantInfoObject) {
		
		return constInfDao.saveConsultantInfo(consultantInfoObject);
	}

	@Override
	public ConsultantInfo getConsultDetails(int id) {
		
		return constInfDao.getConsultDetails(id);
	}

	@Override
	public ConsultantInfo updateConsultantInfo(ConsultantInfo consultantInfoObject) {
		return constInfDao.updateConsultantInfo(consultantInfoObject);
	}

}
