package com.ap.mis.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.LineDepartmentDao;
import com.ap.mis.entity.DepartmentLinkingLine;
import com.ap.mis.entity.Division;
import com.ap.mis.entity.Section;
import com.ap.mis.entity.Subdivision;
import com.ap.mis.service.LineDepartmentService;

@Service
@Transactional
public class LineDepartmentServiceImpl implements LineDepartmentService {

	@Autowired LineDepartmentDao lineDepartmentDao;
	@Override
	public List<Division> getDivisionList() {
		return lineDepartmentDao.getDivisionList();
	}

	@Override
	public List<Subdivision> getSubdivisionList() {
		return lineDepartmentDao.getSubdivisionList();
	}

	@Override
	public List<Section> getSectionList() {
		return lineDepartmentDao.getSectionList();
	}

	@Override
	public DepartmentLinkingLine departmentLinkingLineSave(DepartmentLinkingLine departmentLink) {
		return lineDepartmentDao.departmentLinkingLineSave(departmentLink);
	}

	@Override
	public DepartmentLinkingLine getDeptInfo(int id) {
		return lineDepartmentDao.getDeptInfo(id);
	}

	@Override
	public DepartmentLinkingLine getdepartDetails(int id) {
		
		return lineDepartmentDao.getdepartDetails(id);
	}

	@Override
	public DepartmentLinkingLine departmentLinkingLineUpdate(DepartmentLinkingLine lineDept) {
		
		return lineDepartmentDao.departmentLinkingLineUpdate(lineDept);
	}

}
