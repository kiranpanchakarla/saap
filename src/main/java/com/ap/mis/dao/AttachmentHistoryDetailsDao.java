package com.ap.mis.dao;

import java.util.List;

import com.ap.mis.entity.AttachmentHistoryDetails;

public interface AttachmentHistoryDetailsDao {

	List<AttachmentHistoryDetails> findHistoryListById(Integer id);

	AttachmentHistoryDetails save(AttachmentHistoryDetails attachHistDetails);

}
