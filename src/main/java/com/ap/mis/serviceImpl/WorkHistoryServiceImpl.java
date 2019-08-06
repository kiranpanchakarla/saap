package com.ap.mis.serviceImpl;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.stream.Collectors;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.WorkHistoryDao;
import com.ap.mis.entity.AttachmentHistoryDetails;
import com.ap.mis.entity.WorkHistory;
import com.ap.mis.entity.Works;
import com.ap.mis.model.ConsolidatedWorkHistory;
import com.ap.mis.service.AttachmentHistoryDetailsService;
import com.ap.mis.service.WorkHistroyService;

@Service
@Transactional
public class WorkHistoryServiceImpl implements WorkHistroyService {

	@Autowired
	WorkHistoryDao workHistoryDao;

	@Autowired
	AttachmentHistoryDetailsService attachmentDetailsService;

	@Override
	public WorkHistory saveWorks(WorkHistory workHistory) {
		return workHistoryDao.saveWorks(workHistory);
	}

	@Override
	public List<ConsolidatedWorkHistory> getWorkHistoryByWork(Works work) {

		List<WorkHistory> workHistoryList = workHistoryDao.getAllWorkHistoryByWork(work);

		List<AttachmentHistoryDetails> attachemtnHistoryList = attachmentDetailsService.findHistoryListByWork(work);

		List<ConsolidatedWorkHistory> consolidatedWorkHistoyList = new ArrayList<>(
				workHistoryList.size() + attachemtnHistoryList.size());

		workHistoryList.stream().forEach(workHistory -> {
			String actionCarried = workHistory.getSubModule() + " "
					+ (workHistory.getActionPerform().toLowerCase().equals("insert") ? " created " : " updated ")
					+ "by " + workHistory.getUser().getName();
			ConsolidatedWorkHistory consolidatedWorkHistory = new ConsolidatedWorkHistory(actionCarried,
					workHistory.getCreatedDate());
			consolidatedWorkHistoyList.add(consolidatedWorkHistory);
		});

		attachemtnHistoryList.stream().forEach(attachemtnHistory -> {

			String actionCarried = attachemtnHistory.getAttach().getModule() + " attachment "
					+ attachemtnHistory.getAttach().getPath().substring(
							attachemtnHistory.getAttach().getPath().replaceAll("\\\\", "@").lastIndexOf("@") + 1)
					+ " " + attachemtnHistory.getLog() + " by " + attachemtnHistory.getCreatedBy();
			ConsolidatedWorkHistory consolidatedWorkHistory = new ConsolidatedWorkHistory(actionCarried,
					attachemtnHistory.getCreatedDate());
			consolidatedWorkHistoyList.add(consolidatedWorkHistory);
		});

		Map<Date, List<ConsolidatedWorkHistory>> consolidatedWorkHistoyGroupByDate = consolidatedWorkHistoyList.stream()
				.collect(Collectors.groupingBy(ConsolidatedWorkHistory::onlyDate));

		Set<Map.Entry<Date, List<ConsolidatedWorkHistory>>> c1 = consolidatedWorkHistoyGroupByDate.entrySet().stream()
				.map(m -> {

					List<ConsolidatedWorkHistory> recentToOld = m.getValue().stream().sorted((dt1, dt2) -> {

						if (dt1.getDate().after(dt2.getDate())) {
							return -1;
						} else if (dt1.getDate().before(dt2.getDate())) {
							return 1;
						} else {
							return 0;
						}

					}).collect(Collectors.toCollection(ArrayList::new));

					m.setValue(recentToOld);
					return m;

				}).collect(Collectors.toSet());
		// order by recent to old
		TreeMap<Date, List<ConsolidatedWorkHistory>> recentToOldworkHistoryMap = new TreeMap<>(
				(d1, d2) -> d1.before(d2) ? 1 : (d1.equals(d2) ? 0 : -1));

		c1.forEach(t -> {
			recentToOldworkHistoryMap.put(t.getKey(), t.getValue());
		});

		consolidatedWorkHistoyList.clear();

		recentToOldworkHistoryMap.forEach((k, v) -> {
			consolidatedWorkHistoyList.addAll(v);
		});

		return consolidatedWorkHistoyList;
		/*
		 * Map<Date, List<WorkHistory>> workHistoryGroupByDate =
		 * workHistoryList.stream()
		 * .collect(Collectors.groupingBy(WorkHistory::onlyDate));
		 * 
		 * Set<Map.Entry<Date, List<WorkHistory>>> c1 =
		 * workHistoryGroupByDate.entrySet().stream().map(m -> {
		 * 
		 * m.setValue(m.getValue().stream().sorted((dt1, dt2) -> {
		 * 
		 * if (dt1.onlyDate().after(dt2.onlyDate())) { return 1; } else if
		 * (dt1.onlyDate().before(dt2.onlyDate())) { return -1; } else { return 0; }
		 * 
		 * }).collect(Collectors.toCollection(ArrayList::new))); return m;
		 * 
		 * }).collect(Collectors.toSet());
		 * 
		 * // order by recent to old TreeMap<Date, List<WorkHistory>>
		 * recentToOldworkHistory = new TreeMap<>( (d1, d2) -> d1.before(d2) ? -1 :
		 * (d1.equals(d2) ? 0 : 1));
		 * 
		 * c1.forEach(t -> { recentToOldworkHistory.put(t.getKey(), t.getValue()); });
		 * 
		 * return recentToOldworkHistory;
		 */
	}

}
