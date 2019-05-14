package com.ap.mis.service;

import java.util.List;

import com.ap.mis.entity.Constituency;
import com.ap.mis.entity.District;

public interface ConstituencyService {
	 public List<Constituency> findAll();
     public Constituency findById(int id);
}
