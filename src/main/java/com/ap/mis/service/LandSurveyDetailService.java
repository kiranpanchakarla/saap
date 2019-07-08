package com.ap.mis.service;

import com.ap.mis.entity.LandDetails;
import com.ap.mis.entity.LandSurveyDetails;
import com.ap.mis.entity.Works;

public interface LandSurveyDetailService {

	public LandSurveyDetails findById(int landSurveyId);

	public LandSurveyDetails save(LandSurveyDetails landSurveyDetails);

	public LandSurveyDetails findByLandDetails(LandDetails landDetails);

	public LandSurveyDetails findByWork(Works work);

}
