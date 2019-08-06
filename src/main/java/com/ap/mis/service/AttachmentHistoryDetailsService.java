package com.ap.mis.service;

import java.util.List;

import com.ap.mis.entity.Attachements;
import com.ap.mis.entity.AttachmentHistoryDetails;
import com.ap.mis.entity.Works;

public interface AttachmentHistoryDetailsService {

	List<AttachmentHistoryDetails> findHistoryListById(Integer id);

	AttachmentHistoryDetails save(AttachmentHistoryDetails attachHistDetails);

	List<AttachmentHistoryDetails> findHistoryListByWork(Works work);

}
