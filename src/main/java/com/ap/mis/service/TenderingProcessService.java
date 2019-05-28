package com.ap.mis.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ap.mis.entity.Agency;
import com.ap.mis.entity.NoticeIssuingAuthorities;


@Service
public interface TenderingProcessService {
	
	public List<NoticeIssuingAuthorities> getAuthoritiesList();
	public List<Agency> getAgencyList();
}
