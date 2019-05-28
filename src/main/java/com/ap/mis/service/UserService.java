package com.ap.mis.service;

import com.ap.mis.entity.User;

public interface UserService {

    public  User getUser(User user);
	
	public  User getUserByName(String name);
	
	public  User findUserById(int id);
}
