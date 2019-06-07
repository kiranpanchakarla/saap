package com.ap.mis.dao;

import java.util.List;

import com.ap.mis.entity.DepartmentLinkingLine;
import com.ap.mis.entity.Division;
import com.ap.mis.entity.Section;
import com.ap.mis.entity.Subdivision;

public interface LineDepartmentDao {
	
	public List<Division> getDivisionList();
	public List<Subdivision> getSubdivisionList();
	public List<Section> getSectionList();
	public DepartmentLinkingLine departmentLinkingLineSave(DepartmentLinkingLine departmentLink);
	public DepartmentLinkingLine getDeptInfo(int id);
	public DepartmentLinkingLine getdepartDetails(int id);


}
