package com.ap.mis.dao;

import java.util.List;

import com.ap.mis.entity.WorkEstimations;
import com.ap.mis.entity.Works;

public interface WorkEstimationsDao {

	WorkEstimations getWorkEstimationById(int id);

	List<WorkEstimations> findAll();

	WorkEstimations findByWork(Works work);

	List<WorkEstimations> findAllWhereStausIsActive();
	
	WorkEstimations saveWorkEstimation(WorkEstimations workEstimations);
	
	void deleteWorkEstimation(WorkEstimations workEstimations);
}
