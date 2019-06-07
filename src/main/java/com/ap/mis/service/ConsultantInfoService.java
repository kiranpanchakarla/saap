package com.ap.mis.service;

import com.ap.mis.entity.ConsultantInfo;

public interface ConsultantInfoService {

	ConsultantInfo saveConsultantInfo(ConsultantInfo consultantInfoObject);

	ConsultantInfo getConsultDetails(int id);

}
