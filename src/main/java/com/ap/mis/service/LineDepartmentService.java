package com.ap.mis.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ap.mis.entity.Division;
import com.ap.mis.entity.Section;
import com.ap.mis.entity.Subdivision;

@Service
public interface LineDepartmentService {
	
	public List<Division> getDivisionList();
	public List<Subdivision> getSubdivisionList();
	public List<Section> getSectionList();

}
