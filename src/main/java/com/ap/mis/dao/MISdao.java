package com.ap.mis.dao;

import java.util.List;

import com.ap.mis.entity.Constituency;
import com.ap.mis.entity.Mandal;
import com.ap.mis.entity.NatureOfWork;
import com.ap.mis.entity.TypeOfWork;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Village;
import com.ap.mis.entity.WorkLineItemsList;
import com.ap.mis.entity.Works;

public interface MISdao {
	public Works saveWorks(Works work);
	
	public  User verifyUser(User user);

	
	/*public int saveConsultantInfo(ConsultantInfo consultantInfo);*/
/*	public int saveTechSanction(TechnicalSanction technicalSanction);*/
	/*public int saveAgreementDetails(AgreementDetails agreementDetails);*/
/*	public int saveTenderingProcess(TenderingProcess tenderingProcess);*/
	public Works getWorkInfo(int workId);
/*	public TenderingProcess getTenderingInfo(int tenderingId);*/
	public List<TypeOfWork> findAll();
	public List<NatureOfWork> natureOfDetails();
	public List<Constituency> constituencyDetails(int placeId);
	public List<Mandal> mandalDetails(int placeId);
	public List<Village> villageDetails(int placeId);
	
	public Works updateWork(Works work);

	public Works deleteWork(Works work);

	public List<WorkLineItemsList> lineItemDetails(int workId);

	
	
	
	/*public int landDetailsSave(LandDetails landDetails);*/
	/*public int adminstrativeSectionSave(AdministrativeSection adminSec);*/
	/**/
	
	
	/*public int departmentLinkingLineSave(DepartmentLinkingLine departmentLink);*/
}
