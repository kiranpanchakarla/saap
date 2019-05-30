package com.ap.mis.serviceImpl;

import java.io.File;
import java.io.InputStream;
import java.sql.Blob;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ap.mis.dao.MISdao;
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
import com.ap.mis.entity.WorkLineItemsList;
import com.ap.mis.entity.Works;
import com.ap.mis.service.MISService;
import com.ap.mis.util.UploadUtil;

@Service
@Transactional
public class MISServiceImpl implements MISService {
	private static final Logger log = Logger.getLogger(MISServiceImpl.class);
	@Autowired MISdao misDao;
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	UploadUtil uploadUtil;
	
	@Autowired
	private ServletContext servletContext;

	@Override
	public Works saveWorks(Works work) {
	return	misDao.saveWorks(work);
	}

	
	@Override
	public User verifyUser(User user) {
		return misDao.verifyUser(user);
	}

	



	/*@Override
	public int saveConsultantInfo(ConsultantInfo consultantInfo) {
		return misDao.saveConsultantInfo(consultantInfo);
	}*/

/*	@Override
	public int saveTechSanction(TechnicalSanction technicalSanction) {
		return misDao.saveTechSanction(technicalSanction);
	}*/

	

	/*@Override
	public int saveAgreementDetails(AgreementDetails agreementDetails) {
		// TODO Auto-generated method stub
		return misDao.saveAgreementDetails(agreementDetails);
	}*/

	
	
	/*@Override
	public int saveTenderingProcess(TenderingProcess tenderingProcess, MultipartFile engfile,MultipartFile telugufile) {
		 try
		 {
			 
			 String timeStamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				
				if (!engfile.getOriginalFilename().isEmpty()) {
					File rootFolder = new File(uploadUtil.getUploadPath() + File.separator + "uploadfile" + File.separator + timeStamp);
					log.info("==rootFolder=="+rootFolder);
					if (!rootFolder.exists()) {
						rootFolder.mkdirs();
					}
				    String  filepath=rootFolder + File.separator+ engfile.getOriginalFilename();
				    engfile.transferTo(new File(filepath));
					log.info("===filepath==:"+filepath);
					tenderingProcess.setEngUpload(filepath);	
				}
				
				if (!telugufile.getOriginalFilename().isEmpty()) {
					File rootFolder = new File(uploadUtil.getUploadPath() + File.separator + "uploadfile" + File.separator + timeStamp);
					log.info("==rootFolder=="+rootFolder);
					if (!rootFolder.exists()) {
						rootFolder.mkdirs();
					}
				    String  filepath=rootFolder + File.separator+ telugufile.getOriginalFilename();
				    telugufile.transferTo(new File(filepath));
					log.info("===filepath==:"+filepath);
					tenderingProcess.setTelUpload(filepath);	
				}
				
		
		 }
		catch(Exception e){
			e.printStackTrace();
		}
		return misDao.saveTenderingProcess(tenderingProcess);
	}
*/
	/*@Override
	public TenderingProcess getTenderingInfo(int tenderingId) {
		// TODO Auto-generated method stub
		return misDao.getTenderingInfo(tenderingId);
	}*/

	@Override
	public List<TypeOfWork> findAll() {
		
		return misDao.findAll();
	}

	@Override
	public List<NatureOfWork> natureOfDetails() {
		// TODO Auto-generated method stub
		return misDao.natureOfDetails();
	}

	@Override
	public List<Constituency> constituencyDetails(int PlaceId) {
		// TODO Auto-generated method stub
		return misDao.constituencyDetails(PlaceId);
	}

	@Override
	public List<Mandal> mandalDetails(int PlaceId) {
		// TODO Auto-generated method stub
		return misDao.mandalDetails(PlaceId);
	}

	@Override
	public List<Village> villageDetails(int PlaceId) {
		// TODO Auto-generated method stub
		return misDao.villageDetails(PlaceId);
	}



/*	@Override
	public int landDetailsSave(LandDetails landDetails, MultipartFile file) {
		 try
		 {
			String timeStamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			
				if (!file.getOriginalFilename().isEmpty()) {
					File rootFolder = new File(uploadUtil.getUploadPath() + File.separator + "uploadfile" + File.separator + timeStamp);
					log.info("==rootFolder=="+rootFolder);
					if (!rootFolder.exists()) {
						rootFolder.mkdirs();
					}
				    String  filepath=rootFolder + File.separator+ file.getOriginalFilename();
					file.transferTo(new File(filepath));
					log.info("===filepath==:"+filepath);
						  landDetails.setPath(filepath);	
					 
				}
		 }
		catch(Exception e){
			e.printStackTrace();
		}
		 return misDao.landDetailsSave(landDetails);
	}*/
	@Override
	public Works getWorkInfo(int workId) {
		return misDao.getWorkInfo(workId);
		
		
	}
	
	
	/*@Override
	public int adminstrativeSectionSave(AdministrativeSection adminSec) {
		return misDao.adminstrativeSectionSave(adminSec);
	}*/

	/**/
	
	/*	@Override
	public int adminstrativeSection(AdministrativeSection adminSecObject, MultipartFile file) {
		try
		 {
			String timeStamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			String saveDirectory = servletContext.getRealPath("/");
			String uploadfile="";
			 byte[] data = null;
		        Blob encodstring =null;  
				if (!file.getOriginalFilename().isEmpty()) {
					File rootFolder = new File(uploadUtil.getUploadPath() + File.separator + "uploadfile" + File.separator + timeStamp);
					log.info("==rootFolder=="+rootFolder);
					if (!rootFolder.exists()) {
						rootFolder.mkdirs();
					}
				    String  filepath=rootFolder + File.separator+ file.getOriginalFilename();
					file.transferTo(new File(filepath));
					log.info("===filepath==:"+filepath);
					 adminSecObject.setPath(filepath);	
					 if ((!(" ".equals(uploadfile)) || uploadfile == null)) {
                           InputStream stream = (InputStream) file.getInputStream();
			                data = new byte[50000];
			                stream.read(data);
			               System.out.println("file is*********************" + data);
			            } 
					 encodstring = (Blob) Hibernate.getLobCreator((Session) sessionFactory).createBlob(data);
				}
				 adminSecObject.setContent(encodstring);
		 }
		 }
		catch(Exception e){
			e.printStackTrace();
		}
		return misDao.adminstrativeSectionSave(adminSecObject);
	}*/
	
	
	
	/*@Override
	public int departmentLinkingLineSave(DepartmentLinkingLine departmentLink) {
		// TODO Auto-generated method stub
		return misDao.departmentLinkingLineSave(departmentLink);
	}*/
	

}
