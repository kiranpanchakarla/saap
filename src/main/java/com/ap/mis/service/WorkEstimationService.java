package com.ap.mis.service;

import com.ap.mis.entity.WorkEstimations;
import com.ap.mis.entity.Works;

public interface WorkEstimationService {

	WorkEstimations getWorkEstimationById(Integer workEstimationId);

	WorkEstimations getWorkEstimationByWork(Works work);

	WorkEstimations save(WorkEstimations workEstimations);

	void deleteWorkEstimatation(WorkEstimations workEstimations);
}
