package com.ap.mis.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.VillageDao;
import com.ap.mis.entity.Village;
import com.ap.mis.service.VillageService;

@Service
@Transactional
public class VillageServiceImpl implements VillageService{
	
	@Autowired VillageDao villageDao;

	@Override
	public List<Village> findAll() {
		return villageDao.findAll();
	}

	@Override
	public Village findById(int id) {
		return villageDao.findById(id);
	}

}
