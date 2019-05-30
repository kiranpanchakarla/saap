package com.ap.mis.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ap.mis.dao.AgreementDetailsDao;
import com.ap.mis.entity.AgreementDetails;
import com.ap.mis.service.AgreementDetailService;

@Service
public class AgreementDetailServiceImpl implements AgreementDetailService{
	@Autowired AgreementDetailsDao agreeDetailsDao;

	@Override
	public AgreementDetails saveAgreementDetails(AgreementDetails agreementDetails) {
		return agreeDetailsDao.saveAgreementDetails(agreementDetails);
	}

}
