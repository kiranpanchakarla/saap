package com.ap.mis.dao;

import com.ap.mis.entity.AgreementDetails;

public interface AgreementDetailsDao {

	AgreementDetails saveAgreementDetails(AgreementDetails agreementDetails);
	AgreementDetails updateAgreementDetails(AgreementDetails agreementDetailsObj);
	AgreementDetails getAgreementDetails(int id);

}
