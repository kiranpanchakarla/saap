package com.ap.mis.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.LetterOfAcceptanceDao;
import com.ap.mis.entity.LetterOfAcceptance;
import com.ap.mis.entity.Works;
import com.ap.mis.service.LetterOfAcceptanceService;
@Service
@Transactional
public class LetterOfAcceptanceServiceImpl implements LetterOfAcceptanceService{
    @Autowired
    LetterOfAcceptanceDao letterOfAcceptanceDao;
	
	
	@Override
	public LetterOfAcceptance save(LetterOfAcceptance letterOfAcceptance) {
		// TODO Auto-generated method stub
		return letterOfAcceptanceDao.save(letterOfAcceptance);
	}


	@Override
	public LetterOfAcceptance findByWork(Works work) {
		
		return letterOfAcceptanceDao.findByWork(work);
	}

}
