package com.ap.mis.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.AgreementDetailsDao;
import com.ap.mis.entity.AgreementDetails;
import com.ap.mis.entity.TenderingProcess;

@Repository
@Transactional
public class AgreementDetailsDaoImpl implements AgreementDetailsDao{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public AgreementDetails saveAgreementDetails(AgreementDetails agreementDetails) {
		
		try{
			sessionFactory.getCurrentSession().save(agreementDetails);	
			
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
		return agreementDetails;
	}

	@Override
	public AgreementDetails getAgreementDetails(int id) {
		/*AgreementDetails agreementDetails=(AgreementDetails) sessionFactory.getCurrentSession()
		 * .createQuery("from AgreementDetails where work.id="+id).getSingleResult();
		return agreementDetails;*/
		AgreementDetails agreementDetails = null;
		try {
			@SuppressWarnings("unchecked")
			List<AgreementDetails> agreementDetailsList = sessionFactory.getCurrentSession()
					.createQuery("from TenderingProcess where work.id=" + id).list();
			if (agreementDetailsList.size() != 0) {
				for (AgreementDetails consult : agreementDetailsList) {
					agreementDetails = consult;
				}
			} else {
				agreementDetails = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return agreementDetails;
	}

	@Override
	public AgreementDetails updateAgreementDetails(AgreementDetails agreementDetailsObj) {
		try {
			sessionFactory.getCurrentSession().update(agreementDetailsObj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return agreementDetailsObj;
	}
}
