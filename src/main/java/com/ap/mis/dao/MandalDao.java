package com.ap.mis.dao;

import java.util.List;

import com.ap.mis.entity.Mandal;

public interface MandalDao {
	List<Mandal> findAll();
	Mandal findById(int id);
}
