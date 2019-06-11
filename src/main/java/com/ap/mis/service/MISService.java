package com.ap.mis.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.AgreementDetails;
import com.ap.mis.entity.Constituency;
import com.ap.mis.entity.ConsultantInfo;
import com.ap.mis.entity.DepartmentLinkingLine;
import com.ap.mis.entity.LandDetails;
import com.ap.mis.entity.Mandal;
import com.ap.mis.entity.NatureOfWork;
import com.ap.mis.entity.TechnicalSanction;
import com.ap.mis.entity.TenderingProcess;
import com.ap.mis.entity.TypeOfWork;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Village;
import com.ap.mis.entity.Works;

public interface MISService {
	public Works saveWorks(Works work);
	
	
	public User verifyUser(User user);
	/*public int saveConsultantInfo(ConsultantInfo consultantInfo);*/
	/*public int saveTechSanction(TechnicalSanction technicalSanction);*/
	/*public int saveAgreementDetails(AgreementDetails agreementDetails);*/
	/*public int saveTenderingProcess(TenderingProcess tenderingProcessObj, MultipartFile engfile,MultipartFile telugufile);*/
	/*public TenderingProcess getTenderingInfo(int tenderingId);*/
	public List<TypeOfWork> findAll();
	public List<NatureOfWork> natureOfDetails();
	public Works getWorkInfo(int workId);
	List<Constituency> constituencyDetails(int PlaceId);
	public List<Mandal> mandalDetails(int PlaceId);
	public List<Village> villageDetails(int PlaceId);

	public Works updateWork(Works work);


	public Works deleteWork(Works workInfo);

	/*public TenderingProcess getTenderingInfo(int tenderingId);*/
	
	
	/*==========admin=========*/
	/*public int adminstrativeSectionSave(AdministrativeSection adminSec);*/
	/**/
	/*public int adminstrativeSection(AdministrativeSection adminSecObject, MultipartFile file);*/
	
	/*public int departmentLinkingLineSave(DepartmentLinkingLine departmentLink);*/
	
	/*public int landDetailsSave(LandDetails landDetails, MultipartFile file);*/
}
