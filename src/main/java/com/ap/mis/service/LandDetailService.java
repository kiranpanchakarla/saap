package com.ap.mis.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ap.mis.entity.Division;
import com.ap.mis.entity.Land;
import com.ap.mis.entity.Section;
import com.ap.mis.entity.Subdivision;


@Service
public interface LandDetailService {
	public List<Land> getLandTypeList();
	public Division findByDivisionId(int id);
	public Subdivision findBySubDivision(int id);
	public  Section findBySectionId(int id);

}
