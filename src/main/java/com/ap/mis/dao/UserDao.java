package com.ap.mis.dao;

import com.ap.mis.entity.User;

public interface UserDao {
	
	public  User getUser(User user);
	
	public  User getUserByName(String name);
	
	public  User findUserById(int id);

}
