package com.ap.mis.dao;

import java.util.List;

import com.ap.mis.entity.Constituency;

public interface ConstituencyDao {
	
	 public List<Constituency> findAll();
     public Constituency findById(int id);
     public List<Constituency> findByDistrictId(int id);
}
