package com.ap.mis.dao;

import com.ap.mis.entity.GeotechnicalInvestigation;
import com.ap.mis.entity.Works;

public interface GeotechnicalInvestigationDao {
	public GeotechnicalInvestigation findByWork(Works work);

	public GeotechnicalInvestigation findById(int id);
	
	public GeotechnicalInvestigation save(GeotechnicalInvestigation geotechnicalInvestigation);
}
