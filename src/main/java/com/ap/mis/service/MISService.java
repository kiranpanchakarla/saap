package com.ap.mis.service;

import java.util.List;

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

public interface MISService {
	public int saveWorks(Works work);
	public int adminstrativeSectionSave(AdministrativeSection adminSec);
	public int departmentLinkingLineSave(DepartmentLinkingLine departmentLink);
	public int landDetailsSave(LandDetails departmentLink);
	public User verifyUser(User user);
	public int saveConsultantInfo(ConsultantInfo consultantInfo);
	public int saveTechSanction(TechnicalSanction technicalSanction);
	public int saveAgreementDetails(AgreementDetails agreementDetails);
	public int saveTenderingProcess(TenderingProcess tenderingProcess);
	public Works getWorkInfo(int workId);
	public TenderingProcess getTenderingInfo(int tenderingId);
}
