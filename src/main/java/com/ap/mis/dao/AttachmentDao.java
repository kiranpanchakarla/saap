package com.ap.mis.dao;

import java.util.List;

import com.ap.mis.entity.Attachements;

public interface AttachmentDao {

	List<Attachements> saveAttachedDetails(List<Attachements> attachments);

	List<Attachements> getAttachementsDetails(int workId, String module);
	
    Attachements findById(Integer uploadFileId);

	Attachements deleteAttachedDetails(Attachements attachInfo);

	

}
