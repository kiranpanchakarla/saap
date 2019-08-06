package com.ap.mis.service;

import java.util.List;

import com.ap.mis.entity.WorkHistory;
import com.ap.mis.entity.Works;
import com.ap.mis.model.ConsolidatedWorkHistory;

public interface WorkHistroyService {

	public WorkHistory saveWorks(WorkHistory workHistory);

	public List<ConsolidatedWorkHistory> getWorkHistoryByWork(Works work);
}
