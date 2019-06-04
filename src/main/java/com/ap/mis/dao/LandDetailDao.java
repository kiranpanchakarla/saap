package com.ap.mis.dao;

import java.util.List;

import com.ap.mis.entity.Division;
import com.ap.mis.entity.Land;
import com.ap.mis.entity.LandDetails;
import com.ap.mis.entity.Section;
import com.ap.mis.entity.Subdivision;

public interface LandDetailDao {

	public List<Land> getLandTypeList();

	public Division findByDivisionId(int id);

	public Subdivision findBySubDivision(int id);

	public Section findBySectionId(int id);

	public LandDetails landDetailsSave(LandDetails landDetails);
	
	public LandDetails getLandinfo(int id);


}
