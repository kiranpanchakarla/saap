package com.ap.mis.service;

import com.ap.mis.entity.District;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public interface DistrictService {
    public List<District> findAll();
    public List<District> findByState(int stateId);
    public District findById(int id);
}
