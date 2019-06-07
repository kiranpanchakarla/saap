package com.ap.mis.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.LineDepartmentDao;
import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.DepartmentLinkingLine;
import com.ap.mis.entity.Division;
import com.ap.mis.entity.Section;
import com.ap.mis.entity.Subdivision;

@Repository
@Transactional
public class LineDepartmentDaoImpl implements LineDepartmentDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Division> getDivisionList() {
		@SuppressWarnings("unchecked")
		List<Division> divisionList= sessionFactory.getCurrentSession().createQuery("from Division").getResultList();
		return divisionList;
	}

	@Override
	public List<Subdivision> getSubdivisionList() {
		@SuppressWarnings("unchecked")
		List<Subdivision> subdivisionList= sessionFactory.getCurrentSession().createQuery("from Subdivision").getResultList();
		return subdivisionList;
	}

	@Override
	public List<Section> getSectionList() {
		@SuppressWarnings("unchecked")
		List<Section> sectionList= sessionFactory.getCurrentSession().createQuery("from Section").getResultList();
		return sectionList;
	}

	
	
	@Override
	public DepartmentLinkingLine departmentLinkingLineSave(DepartmentLinkingLine departmentLink) {
		
		try{
			sessionFactory.getCurrentSession().save(departmentLink);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return departmentLink;
	}

	@Override
	public DepartmentLinkingLine getDeptInfo(int id) {
		return (DepartmentLinkingLine)sessionFactory.getCurrentSession().get(DepartmentLinkingLine.class, id);
	}

	@Override
	public DepartmentLinkingLine getdepartDetails(int id) {
		DepartmentLinkingLine departInfo=null;
		departInfo=(DepartmentLinkingLine) sessionFactory.getCurrentSession().createQuery("from DepartmentLinkingLine where work.id="+id).getSingleResult();
		return departInfo;
	}
	

}
