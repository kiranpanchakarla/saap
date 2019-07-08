package com.ap.mis.dao;

import java.util.List;

import com.ap.mis.entity.LandSurveyDetails;
import com.ap.mis.entity.Works;

public interface LandSurveyDetailsDao {

	public List<LandSurveyDetails> findAll();

	public LandSurveyDetails findById(int landSurveyId);

	public LandSurveyDetails findByWork(Works work);
	
	public LandSurveyDetails save(LandSurveyDetails landSurveyDetails);

}
