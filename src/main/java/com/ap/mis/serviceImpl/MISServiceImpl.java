package com.ap.mis.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.MISdao;
import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.AgreementDetails;
import com.ap.mis.entity.ConsultantInfo;
import com.ap.mis.entity.DepartmentLinkingLine;
import com.ap.mis.entity.LandDetails;
import com.ap.mis.entity.TechnicalSanction;
import com.ap.mis.entity.TenderingProcess;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.model.WorktoLandDetails;
import com.ap.mis.service.MISService;

@Service
@Transactional
public class MISServiceImpl implements MISService {
	
	@Autowired MISdao misDao;

	@Override
	public int saveWorks(Works work) {
	   return	misDao.saveWorks(work);
	}

	@Override
	public int adminstrativeSectionSave(AdministrativeSection adminSec) {
		return misDao.adminstrativeSectionSave(adminSec);
	}

	@Override
	public User verifyUser(User user) {
		return misDao.verifyUser(user);
	}

	@Override
	public int departmentLinkingLineSave(DepartmentLinkingLine departmentLink) {
		// TODO Auto-generated method stub
		return misDao.departmentLinkingLineSave(departmentLink);
	}

	@Override
	public int landDetailsSave(LandDetails departmentLink) {
		// TODO Auto-generated method stub
		return misDao.landDetailsSave(departmentLink);
	}

	@Override
	public int saveConsultantInfo(ConsultantInfo consultantInfo) {
		return misDao.saveConsultantInfo(consultantInfo);
	}

	@Override
	public int saveTechSanction(TechnicalSanction technicalSanction) {
		return misDao.saveTechSanction(technicalSanction);
	}

	@Override
	public Works getWorkInfo(int workId) {
		return misDao.getWorkInfo(workId);
		
		
	}

	@Override
	public int saveAgreementDetails(AgreementDetails agreementDetails) {
		// TODO Auto-generated method stub
		return misDao.saveAgreementDetails(agreementDetails);
	}

	@Override
	public int saveTenderingProcess(TenderingProcess tenderingProcess) {
		// TODO Auto-generated method stub
		return misDao.saveTenderingProcess(tenderingProcess);
	}

	@Override
	public TenderingProcess getTenderingInfo(int tenderingId) {
		// TODO Auto-generated method stub
		return misDao.getTenderingInfo(tenderingId);
	}
	
	

	

}
