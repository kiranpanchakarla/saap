package com.ap.mis.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.Attachements;
import com.ap.mis.entity.LandDetails;

public interface AttachmentService {

	List<Attachements> saveAttachedDetails(int workId,String moduleName, MultipartFile[] file);

	List<Attachements> getAttachementsDetails(int parseInt, String module);

	

}
