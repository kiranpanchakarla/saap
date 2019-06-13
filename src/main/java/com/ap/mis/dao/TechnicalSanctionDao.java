package com.ap.mis.dao;

import com.ap.mis.entity.TechnicalSanction;

public interface TechnicalSanctionDao {

	TechnicalSanction saveTechSanction(TechnicalSanction techsanc);
	TechnicalSanction updateTechSanction(TechnicalSanction techsanc);
	TechnicalSanction getTechDetails(int id);

}
