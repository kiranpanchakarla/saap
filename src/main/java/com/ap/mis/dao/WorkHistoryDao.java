package com.ap.mis.dao;

import java.util.List;

import com.ap.mis.entity.WorkHistory;
import com.ap.mis.entity.Works;

public interface WorkHistoryDao {

	public WorkHistory saveWorks(WorkHistory workHistory);
	
	public List<WorkHistory> getAllWorkHistoryByWork(Works work);
}
