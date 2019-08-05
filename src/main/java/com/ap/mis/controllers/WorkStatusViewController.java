package com.ap.mis.controllers;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ap.mis.entity.WorkHistory;
import com.ap.mis.entity.Works;
import com.ap.mis.service.WorkHistroyService;
import com.ap.mis.serviceImpl.WorkStatusService;

@Controller
@RequestMapping(path = "work/{workId}")
public class WorkStatusViewController {

	@Autowired
	WorkStatusService workStatusService;

	@Autowired
	WorkHistroyService workHistoryService;

	@GetMapping(path = "/phase/{phaseIndex}/status")
	public String getWorkStatusView(@PathVariable(value = "workId") int workId,
			@PathVariable(value = "phaseIndex") int phaseIndex, Model model) {
		workStatusService.loadWorkStatusData(workId, phaseIndex, model);
		return "online-mis-full-work-status";
	}

	@GetMapping(path = "/history")
	public String getWorkHistory(@PathVariable(value = "workId") int workId, Model model) {
		Works work = new Works();
		work.setId(workId);
		Map<Date, List<WorkHistory>> workHistory = workHistoryService.getWorkHistoryByWork(work);
		model.addAttribute("workHistoryRecentToOld", workHistory);
		return "online-mis-full-work-history";
	}

}
