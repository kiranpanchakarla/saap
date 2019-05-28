package com.ap.mis.web;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.DatatypeConverter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Controller;

import com.ap.mis.entity.Role;
import com.ap.mis.entity.User;
import com.ap.mis.service.UserService;

@Controller
public class AuthenticationController implements AuthenticationProvider{

	 @Autowired
	 UserService userService;
	 
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
       System.out.println("Authentication Called...");
		 User loggedInUser = new User(authentication.getName(), authentication.getCredentials().toString());
	     User user=userService.getUser(loggedInUser);
	     
	     boolean isValid=false;
	        byte[] decodedBytes = DatatypeConverter.parseBase64Binary(loggedInUser.getPassword());
	        String passWord =new String(decodedBytes) ;
	        
	        try {
                    
                if(user!=null  &&  passWord.equals(user.getPassword())){
                	isValid=true;
                } 
                    
                if(user!=null) {
                    List<GrantedAuthority> grantedAuths = new ArrayList<GrantedAuthority>();
                        Role role= user.getRole(); 
                        grantedAuths.add(new SimpleGrantedAuthority(role.getRoleName()));
                        Authentication auth = new UsernamePasswordAuthenticationToken(User.toUser(user),passWord, grantedAuths);  
                        return auth;
                
                }
                else {
                    
                    if(!isValid){
                        throw new BadCredentialsException("Username/Password Invalid.");
                    }
                    return null;
                 }
                }
             catch(Exception exception) {
                 exception.printStackTrace();
                 return null;
             }
  
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
