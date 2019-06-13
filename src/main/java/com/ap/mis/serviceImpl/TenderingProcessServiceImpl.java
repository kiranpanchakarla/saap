package com.ap.mis.serviceImpl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ap.mis.dao.TenderingProcessDao;
import com.ap.mis.entity.Agency;
import com.ap.mis.entity.NoticeIssuingAuthorities;
import com.ap.mis.entity.TenderingProcess;
import com.ap.mis.service.TenderingProcessService;
import com.ap.mis.util.UploadUtil;

@Service
@Transactional
public class TenderingProcessServiceImpl implements TenderingProcessService {
	private static final Logger log = Logger.getLogger(TenderingProcessServiceImpl.class);
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	UploadUtil uploadUtil;
	
	@Autowired
	private ServletContext servletContext;
	@Autowired
	public TenderingProcessDao tenderingProcessDao;
	@Override
	public List<NoticeIssuingAuthorities> getAuthoritiesList() {
		return tenderingProcessDao.getAuthoritiesList();
	}

	@Override
	public List<Agency> getAgencyList() {
		return tenderingProcessDao.getAgencyList()      ;
	}

	@Override
	public TenderingProcess saveTenderingProcess(TenderingProcess tenderingProcess, MultipartFile engfile,
			MultipartFile telugufile) {
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
		return tenderingProcessDao.saveTenderingProcess(tenderingProcess);
	}

	@Override
	public TenderingProcess getTenderingInfo(int tenderingId) {
		return tenderingProcessDao.getTenderingInfo(tenderingId);
	}

	@Override
	public TenderingProcess getTenderDetails(int id) {
		
		return tenderingProcessDao.getTenderDetails(id);
	}

	@Override
	public TenderingProcess updateTenderingProcess(TenderingProcess tenderingProcessObj, MultipartFile engfile,
			MultipartFile telugufile) {
		try {
			String timeStamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

			if (!engfile.getOriginalFilename().isEmpty()) {
				File rootFolder = new File(
						uploadUtil.getUploadPath() + File.separator + "uploadfile" + File.separator + timeStamp);
				log.info("==rootFolder==" + rootFolder);
				if (!rootFolder.exists()) {
					rootFolder.mkdirs();
				}
				String filepath = rootFolder + File.separator + engfile.getOriginalFilename();
				engfile.transferTo(new File(filepath));
				log.info("===filepath==:" + filepath);
				tenderingProcessObj.setEngUpload(filepath);
			}
			else {
				tenderingProcessObj.setEngUpload(tenderingProcessObj.getEngUpload());
			}
			if (!telugufile.getOriginalFilename().isEmpty()) {
				File rootFolder = new File(
						uploadUtil.getUploadPath() + File.separator + "uploadfile" + File.separator + timeStamp);
				log.info("==rootFolder==" + rootFolder);
				if (!rootFolder.exists()) {
					rootFolder.mkdirs();
				}
				String filepath = rootFolder + File.separator + telugufile.getOriginalFilename();
				telugufile.transferTo(new File(filepath));
				log.info("===filepath==:" + filepath);
				tenderingProcessObj.setTelUpload(filepath);
			}else {
				tenderingProcessObj.setTelUpload(tenderingProcessObj.getTelUpload());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tenderingProcessDao.updateTenderingProcess(tenderingProcessObj);
	}

}
