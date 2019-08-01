package com.ap.mis.model;

import java.util.ArrayList;
import java.util.List;

import com.ap.mis.util.PhaseCompletionType;

public class WorkPhase {

	private int index;
	private String name;
	private PhaseCompletionType completionType;
	private String url;
	private List<WorkPhase> subWorkPhase;
	private boolean activePhase = false;

	public WorkPhase(int index, String name, PhaseCompletionType completionType, String url) {
		this.index = index;
		this.name = name;
		this.completionType = completionType;
		this.url = url;
		this.subWorkPhase = new ArrayList<>();
		activePhase = false;
	}

	public void addSubPhase(WorkPhase workPhase) {
		this.subWorkPhase.add(workPhase);
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public PhaseCompletionType getCompletionType() {
		return completionType;
	}

	public void setCompletionType(PhaseCompletionType completionType) {
		this.completionType = completionType;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public List<WorkPhase> getSubWorkPhase() {
		return subWorkPhase;
	}

	public boolean isActivePhase() {
		return activePhase;
	}

	public void setActivePhase(boolean isActivePhase) {
		this.activePhase = isActivePhase;
	}
	
	

}
