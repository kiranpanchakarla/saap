package com.ap.mis.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.ConstituencyDao;
import com.ap.mis.dao.DistrictDao;
import com.ap.mis.entity.Constituency;
import com.ap.mis.service.ConstituencyService;

@Service
@Transactional
public class ConstituencyServiceImpl implements ConstituencyService {
	@Autowired ConstituencyDao constituencyDao;

	@Override
	public List<Constituency> findAll() {
		return constituencyDao.findAll();
	}

	@Override
	public Constituency findById(int id) {
		return constituencyDao.findById(id);
	}

}
