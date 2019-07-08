package com.ap.mis.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ap.mis.entity.DepartmentLinkingLine;
import com.ap.mis.entity.Division;
import com.ap.mis.entity.Section;
import com.ap.mis.entity.Subdivision;

@Service
public interface LineDepartmentService {
	
	public List<Division> getDivisionList();
	public List<Subdivision> getSubdivisionList();
	public List<Section> getSectionList();
	public DepartmentLinkingLine departmentLinkingLineSave(DepartmentLinkingLine lineDeptObj);
	public DepartmentLinkingLine getDeptInfo(int id);
	public DepartmentLinkingLine getdepartDetails(int id);
	public DepartmentLinkingLine departmentLinkingLineUpdate(DepartmentLinkingLine lineDeptObj);

}
