package com.ap.mis.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ap.mis.dao.OnlineMisDetailsDao;

@Repository
public class OnlineMisDetailsDaoImpl implements OnlineMisDetailsDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Object[]> getList() {

		@SuppressWarnings("unchecked")
		 List<Object[]> details = sessionFactory.getCurrentSession()
		        .createQuery("SELECT vw.departmentName, COALESCE(sum(wk.noOfWorks), 0) AS no_of_works, "
				                    		+ "COALESCE(sum(wk.cost), 0) AS estimated_cost FROM DepartmentLinkingLine vw "
				                    		+ "JOIN Works wk ON wk.id = vw.work GROUP BY vw.departmentName ORDER BY vw.departmentName")
		        .list(); 
		
		
		
		return details;
	}

}
