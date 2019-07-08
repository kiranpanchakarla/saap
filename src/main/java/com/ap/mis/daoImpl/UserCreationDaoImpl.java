package com.ap.mis.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.UserCreationDao;
import com.ap.mis.entity.GrantType;
import com.ap.mis.entity.Role;
import com.ap.mis.entity.User;

@Repository
@Transactional
public class UserCreationDaoImpl implements UserCreationDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public int saveNewUser(User user) {		
		int i = 0;
		try{
			i =(int) sessionFactory.getCurrentSession().save(user);	
		}
		catch(Exception e){
			e.printStackTrace();
			
		}	
		return i;
	}

	@Override
	public List<Role> getRoleList() {
		@SuppressWarnings("unchecked")
		List<Role> RoleList= sessionFactory.getCurrentSession().createQuery("from Role").getResultList();
		return RoleList;
	}
}
