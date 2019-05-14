package com.ap.mis.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.DistrictDao;
import com.ap.mis.entity.District;
import com.ap.mis.service.DistrictService;


@Service
@Transactional
public class DistrictServiceImpl implements DistrictService {
	
	@Autowired DistrictDao districtDao;

	@Override
	public List<District> findAll() {
		return districtDao.findAll();
	}

	@Override
	public List<District> findByState(int stateId) {
		return null;
	}

	@Override
	public District findById(int id) {
		return districtDao.findById(id);
	}

}
