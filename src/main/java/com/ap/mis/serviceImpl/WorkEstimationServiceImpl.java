package com.ap.mis.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.WorkEstimationsDao;
import com.ap.mis.entity.WorkEstimations;
import com.ap.mis.entity.Works;
import com.ap.mis.service.WorkEstimationService;
import com.ap.mis.util.EnumFilter;
import com.ap.mis.util.EnumWorkStatus;

@Service
@Transactional
public class WorkEstimationServiceImpl implements WorkEstimationService {

	@Autowired
	WorkEstimationsDao workEstimationsDao;

	@Override
	public WorkEstimations getWorkEstimationById(Integer workEstimationId) {
		// TODO Auto-generated method stub
		return workEstimationsDao.getWorkEstimationById(workEstimationId);
	}

	@Override
	public WorkEstimations getWorkEstimationByWork(Works work) {
		// TODO Auto-generated method stub
		return workEstimationsDao.findByWork(work);
	}

	@Override
	public WorkEstimations save(WorkEstimations workEstimations) {
		// TODO Auto-generated method stub
		workEstimations.setStatus(EnumFilter.ACTIVE.getStatus());		
		return workEstimationsDao.saveWorkEstimation(workEstimations);
	}

	@Override
	public void deleteWorkEstimatation(WorkEstimations workEstimations) {
		// TODO Auto-generated method stub

		if (getWorkEstimationById(workEstimations.getId()) != null) {

			workEstimationsDao.deleteWorkEstimation(workEstimations);
		}

	}

}
