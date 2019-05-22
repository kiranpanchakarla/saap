package com.ap.mis.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ap.mis.entity.Land;


@Service
public interface LandDetailService {
	public List<Land> getLandTypeList();

}
