package com.ap.mis.dao;

import com.ap.mis.entity.LetterOfAcceptance;
import com.ap.mis.entity.Works;

public interface LetterOfAcceptanceDao {

	LetterOfAcceptance save(LetterOfAcceptance letterOfAcceptance);

	LetterOfAcceptance findByWork(Works work);

}
