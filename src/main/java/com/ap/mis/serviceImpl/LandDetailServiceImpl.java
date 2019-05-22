package com.ap.mis.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.LandDetailDao;
import com.ap.mis.entity.Land;
import com.ap.mis.service.LandDetailService;

@Service
@Transactional
public class LandDetailServiceImpl implements LandDetailService{

	@Autowired
	public LandDetailDao landDetailDao;
	
	@Override
	public List<Land> getLandTypeList() {
		return landDetailDao.getLandTypeList();
	}

}
