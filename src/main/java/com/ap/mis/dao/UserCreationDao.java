package com.ap.mis.dao;

import java.util.List;

import com.ap.mis.entity.Role;
import com.ap.mis.entity.User;

public interface UserCreationDao {
	
	public int saveNewUser(User user);
	public List<Role> getRoleList();


}
