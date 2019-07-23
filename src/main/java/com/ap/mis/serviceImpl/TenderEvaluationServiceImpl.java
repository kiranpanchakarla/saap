package com.ap.mis.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.TenderEvaluationDao;
import com.ap.mis.entity.TenderEvaluation;
import com.ap.mis.entity.Works;
import com.ap.mis.service.TenderEvaluationService;

@Service
@Transactional
public class TenderEvaluationServiceImpl implements TenderEvaluationService {

	@Autowired
	TenderEvaluationDao tenderEvaluationDao;

	@Override
	public TenderEvaluation findTenderEvaluationByWork(Works work) {
		// TODO Auto-generated method stub
		return tenderEvaluationDao.findTenderEvaluationByWork(work);
	}

	@Override
	public TenderEvaluation saveOrUpdateTenderEvaluation(TenderEvaluation tenderEvaluation) {
		// TODO Auto-generated method stub
		return tenderEvaluationDao.saveTenderEvaluation(tenderEvaluation);
	}

}
