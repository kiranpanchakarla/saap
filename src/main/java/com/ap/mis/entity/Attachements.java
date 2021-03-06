package com.ap.mis.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
@Entity
@Table(name = "tbl_sa_Attachements")
public class Attachements extends AuditModel implements Serializable {

	private static final long serialVersionUID = -3465813074586302847L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, unique = true)
	private Integer id;
	

	@Column(name="path")
	private String  path;
	
	@Column(name="module_name")
	private String module;
	
	@Column(name="work_id")
	private Integer workId;
	
	@Column(name="is_active")
	private Boolean isActive = true;
	
	@Column(name="file_size")
	private Long fileSize;
	
	@Column(name="status")
	private String status;
	
	@Transient
	private String convertFileSize;
	
	@Transient
	private String fileUploadUserName;
	
	
	public String getConvertFileSize() {
      
		return convertFileSize;
	}
	

	public void setConvertFileSize(String convertFileSize) {
		this.convertFileSize = convertFileSize;
	}


	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	
	public Integer getWorkId() {
		return workId;
	}

	public void setWorkId(Integer workId) {
		this.workId = workId;
	}
	
	

	public Long getFileSize() {
		
		return fileSize;
	}

	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	
	}
	

	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}

	

	public String getFileUploadUserName() {
		return fileUploadUserName;
	}


	public void setFileUploadUserName(String fileUploadUserName) {
		this.fileUploadUserName = fileUploadUserName;
	}


	@Override
	public String toString() {
		return "Attachements [id=" + id + ", path=" + path + ", module=" + module + ", workId=" + workId + ", isActive="
				+ isActive + ", fileSize=" + fileSize + ", status=" + status + ", convertFileSize=" + convertFileSize
				+ "]";
	}


	
	
	 
	

}
