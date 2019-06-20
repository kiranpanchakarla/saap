package com.ap.mis.serviceImpl;

import java.util.List;

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
import com.ap.mis.util.UploadUtil;


@Service
@Transactional
public class MISServiceImpl implements MISService {
	private static final Logger log = Logger.getLogger(MISServiceImpl.class);
	@Autowired MISdao misDao;
	
	
	@Autowired
	UploadUtil uploadUtil;
	
	

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
		work.setStatus(EnumFilter.OPEN.getStatus());
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
		work.setStatus(EnumFilter.OPEN.getStatus());
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
	
	
	
	

}
