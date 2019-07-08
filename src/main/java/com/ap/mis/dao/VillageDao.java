package com.ap.mis.dao;

import java.util.List;

import com.ap.mis.entity.Village;

public interface VillageDao {
	 public List<Village> findAll();
     public Village findById(int id);
     public List<Village> findByMandalId(int id);
}
