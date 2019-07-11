package com.ap.mis.daoImpl;

import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ap.mis.dao.UserDao;
import com.ap.mis.entity.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public User getUser(User user) {
		User validUser = null;
		List users = sessionFactory.getCurrentSession()
				.createQuery("from User  where name=:un and CAST(password as binary) = CAST(:pw as binary)")
				.setParameter("un", user.getName()).setParameter("pw", user.getPassword()).list();

		if (users.size() != 0) {
			validUser = (User) users.get(0);
		} else
			validUser = null;
		return validUser;
	}

	@Override
	public User getUserByName(String name) {
		User validUser = null;
		List users = sessionFactory.getCurrentSession().createQuery("from User  where name=:un")
				.setParameter("un", name).list();

		if (users.size() != 0) {
			validUser = (User) users.get(0);
		} else
			validUser = null;
		return validUser;
	}

	@Override
	public User findUserById(int id) {
		User validUser = null;
		List users = sessionFactory.getCurrentSession().createQuery("from User  where id=:un").setParameter("un", id)
				.list();

		if (users.size() != 0) {
			validUser = (User) users.get(0);
		} else
			validUser = null;
		return validUser;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> findUsersByIds(Set<Integer> userIds) {
		// TODO Auto-generated method stub

		return sessionFactory.getCurrentSession().createQuery("from User  where id in(:userIdList)")
				.setParameterList("userIdList", userIds).list();
	}

}
