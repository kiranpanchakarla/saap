package com.ap.mis.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ap.mis.entity.Attachements;
import com.ap.mis.entity.AttachmentHistoryDetails;
import com.ap.mis.entity.User;
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

    @PostMapping(value = "/files")
    public List<Attachements> fileUplaod(Model model,HttpServletRequest request, @RequestParam("files") MultipartFile[] file, @RequestParam("moduleName") String moduleName, HttpSession session) {
    int workId = (int) session.getAttribute("workIdSession");
    List<Attachements> attachments=  attachmentService.saveAttachedDetails(workId, moduleName, file);
    try {
    	attachmentHistoryDetailsSave(attachments);
    }catch(Exception ex) {
    	log.error("Error with AttachmentHistoryDetails in UploadController while cancelStage():"+ex);
    }
    return attachments;
    }
  
    
    @PostMapping(value = "/deleteFiles")
    public String deleteFileUplaod(Model model,HttpServletRequest request, @RequestParam("uploadFileId") Integer uploadFileId, HttpSession session) {
        Attachements attachInfo=attachmentService.findById(uploadFileId);
        attachmentService.deleteAttachedDetails(attachInfo);
        return "success";
        
    }
    
  
 
    
    @RequestMapping(value="/edit", method=RequestMethod.GET)
    public List<Attachements> editfileUplaod(Integer workId,String moduleName,HttpServletRequest request ) {
        List<Attachements> attachements=attachmentService.getAttachementsDetails(workId,moduleName);
		return attachements;
        
    }
    
    private void attachmentHistoryDetailsSave(List<Attachements> attachments) {
    	if(attachments.size()>0) {
    	    User loggedInUser = SecurityUtil.getLoggedUser();
    		List<AttachmentHistoryDetails> attachmentList=null;
		    	for(Attachements attachdetails:attachments) {
		    	AttachmentHistoryDetails attachHistDetails=new AttachmentHistoryDetails();
		    	attachHistDetails.setAttach(attachdetails);
		    	attachHistDetails.setCreatedBy(loggedInUser.getName());
		    	attachmentList=attachHistoryService.findHistoryListById(attachdetails.getId());
		    	if(attachmentList.size()>0) {
		        	if(attachdetails.getStatus().equalsIgnoreCase(EnumFilter.OPEN.getStatus())) {
		        		attachHistDetails.setLog(EnumFilter.SAVED.getStatus());
		        	}/*else if(attachdetails.getStatus().equalsIgnoreCase(EnumFilter.OPEN.getStatus())) {
		        		attachHistDetails.setLog(EnumFilter.SAVE.getStatus());
		        	}*/
		        }else {
		        	if(attachdetails.getStatus().equalsIgnoreCase(EnumFilter.OPEN.getStatus())) {
		        		attachHistDetails.setLog(EnumFilter.UPDATED.getStatus());
		        	}
		        }
		    	log.info("==attachHistDetails===:"+attachHistDetails);
		    	attachHistoryService.save(attachHistDetails);
		    	}
		    	
    	
    		}
    }

}