package com.ap.mis.dao;

import java.util.List;
import java.util.Set;

import com.ap.mis.entity.User;

public interface UserDao {
	
	public  User getUser(User user);
	
	public  User getUserByName(String name);
	
	public  User findUserById(int id);
	
	public List<User> findUsersByIds(Set<Integer> userIds);

}
