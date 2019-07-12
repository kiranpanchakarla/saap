package com.ap.mis.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.Attachements;
import com.ap.mis.entity.LandDetails;
import com.ap.mis.exceptions.AttachmentNotFoundException;

public interface AttachmentService {

	List<Attachements> saveAttachedDetails(int workId,String moduleName, MultipartFile[] file);

	List<Attachements> getAttachementsDetails(int parseInt, String module);

	

	Attachements findById(Integer uploadFileId);

	Attachements deleteAttachedDetails(Attachements attachInfo);

	

	Attachements updateAttachmentStatus(Attachements attachment, String actionPerformedBy) throws AttachmentNotFoundException;

	
	

}
