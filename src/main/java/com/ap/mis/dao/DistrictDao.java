package com.ap.mis.dao;

import java.util.List;

import com.ap.mis.entity.District;

public interface DistrictDao {
	
	 public List<District> findAll();
	 public List<District> findByState(int stateId);
	 public District findById(int id);

}
