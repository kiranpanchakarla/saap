<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Poppins:400,500,600&display=swap" rel="stylesheet">

</head>
<body>
<!--==========================
    Header
  ============================-->
<header id="header">
   <div class="container social-links">
   <div class="main-header"><h1>Sports Authority Of Andhra Pradesh
   <span>(Works Management System)</span></h1></div>
    
  </div>
   <div class="container-fluid">
      <div id="logo" class="pull-left">
        <h1><a href=""><img src="<c:url value="/resources/img/logo.png" />" alt="" title="" /></a></h1>
      </div>
    <nav id="nav-menu-container">
      <ul class="nav-menu">
         <li><a href="<c:url value="/adminloggedin"/>">Home</a></li>
         <c:if test="${userRole eq 'ROLE_ADMIN'}">
	         <%-- <li><a href="<c:url value="/worksCreation/create?source=newWork"/>">New Work Creation</a></li>
	         <li><a href="<c:url value="/workApprovals/pending"/>">Work Approval</a></li> --%>
	         <li class="nav-item dropdown">
        		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         		Works
       			 </a>
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		          <a class="dropdown-item" href="<c:url value="/worksCreation/create?source=newWork"/>">New Work Creation</a>		          
		          <a class="dropdown-item" href="<c:url value="/workApprovals/pending"/>">Work Approval</a>		          
		          <a class="dropdown-item" href="<c:url value="/work"/>">All Works</a>
		        </div>
      		</li>	         	         	       
         </c:if>
                  
        <li><a href="<c:url value="/logout"/>">Logout</a></li>
      </ul>
    </nav>
    <!-- #nav-menu-container --> 
  </div>
</header>
<!-- #header --> 

</body>
</html>