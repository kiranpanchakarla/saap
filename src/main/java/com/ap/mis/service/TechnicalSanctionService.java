package com.ap.mis.service;

import com.ap.mis.entity.TechnicalSanction;

public interface TechnicalSanctionService {

	TechnicalSanction saveTechSanction(TechnicalSanction techsanc);
	TechnicalSanction updateTechSanction(TechnicalSanction techsanc);

	TechnicalSanction getTechDetails(int id);

}
