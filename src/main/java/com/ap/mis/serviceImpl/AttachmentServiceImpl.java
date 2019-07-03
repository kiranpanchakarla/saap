package com.ap.mis.serviceImpl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ap.mis.dao.AttachmentDao;
import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.Attachements;
import com.ap.mis.entity.LandDetails;
import com.ap.mis.service.AttachmentService;
import com.ap.mis.util.EnumFilter;
import com.ap.mis.util.UploadUtil;
@Service
@Transactional
public class AttachmentServiceImpl implements AttachmentService{
	private static final Logger log = Logger.getLogger(AttachmentServiceImpl.class);
	
	@Autowired
	UploadUtil uploadUtil;
	
	@Autowired
	AttachmentDao attachDao;
	
	
	@Override
	public List<Attachements> saveAttachedDetails(int workId,String moduleName, MultipartFile[] file) {
		 List<Attachements> attachments=new ArrayList<Attachements>();
		
		try {
			String timeStamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			
			if (file.length >0) {
				
			     for (MultipartFile multipartFile : file) {
		                String fileName = ((MultipartFile) multipartFile).getOriginalFilename();
		                log.info("==fileName==" + fileName);
		                File rootFolder = new File(uploadUtil.getUploadPath() + File.separator + "uploadfile" + File.separator + timeStamp);
						log.info("==rootFolder==" + rootFolder);
						if (!rootFolder.exists()) {
							rootFolder.mkdirs();
						}
						String filepath = rootFolder + File.separator + fileName;
						((MultipartFile) multipartFile).transferTo(new File(filepath));
						log.info("===filepath==:" + filepath);
						Attachements fileItems=new Attachements();
						fileItems.setPath(filepath);
						fileItems.setWorkId(workId);
					    fileItems.setModule(moduleName);
						attachments.add(fileItems);
					 
		                }
		       
			}
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
		return attachDao.saveAttachedDetails(attachments);
	}


	@Override
	public List<Attachements> getAttachementsDetails(int workId, String module) {
		
		return attachDao.getAttachementsDetails(workId,module);
	}


	

	@Override
	public Attachements findById(Integer uploadFileId) {
		
		return attachDao.findById(uploadFileId);
	}


	@Override
	public Attachements deleteAttachedDetails(Attachements attachInfo) {
		 attachInfo.setIsActive(false);
		return attachDao.deleteAttachedDetails(attachInfo);
	}
	


	


	


	

}
