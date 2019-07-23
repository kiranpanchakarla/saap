package com.ap.mis.service;

import com.ap.mis.entity.TenderEvaluation;
import com.ap.mis.entity.Works;

public interface TenderEvaluationService {

	public TenderEvaluation findTenderEvaluationByWork(Works work);

	public TenderEvaluation saveOrUpdateTenderEvaluation(TenderEvaluation tenderEvaluation);

}
