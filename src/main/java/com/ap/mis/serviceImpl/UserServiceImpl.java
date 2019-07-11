package com.ap.mis.serviceImpl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.UserDao;
import com.ap.mis.entity.User;
import com.ap.mis.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	
	@Override
	public User getUser(User user) {
		return userDao.getUser(user);
	}

	@Override
	public User getUserByName(String name) {
		return userDao.getUserByName(name);
	}

	@Override
	public User findUserById(int id) {
		return userDao.findUserById(id);
	}

	@Override
	public List<User> findByUserIds(Set<Integer> userIdList) {
		// TODO Auto-generated method stub
		return userDao.findUsersByIds(userIdList);
	}

}
