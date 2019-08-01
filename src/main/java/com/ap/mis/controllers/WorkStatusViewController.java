package com.ap.mis.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ap.mis.serviceImpl.WorkStatusService;

@Controller
@RequestMapping(path = "work/{workId}")
public class WorkStatusViewController {

	@Autowired
	WorkStatusService workStatusService;

	@GetMapping(path = "/phase/{phaseIndex}/status")
	public String getWorkStatusView(@PathVariable(value = "workId") int workId,
			@PathVariable(value = "phaseIndex") int phaseIndex, Model model) {
		workStatusService.loadWorkStatusData(workId, phaseIndex, model);
		return "online-mis-full-work-status";
	}

}
