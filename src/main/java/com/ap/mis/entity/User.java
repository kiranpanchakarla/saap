package com.ap.mis.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name ="tbl_sa_users")
public class User implements Serializable {
	 @Id
	    @GeneratedValue(strategy = GenerationType.SEQUENCE)
	    @Column(name = "user_id")
	    private int id;

	    @Column(name = "user_name")
	    private String name;
	    
	    @Column(name = "user_password")
	    private String password;

	    @Column(name = "user_mobile")
	    private String mobile;

	    @Column(name = "user_email")
	    private String email;

	    @Column(name = "user_address")
	    private String address;
	    
	    @Column(name = "user_isadmin")
	    private boolean isAdmin;
	    
	    @Column(name = "user_isactive")
	    private boolean isActive;
	    
	    @Column(name = "user_isdeleted")
	    private boolean isDeleted;
	    	    
	    @OneToOne(targetEntity=Role.class)
		@JoinColumn(name="role_id", referencedColumnName="id")
	    private Role role;
	    
	    public User(String name, String password) {
			this.name = name;
			this.password = password;
		}
	    
	    public User() {
			
		}
	    
	    public static  User toUser(User inUser){
			User user=new User();
			user.setId(inUser.getId());
			user.setName(inUser.getName());
			user.setPassword(inUser.getPassword());
			user.setAddress(inUser.getAddress());
			user.setEmail(inUser.getEmail());
			user.setMobile(inUser.getMobile());
			user.setRole(inUser.getRole());
			user.setIsActive(inUser.getIsActive());
			user.setIsDeleted(inUser.getIsDeleted());
			user.setAdmin(inUser.getIsAdmin());
			return user;
			
		}

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getMobile() {
			return mobile;
		}

		public void setMobile(String mobile) {
			this.mobile = mobile;
		}

		public boolean getIsAdmin() {
			return isAdmin;
		}

		public void setAdmin(boolean isAdmin) {
			this.isAdmin = isAdmin;
		}

		public boolean getIsActive() {
			return isActive;
		}

		public void setIsActive(boolean isActive) {
			this.isActive = isActive;
		}

		public boolean getIsDeleted() {
			return isDeleted;
		}

		public void setIsDeleted(boolean isDeleted) {
			this.isDeleted = isDeleted;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public Role getRole() {
			return role;
		}

		public void setRole(Role role) {
			this.role = role;
		}
   

}
