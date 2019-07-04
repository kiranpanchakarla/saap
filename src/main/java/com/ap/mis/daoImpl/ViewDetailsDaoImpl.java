package com.ap.mis.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ap.mis.dao.ViewDetailsDao;
import com.ap.mis.entity.User;
import com.ap.mis.model.ViewDetails;
import com.ap.mis.util.EnumFilter;
import com.ap.mis.util.EnumMap;
import com.ap.mis.util.SecurityUtil;

@Repository
public class ViewDetailsDaoImpl implements  ViewDetailsDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> getViewDetials() {
		User loggedInUser = SecurityUtil.getLoggedUser();
		String status = EnumMap.DB_COLUMN.get(EnumMap.UI_COLUMN.get(loggedInUser.getRole().getRoleName()));
		
		
	 
	List<Object[]> details=sessionFactory.getCurrentSession().
			createQuery("select distinct(a.id),d.name,e.name,a.workDetails,a.workNo,f.departmentName,g.surveyNo,h.consultant_firm,j.name,a.id,a.workStatus from Works a\r\n" + 
			"left join AdministrativeSection b on a.id = b.work\r\n" + 
			"left join TypeOfWork d on a.typeOfWork = d.id\r\n" + 
			"left join NatureOfWork e on a.natureOfWork=e.id\r\n" + 
			"left join DepartmentLinkingLine f on a.id=f.work\r\n" + 
			"left join LandDetails g on a.id=g.work\r\n" + 
			"left join ConsultantInfo h on a.id=h.work\r\n" + 
			"left join TenderingProcess i on a.id=i.work\r\n" + 
			"left join Agency j on  i.angencyName=j.id where a.isActive='true' and a.workStatus in (" + status + ") order by a.id desc")
			.list();
    
	
		return details;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> getApprovalDetials() {
		String status = EnumFilter.APPROVAL.getStatus();
		
	List<Object[]> details=sessionFactory.getCurrentSession().
			createQuery("select distinct(a.id),d.name,e.name,a.workDetails,a.workNo,f.departmentName,g.surveyNo,h.consultant_firm,j.name,a.id,a.workStatus from Works a\r\n" + 
			"left join AdministrativeSection b on a.id = b.work\r\n" + 
			"left join TypeOfWork d on a.typeOfWork = d.id\r\n" + 
			"left join NatureOfWork e on a.natureOfWork=e.id\r\n" + 
			"left join DepartmentLinkingLine f on a.id=f.work\r\n" + 
			"left join LandDetails g on a.id=g.work\r\n" + 
			"left join ConsultantInfo h on a.id=h.work\r\n" + 
			"left join TenderingProcess i on a.id=i.work\r\n" + 
			"left join Agency j on  i.angencyName=j.id where a.isActive='true' and a.workStatus in ('" + status + "') order by a.id desc")
			.list();
    
	
		return details;
	}


}
