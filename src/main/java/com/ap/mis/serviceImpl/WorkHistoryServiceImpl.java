package com.ap.mis.serviceImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.WorkHistoryDao;
import com.ap.mis.entity.WorkHistory;
import com.ap.mis.entity.Works;
import com.ap.mis.service.WorkHistroyService;

@Service
@Transactional
public class WorkHistoryServiceImpl implements WorkHistroyService {

	@Autowired
	WorkHistoryDao workHistoryDao;
	

	@Override
	public WorkHistory saveWorks(WorkHistory workHistory) {
		return workHistoryDao.saveWorks(workHistory);
	}

	@Override
	public List<WorkHistory> getWorkHistoryByWork(Works work) {

		List<WorkHistory> workHistoryList = workHistoryDao.getAllWorkHistoryByWork(work);
		
		return workHistoryList;
		/*
				Map<Date, List<WorkHistory>> workHistoryGroupByDate = workHistoryList.stream()
						.collect(Collectors.groupingBy(WorkHistory::onlyDate));
		
				Set<Map.Entry<Date, List<WorkHistory>>> c1 = workHistoryGroupByDate.entrySet().stream().map(m -> {
		
					m.setValue(m.getValue().stream().sorted((dt1, dt2) -> {
		
						if (dt1.onlyDate().after(dt2.onlyDate())) {
							return 1;
						} else if (dt1.onlyDate().before(dt2.onlyDate())) {
							return -1;
						} else {
							return 0;
						}
		
					}).collect(Collectors.toCollection(ArrayList::new)));
					return m;
		
				}).collect(Collectors.toSet());
		
				// order by recent to old
				TreeMap<Date, List<WorkHistory>> recentToOldworkHistory = new TreeMap<>(
						(d1, d2) -> d1.before(d2) ? -1 : (d1.equals(d2) ? 0 : 1));
		
				c1.forEach(t -> {
					recentToOldworkHistory.put(t.getKey(), t.getValue());
				});
		
				return recentToOldworkHistory;
		*/
	}

}
