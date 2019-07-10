package com.ap.mis.service;

import java.util.List;

import com.ap.mis.entity.Attachements;
import com.ap.mis.entity.AttachmentHistoryDetails;

public interface AttachmentHistoryDetailsService {

	List<AttachmentHistoryDetails> findHistoryListById(Integer id);

	AttachmentHistoryDetails save(AttachmentHistoryDetails attachHistDetails);

	

}
