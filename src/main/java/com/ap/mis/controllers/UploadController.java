package com.ap.mis.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ap.mis.entity.Attachements;
import com.ap.mis.service.AttachmentService;


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
    public List<Attachements> editfileUplaod(Integer workId,String moduleName,HttpServletRequest request ) {
        List<Attachements> attachements=attachmentService.getAttachementsDetails(workId,moduleName);
		return attachements;
        
    }

}