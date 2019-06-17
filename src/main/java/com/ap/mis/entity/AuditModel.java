package com.ap.mis.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.envers.Audited;
import org.hibernate.event.spi.SaveOrUpdateEvent;
import org.hibernate.event.spi.SaveOrUpdateEventListener;
import com.ap.mis.util.SecurityUtil;

@MappedSuperclass
@Audited
@EntityListeners(SaveOrUpdateEventListener.class)
public class AuditModel  implements SaveOrUpdateEventListener{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
 
	    
    @CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_at",updatable = false)
    private Date createdAt;

     
    @UpdateTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "updated_at")
    private Date updatedAt;
    
    @Column(name="created_uid",updatable = false)
    private Integer createdBy;
	
    @Column(name="updated_uid")
    private Integer updatedBy;
    
  /*  @PrePersist
    public void onSave()
    {
    	System.out.println("onSave");
    	 if (SecurityUtil.getLoggedUser() != null ) {
			 User user= SecurityUtil.getLoggedUser();
			 this.createdBy = user.getId();
			 this.updatedBy = user.getId();
			 System.out.println("TEST");
    	 }else {
    		 //this.createdBy = null;
    	 }
    	
    }
    
    @PreUpdate
    public void onUpdate()
    {
    	System.out.println("onUpdate");
    	 if (SecurityUtil.getLoggedUser() != null) {
			 User user= SecurityUtil.getLoggedUser();
			 this.updatedBy = user.getId();
			 
    	 }else {
    		 //this.updatedBy = null;
    	 }
    	
    }*/
    
   @Override
    public void onSaveOrUpdate(SaveOrUpdateEvent event) {
    	System.out.println("onSaveOrUpdate");
    	 if (SecurityUtil.getLoggedUser() != null) {
			 User user= SecurityUtil.getLoggedUser();
			 this.createdBy = user.getId();
			 this.updatedBy = user.getId();
			 
    	 }else {
    		 //this.updatedBy = null;
    	 }
    	
    }


	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	 

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Integer getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

	public Integer getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(Integer updatedBy) {
		this.updatedBy = updatedBy;
	}

	@Override
	public String toString() {
		return "AuditModel [createdAt=" + createdAt + ", updatedAt=" + updatedAt + ", createdBy=" + createdBy
				+ ", updatedBy=" + updatedBy + "]";
	}
    
	
    
}
