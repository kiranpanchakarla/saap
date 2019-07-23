package com.ap.mis.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ap.mis.dao.MISdao;
import com.ap.mis.entity.Constituency;
import com.ap.mis.entity.Mandal;
import com.ap.mis.entity.NatureOfWork;
import com.ap.mis.entity.TypeOfWork;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Village;
import com.ap.mis.entity.WorkLineItemsList;
import com.ap.mis.entity.Works;

@Repository
public class MISDaoImpl implements MISdao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Works saveWorks(Works work) {
		try {
			sessionFactory.getCurrentSession().save(work);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return work;
	}

	@Override
	public User verifyUser(User user) {
		User validUser = null;
		String ss = "from User  where name=:un   and CAST(password as binary) = CAST(:pw as binary) ";
		// Query q=sessionFactory.getCurrentSession().createQuery(ss);
		// q.setParameter("un",user.getName());
		// q.setParameter("pw", user.getPassword());

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
	public List<TypeOfWork> findAll() {
		String details = "from TypeOfWork";
		Query q = sessionFactory.getCurrentSession().createQuery(details);
		List<TypeOfWork> typeOfWorkDetails = q.list();
		return typeOfWorkDetails;
	}

	@Override
	public List<NatureOfWork> natureOfDetails() {
		String details = "from NatureOfWork";
		Query q = sessionFactory.getCurrentSession().createQuery(details);
		List<NatureOfWork> natureOfWorkDetails = q.list();
		return natureOfWorkDetails;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Constituency> constituencyDetails(int PlaceId) {
		return sessionFactory.getCurrentSession().createQuery("from Constituency where districtId=" + PlaceId).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Mandal> mandalDetails(int placeId) {
		return sessionFactory.getCurrentSession().createQuery("from Mandal where constituencyId=" + placeId).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Village> villageDetails(int placeId) {
		return sessionFactory.getCurrentSession().createQuery("from Village where mandalId=" + placeId).list();
	}

	@Override
	public Works getWorkInfo(int workId) {
		System.out.println("workId -- :" + workId);
		List<Works> workList = new ArrayList<Works>();
		Works workInfo = new Works();
		String hql = "from Works where id=:workId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("workId", workId);
		System.out.println("q.list() :" + query.list());
		if (query.list().size() != 0) {
			workList = query.list();
		}
		for (Works work : workList) {
			workInfo = work;
		}
		return workInfo;
		/*
		 * return (Works) sessionFactory.getCurrentSession()
		 * .createQuery("from Works where id="+workId) .getSingleResult();
		 */
	}

	@Override
	public Works updateWork(Works work) {
		sessionFactory.getCurrentSession().update(work);
		return work;
	}

	@Override
	public Works deleteWork(Works work) {
		sessionFactory.getCurrentSession().update(work);
		return work;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<WorkLineItemsList> lineItemDetails(int workId) {
		List<WorkLineItemsList> lineitems = sessionFactory.getCurrentSession().createQuery(
				"select b.workDetails,b.cost from Works a,WorkLineItemsList b where a.id=b.WorkLineItemsList and a.id="
						+ workId)
				.list();
		return lineitems;

	}

	@Override
	public Works findByWorkNumber(String workNo) {
		List<Works> workList = new ArrayList<Works>();
		Works workInfo = new Works();
		String hql = "from Works where workNo=:workNo";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("workNo", workNo);
		if (query.list().size() != 0) {
			workList = query.list();
		}
		for (Works work : workList) {
			workInfo = work;
		}
		return workInfo;
	}
}
