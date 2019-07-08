package com.ap.mis.serviceImpl;

import java.io.File;
import java.text.DecimalFormat;
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
import com.ap.mis.entity.Attachements;
import com.ap.mis.service.AttachmentService;
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
		                File rootFolder = new File(uploadUtil.getUploadPath() + File.separator + "uploadfile" + File.separator + timeStamp);
						if (!rootFolder.exists()) {
							rootFolder.mkdirs();
						}
						String filepath = rootFolder + File.separator + fileName;
						((MultipartFile) multipartFile).transferTo(new File(filepath));
						File attachFile=new File(filepath);
						long fileSize = attachFile.length();
						log.info("===filepath==:" + filepath);
						Attachements fileItems=new Attachements();
						fileItems.setPath(filepath);
						fileItems.setWorkId(workId);
					    fileItems.setModule(moduleName);
					    fileItems.setFileSize(fileSize);
					    fileItems.setConvertFileSize(readableFileSize(fileSize));
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
		List<Attachements> attachments=attachDao.getAttachementsDetails(workId,module);
		
		for(Attachements attach:attachments) {			
			attach.setConvertFileSize(readableFileSize(attach.getFileSize()));
		}
		return attachments;
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
	


	
	  private String readableFileSize(Long size) {
		
		    if( size == null || size <= 0) return "0 B";
		    final String[] units = new String[] { "B", "kB", "MB", "GB", "TB" };
		    int digitGroups = (int) (Math.log10(size)/Math.log10(1024));
		    return new DecimalFormat("#,##0.#").format(size/Math.pow(1024, digitGroups)) + " " + units[digitGroups];
		}


	


	

}
