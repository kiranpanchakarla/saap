package com.ap.mis.serviceImpl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ap.mis.dao.LandDetailDao;
import com.ap.mis.entity.Division;
import com.ap.mis.entity.Land;
import com.ap.mis.entity.LandDetails;
import com.ap.mis.entity.Section;
import com.ap.mis.entity.Subdivision;
import com.ap.mis.service.LandDetailService;
import com.ap.mis.util.EnumFilter;
import com.ap.mis.util.UploadUtil;

@Service
@Transactional
public class LandDetailServiceImpl implements LandDetailService{
	private static final Logger log = Logger.getLogger(LandDetailServiceImpl.class);
	@Autowired
	public LandDetailDao landDetailDao;
	
    private SessionFactory sessionFactory;
	
	@Autowired
	UploadUtil uploadUtil;
	
	@Override
	public List<Land> getLandTypeList() {
		return landDetailDao.getLandTypeList();
	}

	

	@Override
	public Division findByDivisionId(int id) {
		// TODO Auto-generated method stub
		return landDetailDao.findByDivisionId(id);
	}

	@Override
	public Subdivision findBySubDivision(int id) {
		// TODO Auto-generated method stub
		return landDetailDao.findBySubDivision(id);
	}

	@Override
	public Section findBySectionId(int id) {
		// TODO Auto-generated method stub
		return landDetailDao.findBySectionId(id);
	}



	@Override
	public LandDetails landDetailsSave(LandDetails landDetails) {
				return landDetailDao.landDetailsSave(landDetails);
	}



	@Override
	public LandDetails getLandinfo(int id) {
		 return landDetailDao.getLandinfo(id);
	}



	@Override
	public LandDetails getLandDetails(int id) {
		
		return landDetailDao.getLandDetails(id);
	}



	@Override
	public LandDetails landDetailsUpdate(LandDetails landDetails) {
		landDetails.getWork().setStatus(EnumFilter.CONST_INPROGRESS.getStatus());
		 return landDetailDao.landDetailsUpdate(landDetails);
	}



	
}
