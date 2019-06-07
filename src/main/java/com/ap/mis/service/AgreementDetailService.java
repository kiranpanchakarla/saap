package com.ap.mis.service;

import com.ap.mis.entity.AgreementDetails;

public interface AgreementDetailService {

	AgreementDetails saveAgreementDetails(AgreementDetails agreementDetailsObj);

	AgreementDetails getAgreementDetails(int id);

}
