package com.ap.mis.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ap.mis.dao.MISdao;
import com.ap.mis.entity.Constituency;
import com.ap.mis.entity.Mandal;
import com.ap.mis.entity.NatureOfWork;
import com.ap.mis.entity.TypeOfWork;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Village;
import com.ap.mis.entity.Works;

@Repository
public class MISDaoImpl implements MISdao {

	@Autowired
	private SessionFactory sessionFactory;
	
	
    
	@Override
	public Works saveWorks(Works work) {
		try{
		sessionFactory.getCurrentSession().save(work);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return work;
	}
	
	
	

	
	
	/*@Override
	public int saveWorks(Works work) {
		int i = 0;
		try{
			i =(int) sessionFactory.getCurrentSession().save(work);	
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
		return i;
	}*/



	@Override
	public  User verifyUser(User user) {		
		User validUser = null;
		String ss="from User  where name=:un   and CAST(password as binary) = CAST(:pw as binary) ";
		//Query q=sessionFactory.getCurrentSession().createQuery(ss);
		//q.setParameter("un",user.getName());
		//q.setParameter("pw", user.getPassword());
		
		List users = sessionFactory.getCurrentSession()
		        .createQuery( "from User  where name=:un and CAST(password as binary) = CAST(:pw as binary)")
		        .setParameter("un",user.getName())
		        .setParameter("pw", user.getPassword())
		        .list();
		
		if(users.size() != 0){
			 validUser=(User) users.get(0);
		}else
			 validUser = null;
		return validUser;
	}

	

	
	
	/*@Override
	public int saveConsultantInfo(ConsultantInfo consultantInfo) {
		int i = 0;
		// TODO Auto-generated method stub
		try{
			i =(int) sessionFactory.getCurrentSession().save(consultantInfo);	
			System.out.println("i is:"+i);
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
		return i;
	}*/

	/*@Override
	public int saveTechSanction(TechnicalSanction technicalSanction) {
		int i = 0;
		// TODO Auto-generated method stub
		try{
			i =(int) sessionFactory.getCurrentSession().save(technicalSanction);	
			System.out.println("saveTechSanction() --- i is:"+i);
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
		return i;
	}*/

	

	/*@Override
	public int saveAgreementDetails(AgreementDetails agreementDetails) {
		int i = 0;
		// TODO Auto-generated method stub
		try{
			i =(int) sessionFactory.getCurrentSession().save(agreementDetails);	
			System.out.println("saveAgreementDetails() --- i is:"+i);
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
		return i;
	}*/
	
	/*public TenderingProcess getTenderingInfo(int tenderingId){
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
	}*/

	/*@Override
	public int saveTenderingProcess(TenderingProcess tenderingProcess) {
		int i = 0;
		// TODO Auto-generated method stub
		try{
			i =(int) sessionFactory.getCurrentSession().save(tenderingProcess);	
			System.out.println("saveTenderingProcess() --- i is:"+i);
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
		return i;
	}*/

	@Override
	public List<TypeOfWork> findAll() {
		String details="from TypeOfWork";
		Query q=sessionFactory.getCurrentSession().createQuery(details);
		List<TypeOfWork> typeOfWorkDetails=q.list();
		return typeOfWorkDetails;
	}

	@Override
	public List<NatureOfWork> natureOfDetails() {
		String details="from NatureOfWork";
		Query q=sessionFactory.getCurrentSession().createQuery(details);
		List<NatureOfWork> natureOfWorkDetails=q.list();
		return natureOfWorkDetails;
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<Constituency> constituencyDetails(int PlaceId) {
		return sessionFactory.getCurrentSession().createQuery("from Constituency where districtId="+PlaceId).list();
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Mandal> mandalDetails(int placeId) {
		return sessionFactory.getCurrentSession().createQuery("from Mandal where constituencyId="+placeId).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Village> villageDetails(int placeId) {
		return sessionFactory.getCurrentSession().createQuery("from Village where mandalId="+placeId).list();
	}
	
	@Override
	public Works getWorkInfo(int workId) {
		System.out.println("workId -- :"+workId);
		List<Works> workList=new ArrayList<Works>();
		Works workInfo =new Works();
		String hql="from Works where id=:workId";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("workId", workId);
		System.out.println("q.list() :"+query.list());
		if(query.list().size() !=0) {
			workList =  query.list();
		}
		for(Works work :workList) {
			workInfo=work;
		}
		return workInfo;
	}
	
	
	/*@Override
	public int adminstrativeSectionSave(AdministrativeSection adminSec) {
		int i=0;
		  Blob encodstring =null;  
		try{
			
			encodstring = (Blob) Hibernate.getLobCreator((Session) sessionFactory).createBlob(data);
		    i =(int) sessionFactory.getCurrentSession().save(adminSec);	
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return i;
	}*/
	
	/*@Override
	public int departmentLinkingLineSave(DepartmentLinkingLine departmentLink) {
		int i=0;
		try{
		    i =(int) sessionFactory.getCurrentSession().save(departmentLink);	
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return i;
	}
	*/
	
	
	/*@Override
	public int landDetailsSave(LandDetails landDetails) {
		int i=0;
		try{
		    i =(int) sessionFactory.getCurrentSession().save(landDetails);	
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return i;
	}*/
	
	
	}
