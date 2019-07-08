package com.ap.mis.service;

import java.util.List;

import com.ap.mis.entity.District;
import com.ap.mis.entity.Mandal;

public interface MandalService {
	 public List<Mandal> findAll();
     public Mandal findById(int id);
     public List<Mandal> findByConstituencyId(int id);
}
