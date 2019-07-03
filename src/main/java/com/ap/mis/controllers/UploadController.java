package com.ap.mis.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ap.mis.entity.Attachements;
import com.ap.mis.service.AttachmentService;
import com.ap.mis.util.ContextUtil;
import com.google.gson.Gson;


@RestController
@RequestMapping("/upload")
public class UploadController {
    
    @Autowired
    AttachmentService attachmentService;

    @PostMapping(value = "/files")
    public List<Attachements> fileUplaod(Model model,HttpServletRequest request, @RequestParam("files") MultipartFile[] file, @RequestParam("moduleName") String moduleName, HttpSession session) {
        int workId = (int) session.getAttribute("workIdSession");
        List<Attachements> attachments=  attachmentService.saveAttachedDetails(workId, moduleName, file);
        return attachments;
        
    }
    
    @PostMapping(value = "/deleteFiles")
    public String deleteFileUplaod(Model model,HttpServletRequest request, @RequestParam("uploadFileId") Integer uploadFileId, HttpSession session) {
        Attachements attachInfo=attachmentService.findById(uploadFileId);
        attachmentService.deleteAttachedDetails(attachInfo);
        
        return "success";
        
    }
    
  
    @RequestMapping(value="/edit", method=RequestMethod.GET)
    public @ResponseBody String editfileUplaod(Integer workId,String moduleName,HttpServletRequest request ) {
        List<Attachements> attachements=attachmentService.getAttachementsDetails(workId,moduleName);
		Map<Integer, String> attachFile = new HashMap<Integer, String>();
		for(Attachements attachDetails :attachements) {
			if (attachDetails.getPath() != null && !attachDetails.getPath().equals("")) {
				String attachmentPath=ContextUtil.populateContext(request) + attachDetails.getPath();
			    Integer attachmentId=attachDetails.getId();
			    attachFile.put(attachmentId, attachmentPath);
			} 
		}
		return new Gson().toJson(attachFile);
        
    }

}