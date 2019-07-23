package com.ap.mis.dao;

import com.ap.mis.entity.TenderEvaluation;
import com.ap.mis.entity.Works;

public interface TenderEvaluationDao {
	
	public TenderEvaluation findTenderEvaluationByWork(Works work);
	
	public TenderEvaluation saveTenderEvaluation(TenderEvaluation tenderEvaluation);
	
}
