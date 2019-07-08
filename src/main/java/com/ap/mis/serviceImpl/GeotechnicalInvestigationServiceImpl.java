package com.ap.mis.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.GeotechnicalInvestigationDao;
import com.ap.mis.entity.GeotechnicalInvestigation;
import com.ap.mis.entity.Works;
import com.ap.mis.service.GeotechnicalInvestigationService;

@Service
@Transactional
public class GeotechnicalInvestigationServiceImpl implements GeotechnicalInvestigationService {

	@Autowired
	GeotechnicalInvestigationDao geotechnicalInvestigationDao;

	@Override
	public GeotechnicalInvestigation findByWork(Works work) {
		// TODO Auto-generated method stub
		return geotechnicalInvestigationDao.findByWork(work);
	}

	@Override
	public GeotechnicalInvestigation findById(int id) {
		// TODO Auto-generated method stub
		return geotechnicalInvestigationDao.findById(id);
	}

	@Override
	public GeotechnicalInvestigation save(GeotechnicalInvestigation geotechnicalInvestigation) {
		// TODO Auto-generated method stub
		return geotechnicalInvestigationDao.save(geotechnicalInvestigation);
	}

}
