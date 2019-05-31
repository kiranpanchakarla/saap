package com.ap.mis.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.UserCreationDao;
import com.ap.mis.entity.Role;
import com.ap.mis.entity.User;
import com.ap.mis.service.UserCreationService;

@Service
@Transactional
public class UserCreationServiceImpl implements UserCreationService {

	@Autowired
	public UserCreationDao userCreationDao;
	@Override
	public int saveNewUser(User user) {
		return userCreationDao.saveNewUser(user);
	}
	@Override
	public List<Role> getRoleList() {
		return userCreationDao.getRoleList();
	}

}
