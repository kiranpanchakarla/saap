package com.ap.mis.service;

import java.util.List;

import com.ap.mis.entity.District;
import com.ap.mis.entity.Village;

public interface VillageService {
	 public List<Village> findAll();
     public Village findById(int id);
     public List<Village> findByMandalId(int id);
}
