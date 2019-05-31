package com.ap.mis.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ap.mis.entity.Role;
import com.ap.mis.entity.User;


@Service
public interface UserCreationService {
	
	public int saveNewUser(User user);
	public List<Role> getRoleList();
	

}
