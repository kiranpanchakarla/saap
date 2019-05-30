package com.ap.mis.dao;

import java.util.List;

import com.ap.mis.entity.Agency;
import com.ap.mis.entity.NoticeIssuingAuthorities;
import com.ap.mis.entity.TenderingProcess;

public interface TenderingProcessDao {

	public List<NoticeIssuingAuthorities> getAuthoritiesList();
	public List<Agency> getAgencyList();
	public TenderingProcess saveTenderingProcess(TenderingProcess tenderingProcess);
	public TenderingProcess getTenderingInfo(int tenderingId);
}
