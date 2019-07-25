package com.ap.mis.service;

import com.ap.mis.entity.LetterOfAcceptance;
import com.ap.mis.entity.Works;

public interface LetterOfAcceptanceService {

	LetterOfAcceptance save(LetterOfAcceptance letterOfAcceptance);

	LetterOfAcceptance findByWork(Works work);

}
