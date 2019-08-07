package com.ap.mis.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ap.mis.entity.Attachements;
import com.ap.mis.entity.AttachmentHistoryDetails;
import com.ap.mis.entity.User;
import com.ap.mis.exceptions.AttachmentNotFoundException;
import com.ap.mis.service.AttachmentHistoryDetailsService;
import com.ap.mis.service.AttachmentService;
import com.ap.mis.util.EnumFilter;
import com.ap.mis.util.SecurityUtil;

@RestController
@RequestMapping("/upload")
public class UploadController {
	private static final Logger log = Logger.getLogger(UploadController.class);
	@Autowired
	AttachmentService attachmentService;

	@Autowired
	AttachmentHistoryDetailsService attachHistoryService;

	@PostMapping(value = "/files/{workid}")
	public List<Attachements> fileUplaod(Model model, HttpServletRequest request,
			@RequestParam("files") MultipartFile[] file, @RequestParam("moduleName") String moduleName,
			HttpSession session,@PathVariable("workid") Integer workId) {
		if(workId==null) {
		 workId = (int) session.getAttribute("workIdSession");
		}
		List<Attachements> attachments = attachmentService.saveAttachedDetails(workId, moduleName, file);
		try {
			attachmentHistoryDetailsSave(attachments);
		} catch (Exception ex) {
			log.error("Error with AttachmentHistoryDetails in UploadController while cancelStage():" + ex);
		}
		return attachments;
	}

	@PostMapping(value = "/deleteFiles")
	public String deleteFileUplaod(Model model, HttpServletRequest request,
			@RequestParam("uploadFileId") Integer uploadFileId, HttpSession session) {
		Attachements attachInfo = attachmentService.findById(uploadFileId);
		attachmentService.deleteAttachedDetails(attachInfo);
		try {
			attachmentHistoryDetailsDelete(attachInfo);
		} catch (Exception ex) {
			log.error("Error with AttachmentHistoryDetails in UploadController while cancelStage():" + ex);
		}
		return "success";

	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public List<Attachements> editfileUplaod(Integer workId, String moduleName, HttpServletRequest request) {
		List<Attachements> attachements = attachmentService.getAttachementsDetails(workId, moduleName);
		try {
			attachmentHistoryDetailsSave(attachements);
		} catch (Exception ex) {
			log.error("Error with AttachmentHistoryDetails in UploadController while cancelStage():" + ex);
		}
		return attachements;

	}

	@PostMapping(path = "/updateAttachmentStatus")
	public ResponseEntity<String> updateAttachmentStatus(@RequestBody Attachements attachment)
			throws AttachmentNotFoundException {

		User loggedInUser = SecurityUtil.getLoggedUser();

		attachmentService.updateAttachmentStatus(attachment, loggedInUser.getName());

		return new ResponseEntity<>("successfully attachment status updated", HttpStatus.OK);

	}

	private void attachmentHistoryDetailsSave(List<Attachements> attachments) {
		if (attachments.size() > 0) {
			User loggedInUser = SecurityUtil.getLoggedUser();
			List<AttachmentHistoryDetails> attachmentList = null;
			for (Attachements attachdetails : attachments) {
				AttachmentHistoryDetails attachHistDetails = new AttachmentHistoryDetails();
				attachHistDetails.setAttach(attachdetails);
				attachHistDetails.setCreatedBy(loggedInUser.getName());
				attachmentList = attachHistoryService.findHistoryListById(attachdetails.getId());
				if (attachmentList.size() > 0) {
					if (attachdetails.getStatus().equalsIgnoreCase(EnumFilter.OPEN.getStatus())) {
						attachHistDetails.setLog(EnumFilter.UPDATED.getStatus());
					}

				} else {
					if (attachdetails.getStatus().equalsIgnoreCase(EnumFilter.OPEN.getStatus())) {
						attachHistDetails.setLog(EnumFilter.SAVED.getStatus());
					} /*
						 * else
						 * if(attachdetails.getStatus().equalsIgnoreCase(EnumFilter.OPEN.getStatus())) {
						 * attachHistDetails.setLog(EnumFilter.SAVE.getStatus()); }
						 */
				}
				log.info("==attachHistDetails===:" + attachHistDetails);
				attachHistoryService.save(attachHistDetails);
			}

		}
	}

	private void attachmentHistoryDetailsDelete(Attachements attachInfo) {
		User loggedInUser = SecurityUtil.getLoggedUser();
		AttachmentHistoryDetails attachHistDetails = new AttachmentHistoryDetails();
		attachHistDetails.setAttach(attachInfo);
		attachHistDetails.setCreatedBy(loggedInUser.getName());
		log.info("active status==" + attachInfo.getIsActive());
		if (attachInfo.getIsActive() == false) {
			attachHistDetails.setLog(EnumFilter.DELETED.getStatus());
		}
		attachHistoryService.save(attachHistDetails);
	}

	@ExceptionHandler(AttachmentNotFoundException.class)
	public ResponseEntity<String> attachmentNotFoundException(AttachmentNotFoundException attachmentNotFoundException) {

		return new ResponseEntity<>(attachmentNotFoundException.getMessage(), HttpStatus.NOT_FOUND);
	}

}