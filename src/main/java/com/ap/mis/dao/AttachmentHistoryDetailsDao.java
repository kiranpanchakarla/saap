package com.ap.mis.dao;

import java.util.List;

import com.ap.mis.entity.AttachmentHistoryDetails;
import com.ap.mis.entity.Works;

public interface AttachmentHistoryDetailsDao {

	List<AttachmentHistoryDetails> findHistoryListById(Integer id);

	AttachmentHistoryDetails save(AttachmentHistoryDetails attachHistDetails);

	List<AttachmentHistoryDetails> findHistoryListByWorkId(Integer workId);

}
