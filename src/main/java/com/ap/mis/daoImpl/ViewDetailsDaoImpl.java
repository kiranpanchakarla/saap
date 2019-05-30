package com.ap.mis.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ap.mis.dao.ViewDetailsDao;
import com.ap.mis.model.ViewDetails;

@Repository
public class ViewDetailsDaoImpl implements  ViewDetailsDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> getViewDetials() {
	List<Object[]> details=sessionFactory.getCurrentSession().createQuery("select a.typeof_work,a.natureof_work,a.work_details,a.work_number,b.department_name,d.survey_number,e.consultant_firm,g.agency_name from Works a,administrative_section b,department_linking_line c,land_details d,consultant_info e,technicalsanction f,tendering_process g where a.id=b.work_id and a.id=c.work_id and a.id=d.work_id and a.id=e.work_id and a.id=f.work_id and a.id=g.work_id").list();
		return details;
	}


}
