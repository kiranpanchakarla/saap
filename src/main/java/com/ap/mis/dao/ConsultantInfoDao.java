package com.ap.mis.dao;

import com.ap.mis.entity.ConsultantInfo;

public interface ConsultantInfoDao {

	ConsultantInfo saveConsultantInfo(ConsultantInfo consultantInfoObject);

	ConsultantInfo getConsultDetails(int id);

}
