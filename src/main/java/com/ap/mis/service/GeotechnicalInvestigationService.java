package com.ap.mis.service;

import com.ap.mis.entity.GeotechnicalInvestigation;
import com.ap.mis.entity.Works;

public interface GeotechnicalInvestigationService {
	public GeotechnicalInvestigation findByWork(Works work);

	public GeotechnicalInvestigation findById(int id);
	
	public GeotechnicalInvestigation save(GeotechnicalInvestigation geotechnicalInvestigation);
}
