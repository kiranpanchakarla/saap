package com.ap.mis.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ap.mis.entity.Agency;
import com.ap.mis.entity.NoticeIssuingAuthorities;
import com.ap.mis.entity.TenderingProcess;



public interface TenderingProcessService {
	
	public List<NoticeIssuingAuthorities> getAuthoritiesList();
	public List<Agency> getAgencyList();
	public TenderingProcess saveTenderingProcess(TenderingProcess tenderingProcessObj);
	public TenderingProcess updateTenderingProcess(TenderingProcess tenderingProcessObj, MultipartFile engfile,MultipartFile telugufile);
	public TenderingProcess getTenderingInfo(int tenderingId);
	public TenderingProcess getTenderDetails(int id);
	
	
}
