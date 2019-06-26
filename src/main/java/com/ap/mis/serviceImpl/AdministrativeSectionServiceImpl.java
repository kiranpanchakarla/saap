package com.ap.mis.serviceImpl;

import java.io.File;
import java.sql.Blob;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ap.mis.dao.AdministrativeSectionDao;
import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.Attachements;
import com.ap.mis.entity.ExecutiveConsultant;
import com.ap.mis.entity.ExecutiveDept;
import com.ap.mis.entity.FinancialYear;
import com.ap.mis.entity.GrantType;
import com.ap.mis.entity.Works;
import com.ap.mis.service.AdministrativeSectionService;
import com.ap.mis.util.EnumFilter;
import com.ap.mis.util.UploadUtil;

@Service
@Transactional
public class AdministrativeSectionServiceImpl implements AdministrativeSectionService {
	private static final Logger log = Logger.getLogger(AdministrativeSectionServiceImpl.class);

	@Autowired
	AdministrativeSectionDao administrativeSectionDao;

	@Autowired
	UploadUtil uploadUtil;

	@Autowired
	private ServletContext servletContext;

	@Override
	public List<GrantType> findAll() {
		return administrativeSectionDao.findAll();
	}

	@Override
	public List<FinancialYear> getfinancialYearList() {
		return administrativeSectionDao.getfinancialYearList();
	}

	@Override
	public List<ExecutiveDept> getExecutiveDeptList() {
		return administrativeSectionDao.getExecutiveDeptList();
	}

	@Override
	public List<ExecutiveConsultant> getExecutiveConsultantList() {
		return administrativeSectionDao.getExecutiveConsultantList();
	}

	@Override
	public FinancialYear findById(int id) {

		return administrativeSectionDao.findById(id);
	}

	@Override
	public ExecutiveDept findByExecutiveDeptId(int id) {
		return administrativeSectionDao.findByExecutiveDeptId(id);
	}

	@Override
	public ExecutiveConsultant findByExecutiveConsultantId(int id) {
		// TODO Auto-generated method stub
		return administrativeSectionDao.findByExecutiveConsultantId(id);
	}

	@Override
	public GrantType findByGrantId(int id) {
		// TODO Auto-generated method stub
		return administrativeSectionDao.findByGrantId(id);
	}

	@Override
	public AdministrativeSection adminstrativeSectionSave(AdministrativeSection adminSecObject) {
		
		return administrativeSectionDao.adminstrativeSectionSave(adminSecObject);
	}
	@Override
	public AdministrativeSection getAdminInfo(int id) {
		return administrativeSectionDao.getAdminInfo(id);
	}

	@Override
	public AdministrativeSection getAdminDetails(int id) {
		return administrativeSectionDao.getAdminDetails(id);

	}

	@Override
	public AdministrativeSection adminstrativeSectionUpdate(AdministrativeSection adminSecObject,
			MultipartFile file) {
		try {/*
			String timeStamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			String path = adminSecObject.getPath();
			log.info("==path==" + path);
			if (!file.getOriginalFilename().isEmpty()) {
				File rootFolder = new File(
						uploadUtil.getUploadPath() + File.separator + "uploadfile" + File.separator + timeStamp);
				log.info("==rootFolder==" + rootFolder);
				if (!rootFolder.exists()) {
					rootFolder.mkdirs();
				}
				String filepath = rootFolder + File.separator + file.getOriginalFilename();
				file.transferTo(new File(filepath));
				log.info("===filepath==:" + filepath);
				adminSecObject.setPath(filepath);

			} else {
				adminSecObject.setPath(path);
			}
		*/}

		catch (Exception e) {
			e.printStackTrace();
		}
		return administrativeSectionDao.adminstrativeSectionUpdate(adminSecObject);
	}

	
	

}
