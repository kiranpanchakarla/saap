package com.ap.mis.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.LandSurveyDetailsDao;
import com.ap.mis.entity.LandDetails;
import com.ap.mis.entity.LandSurveyDetails;
import com.ap.mis.entity.Works;
import com.ap.mis.service.LandSurveyDetailService;

@Service
@Transactional
public class LandSurveyDetailServiceImpl implements LandSurveyDetailService {

	@Autowired
	LandSurveyDetailsDao landSurveyDetailsDao;

	@Override
	public LandSurveyDetails findById(int landSurveyId) {
		// TODO Auto-generated method stub
		return landSurveyDetailsDao.findById(landSurveyId);
	}

	@Override
	public LandSurveyDetails save(LandSurveyDetails landSurveyDetails) {
		// TODO Auto-generated method stub

		return landSurveyDetailsDao.save(landSurveyDetails);
	}

	@Override
	public LandSurveyDetails findByLandDetails(LandDetails landDetails) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public LandSurveyDetails findByWork(Works work) {
		// TODO Auto-generated method stub
		return landSurveyDetailsDao.findByWork(work);
	}

}
