package com.ap.mis.serviceImpl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.MISdao;
import com.ap.mis.entity.Constituency;
import com.ap.mis.entity.Mandal;
import com.ap.mis.entity.NatureOfWork;
import com.ap.mis.entity.TypeOfWork;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Village;
import com.ap.mis.entity.WorkLineItemsList;
import com.ap.mis.entity.Works;
import com.ap.mis.service.MISService;
import com.ap.mis.util.EnumFilter;
import com.ap.mis.util.EnumWorkStatus;
import com.ap.mis.util.SendEmail;
import com.ap.mis.util.UploadUtil;

@Service
@Transactional
public class MISServiceImpl implements MISService {
	private static final Logger log = Logger.getLogger(MISServiceImpl.class);
	@Autowired MISdao misDao;
	
	
	@Autowired
	UploadUtil uploadUtil;
	
		
	@Autowired
	SendEmail sendEmail;
	
	Set<String> hset=new HashSet<>();
	
	
	public MISServiceImpl() {
		initializeWorkStatus();
	}
	
	private void initializeWorkStatus() {
		hset.add(EnumWorkStatus.LAND.getStatus());
		hset.add(EnumWorkStatus.PENDING_SAAP_APPROVAL.getStatus());
		hset.add(EnumWorkStatus.SAAP_APPROVED.getStatus());
		hset.add(EnumWorkStatus.WORK_ESTIMATION_COMPLETED.getStatus());
		hset.add(EnumWorkStatus.TECHNICAL_SANCTION_COMPLETED.getStatus());
	}

	@Override
	public Works saveWorks(Works work) {
		List<WorkLineItemsList> ltms=work.getWorkLineItemsList();
		if (ltms != null) {
			for (int i = 0; i < ltms.size(); i++) {
				if (ltms.get(i).getWorkDetails() == null) {
					ltms.remove(i);
					i--;
				}
			}
			work.setWorkLineItemsList(ltms);
		}
		
		return	misDao.saveWorks(work);
	}
	
	@Override
	public User verifyUser(User user) {
		return misDao.verifyUser(user);
	}

	
	@Override
	public List<TypeOfWork> findAll() {
		
		return misDao.findAll();
	}

	@Override
	public List<NatureOfWork> natureOfDetails() {
		// TODO Auto-generated method stub
		return misDao.natureOfDetails();
	}

	@Override
	public List<Constituency> constituencyDetails(int PlaceId) {
		// TODO Auto-generated method stub
		return misDao.constituencyDetails(PlaceId);
	}

	@Override
	public List<Mandal> mandalDetails(int PlaceId) {
		// TODO Auto-generated method stub
		return misDao.mandalDetails(PlaceId);
	}

	@Override
	public List<Village> villageDetails(int PlaceId) {
		// TODO Auto-generated method stub
		return misDao.villageDetails(PlaceId);
	}




	@Override
	public Works getWorkInfo(int workId) {
		return misDao.getWorkInfo(workId);
		
		
	}

	@Override
	public Works updateWork(Works work) {
		List<WorkLineItemsList> ltms=work.getWorkLineItemsList();
		if (ltms != null) {
			for (int i = 0; i < ltms.size(); i++) {
				if (ltms.get(i).getWorkDetails() == null) {
					ltms.remove(i);
					i--;
				}
			}
			work.setWorkLineItemsList(ltms);
		}
//		work.setStatus(EnumFilter.OPEN.getStatus());
		
		if(hset.contains(work.getWorkStatus())) {
		try {
			sendEmail.sendApproveEmail(work);
		}catch(Exception ex) {
			ex.printStackTrace();
			log.error("Mail Sent failed", ex);
		}
		}
		return misDao.updateWork(work);
	}

	@Override
	public Works deleteWork(Works work) {
		work.setIsActive(false);
		return misDao.deleteWork(work);
	}

	@Override
	public List<WorkLineItemsList> lineItemDetails(int workId) {
		
		return misDao.lineItemDetails(workId);
	}

	@Override
	public Works findByWorkNumber(String workNo) {
		
        Works work = misDao.findByWorkNumber(workNo);
		return  work;
	}

	

}
