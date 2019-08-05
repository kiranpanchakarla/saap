package com.ap.mis.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ap.mis.entity.WorkHistory;
import com.ap.mis.entity.Works;

public interface WorkHistroyService {

	public WorkHistory saveWorks(WorkHistory workHistory);

	public Map<Date, List<WorkHistory>> getWorkHistoryByWork(Works work);
}
