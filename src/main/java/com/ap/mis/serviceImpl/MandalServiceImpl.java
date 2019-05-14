package com.ap.mis.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.MandalDao;
import com.ap.mis.entity.Mandal;
import com.ap.mis.service.MandalService;

@Service
@Transactional
public class MandalServiceImpl implements MandalService {
@Autowired MandalDao mandalDao;

	@Override
	public List<Mandal> findAll() {
		return mandalDao.findAll();
	}

	@Override
	public Mandal findById(int id) {
		return mandalDao.findById(id);
	}

}
