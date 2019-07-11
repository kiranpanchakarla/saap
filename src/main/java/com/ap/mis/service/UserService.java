package com.ap.mis.service;

import java.util.List;
import java.util.Set;

import com.ap.mis.entity.User;

public interface UserService {

    public  User getUser(User user);
	
	public  User getUserByName(String name);
	
	public  User findUserById(int id);
	
	public List<User> findByUserIds(Set<Integer> userIdList);
}
