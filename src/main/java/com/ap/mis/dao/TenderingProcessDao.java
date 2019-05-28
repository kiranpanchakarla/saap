package com.ap.mis.dao;

import java.util.List;

import com.ap.mis.entity.Agency;
import com.ap.mis.entity.NoticeIssuingAuthorities;

public interface TenderingProcessDao {

	public List<NoticeIssuingAuthorities> getAuthoritiesList();
	public List<Agency> getAgencyList();
}
