package com.ap.mis.util;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;

import com.ap.mis.emailGenerator.EmailerGenerator;
import com.ap.mis.entity.Attachements;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Works;
import com.ap.mis.service.AttachmentService;

@Component
public class SendEmail extends EmailerGenerator {
	private static final Logger log = Logger.getLogger(SendEmail.class);

    @Autowired
	private JavaMailSender mailSender;
    
    @Autowired
    HttpServletRequest request;
    
    @Autowired
	AttachmentService attachService;

    @Value(value = "${environment}")
	private  String environment;
	
   public String getEnvironment() {
		return environment;
	}

	public void setEnvironment(String environment) {
		this.environment = environment;
	}

	

	public void sendApproveEmail(Works work) throws Exception {
		if (shouldNotify()) {
			try {
				mailSender.send(createApprovedMsg(work));
			} catch (Exception ex) {
				ex.printStackTrace();
				throw new Exception(ex);
			}
		}
	}

	protected MimeMessagePreparator createApprovedMsg(Works work) {
		return new MimeMessagePreparator() {
			public void prepare(MimeMessage mimeMessage) throws MessagingException, IOException {
			
				String toEmail="";
				User loggedInUser = SecurityUtil.getLoggedUser();  // gets mailId from login user
				String toEmailFromPropertyFile=getSEND_EMAIL();   // gets mailId from property file  
				toEmail =  loggedInUser.getEmail();
				if(toEmailFromPropertyFile != null || !toEmailFromPropertyFile.isEmpty()   ) {
					toEmail+=","+toEmailFromPropertyFile;
				}
				String[] emailList = toEmail.split(",");
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "UTF-8");
								
				String bodyContent="";//checks the workStatus and based on that a msg is generated
				if(work.getWorkStatus()==EnumWorkStatus.LAND.getStatus()) {
					bodyContent="Work Info Created";
				}else if(work.getWorkStatus()==EnumWorkStatus.PENDING_SAAP_APPROVAL.getStatus()) {
					bodyContent="Consultant Created";
				}else if(work.getWorkStatus()==EnumWorkStatus.SAAP_APPROVED.getStatus()) {
					bodyContent="SAAP Approved by Admin";
				}else if(work.getWorkStatus()==EnumWorkStatus.WORK_ESTIMATION_COMPLETED.getStatus()) {
					bodyContent="Work Estimation Completed";
				}else if(work.getWorkStatus()==EnumWorkStatus.TECHNICAL_SANCTION_COMPLETED.getStatus()) {
					bodyContent="Technical Sanction Completed";
				}
				message.setFrom(getSUPPORT_EMAIL());
				message.setTo(emailList);
				message.setSubject(getEnvironment() + " - " + " WorkId : " + " " + work.getId() + " Status :" + work.getWorkStatus());
				message.setText(bodyContent);
				message.setSentDate(new Date());
				
				List<Attachements> attachements=attachService.getAttachementsDetails(work.getId(),EnumFilter.ADMIN.getStatus());
				//add attachments
				for(Attachements attachDetails :attachements) {
					if (attachDetails.getPath() != null && !attachDetails.getPath().equals("")) {
						try {
							FileSystemResource file = new FileSystemResource(attachDetails.getPath());
							 message.addAttachment(file.getFilename(), file);
			                } catch (Exception ex) {
			                    ex.printStackTrace();
			                }
			            } 
				}
				
				
			}

		};
	}

}
