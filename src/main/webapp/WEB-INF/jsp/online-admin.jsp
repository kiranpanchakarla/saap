<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Online Admin</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
</head>

<body>
<!--=== Header ====-->
<!--==========================
    Header
  ============================-->
<header id="header">
   <div class="container social-links">
   <div class="main-header"><h1>Sports Authority Of Andhra Pradesh
   <span>(Works management system)</span></h1></div>
    
  </div>
   <div class="container-fluid">
      <div id="logo" class="pull-left">
        <h1><a href=""><img src="<c:url value="/resources/img/logo.png" />" alt="" title="" /></a></h1>
      </div>
    <nav id="nav-menu-container">
     <%--  <ul class="nav-menu">
         <li><a href="<c:url value="/adminloggedin"/>">Home</a></li>
        <li><a href="<c:url value="/logout"/>">Logout</a></li>
      </ul> --%>
    </nav>
    <!-- #nav-menu-container --> 
  </div>
</header>
<!-- #header --> 


<!--==========================
    Intro Section
  ============================-->
<!-- <section id="intro-inner">
   <div class="page-header">
    <section id="page-title" class="parralax">
      <div class="container rel">
        <div class="row">
          <div class="col-md-12">
            <div class="text-center">
              <h2 class="section-title">Admin login</h2>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</section> -->
<!-- #intro -->

<main id="main"> 
  
   <!--==========================
      Contact Us Section
    ============================-->
  
  <section id="contact" class="section-bg-con wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
    <div class="container">
    <div class="row">
    <div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
      <h5 class="highlight text-center text-uppercase">Login</h5>
    </div>

    <!-- Login Form -->
    <form method="post" action="<c:url value='j_spring_security_check'/>">
      <input type="text" id="login" class="fadeIn second" name="username" placeholder="username">
	  	<br><span id="uError" style="color:red;"></span>  		
      <input type="password" class="fadeIn third" name="password" id="password" placeholder="password">
      	<br><span id="pError" style="color:red;"></span><br>
      <input type="submit" id="submit" name="submit" class="fadeIn fourth" value="Log In" >
<!--       onsubmit="return validateForm()" -->

     <input type="hidden" name="${_csrf.parameterName}"
            value="${_csrf.token}" />
    </form>
    
  <c:if test="${not empty error}">
           <span style="color:red;">Invalid Credentials! </span>
    </c:if>
	<c:if test="${not empty sessionTimeout}">
  		<span style="color:red;">Session Timeout</span>
	</c:if>

    <!-- Remind Passowrd -->
    <div id="formFooter">
       <!-- <a class="underlineHover" href="#">Forgot Password?</a> -->
      
       <c:url value="/userCreation" var="createUrl" />
       <a class="underlineHover" href="${createUrl}">New user? Register here</a>
    </div>

  </div>
</div>
    
    </div>
    </div>
  </section>
    
  <!-- #contact --> 
  
</main>

<!--=== Footer ====-->
<jsp:include page="online-mis-footer.jsp" />

<script type="text/javascript">
$(document).ready(function(){
});
		 
 $('#submit').click(function(){
		
	 if(($('#login').val() != '' ) && ($('#password').val() != '') ) {	 
		 $('#uError').text("");
		 $('#pError').text("");		 
	    	return true;
	    }
	       
 	    if($('#login').val() == '') {
	    	$("#uError").text("Enter Username");
	    	$("#login").focus();
	     
	    	if($('#password').val() == '') {
	    		$("#pError").text("Enter Password");
			}
	    	if($('#password').val() != '') {
		    	$('#pError').text("");
		    }
	        return false;
	    } 
	    
	    if($('#password').val() == '') {
	    	$("#pError").text("Enter Password");
	    	$("#password").focus();
		    
	    	if($('#login').val() != '') {
		    	$('#uError').text("");
		    }
	        return false;
	    }

	});
 
</script>
</body>
</html>
