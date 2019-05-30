package com.ap.mis.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.TenderingProcessDao;
import com.ap.mis.entity.Agency;
import com.ap.mis.entity.GrantType;
import com.ap.mis.entity.NoticeIssuingAuthorities;
import com.ap.mis.entity.TenderingProcess;

@Repository
@Transactional
public class TenderingProcessDaoImpl implements TenderingProcessDao  {

	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public List<NoticeIssuingAuthorities> getAuthoritiesList() {
		@SuppressWarnings("unchecked")
		List<NoticeIssuingAuthorities> authoritiesTypeList= sessionFactory.getCurrentSession().createQuery("from NoticeIssuingAuthorities").getResultList();
		return authoritiesTypeList;
	}

	@Override
	public List<Agency> getAgencyList() {
		@SuppressWarnings("unchecked")
		List<Agency> agencyList= sessionFactory.getCurrentSession().createQuery("from Agency").getResultList();
		return agencyList;
	}

	@Override
	public TenderingProcess saveTenderingProcess(TenderingProcess tenderingProcess) {
		
		try{
			sessionFactory.getCurrentSession().save(tenderingProcess);	
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
		return tenderingProcess;
	}

	@Override
	public TenderingProcess getTenderingInfo(int tenderingId) {
		List<TenderingProcess> tenderingList=new ArrayList<TenderingProcess>();
		TenderingProcess tenderingInfo = new TenderingProcess();
		String hql="from TenderingProcess where id=:tenderingId";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("tenderingId", tenderingId);
		System.out.println("q.list() :"+query.list());
		if(query.list().size() !=0) {
			tenderingList =  query.list();
		}
		for(TenderingProcess tender :tenderingList) {
			tenderingInfo=tender;
		}
		return tenderingInfo;
	}

}
