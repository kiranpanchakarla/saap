package com.ap.mis.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.TechnicalSanctionDao;
import com.ap.mis.entity.ConsultantInfo;
import com.ap.mis.entity.TechnicalSanction;

@Repository
@Transactional
public class TechnicalSanctionDaoImpl implements TechnicalSanctionDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public TechnicalSanction saveTechSanction(TechnicalSanction techsanc) {

		try {
			sessionFactory.getCurrentSession().save(techsanc);

		} catch (Exception e) {
			e.printStackTrace();

		}
		return techsanc;
	}

	@Override
	public TechnicalSanction getTechDetails(int id) {
		/*TechnicalSanction techDetails=null;
		techDetails=(TechnicalSanction) sessionFactory.getCurrentSession().createQuery("from TechnicalSanction where work.id="+id).getSingleResult();
		return techDetails;*/
		TechnicalSanction techDetails = null;
		try {
			@SuppressWarnings("unchecked")
			List<TechnicalSanction> techDetailsList = sessionFactory.getCurrentSession()
					.createQuery("from TechnicalSanction where work.id=" + id).list();
			if (techDetailsList.size() != 0) {
				for (TechnicalSanction consult : techDetailsList) {
					techDetails = consult;
				}
			} else {
				techDetails = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return techDetails;
	}

	@Override
	public TechnicalSanction updateTechSanction(TechnicalSanction techsanc) {
		try {
			sessionFactory.getCurrentSession().update(techsanc);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return techsanc;
	}

}
