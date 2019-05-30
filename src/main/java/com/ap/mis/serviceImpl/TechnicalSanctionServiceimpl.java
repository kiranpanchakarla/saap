package com.ap.mis.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ap.mis.dao.TechnicalSanctionDao;
import com.ap.mis.entity.TechnicalSanction;
import com.ap.mis.service.TechnicalSanctionService;

@Service
public class TechnicalSanctionServiceimpl implements TechnicalSanctionService{

	@Autowired TechnicalSanctionDao techsancDao;
	
	@Override
	public TechnicalSanction saveTechSanction(TechnicalSanction techsanc) {
		return techsancDao.saveTechSanction(techsanc);
	}

}
