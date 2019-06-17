<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Online Admin</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicons -->
<link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon"> 
<%-- <link rel="icon" href="<c:url value='/resources/img/favicon.png'/>"/> --%>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Raleway:400,500i,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Oswald:400,500,600" rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="${pageContext.request.contextPath}/resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
<%-- <link rel="stylesheet" href="<c:url value='lib/bootstrap/css/bootstrap.min.css'/>"/> --%>

<!-- Libraries CSS Files -->
<link href="${pageContext.request.contextPath}/resources/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/lib/animate/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Main Stylesheet File -->
<!-- <link href="/resources/css/style.css" rel="stylesheet"> -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css"/>
</head>

<body>

<!--==========================
    Header
  ============================-->
<header id="header">
   
  <div class="container-fluid">
    <div id="logo" class="pull-left">
      <h1><a href="index.html"><img src="img/logo.png" alt="" title="" /></a></h1>
    </div>
     
    <!-- #nav-menu-container --> 
  </div>
</header>
<!-- #header --> 

<!--==========================
    Intro Section
  ============================-->
<section id="intro-inner">
  <div class="page-header">
    <section id="page-title" class="parralax">
      <div class="container rel">
        <div class="row">
          <div class="col-md-12">
            <div class="text-center">
              <h2 class="section-title">Error</h2>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</section>
<!-- #intro -->

<main id="main"> 
  
   <!--==========================
      Contact Us Section
    ============================-->
  
  <section id="contact" class="section-bg-con wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
    <div class="container">
    <div class="row">
    <div class="wrapper fadeInDown">
  <div id="formContent" style="max-width: 900px !important;">
    <!-- Tabs Titles -->

    <!-- Icon -->
    
     <div class="fadeIn first">
       <h5 class="highlight text-center text-uppercase">Message : ${errorMsg}</h5>
        <h5 class="highlight text-center text-uppercase">Contact : help.manuh@gmail.com</h5>
    </div>
     
  </div>
</div>
    
    </div>
    </div>
  </section>

 
  
    
  <!-- #contact --> 
  
</main>

<!--==========================
    Footer
  ============================-->
<footer id="footer">
  <div class="footer-connect">
    <div class="container">
      <div class="footer-social">
        <label class="font-heading" for="">Follow us</label>
        <a target="_blank" href="https://www.facebook.com/SportsAuthorityAP/" title="Facebook"><i class="fa fa-facebook"></i></a> <a target="_blank" href="https://twitter.com/SportsinAP" title="Twitter"><i class="fa fa-twitter"></i></a> 
        <a target="_blank" href="https://www.instagram.com/sports_authority_ap/" href="#" title="Instagram"><i class="fa fa-instagram"></i></a> 
        <a target="_blank" href="https://www.linkedin.com/company/sports-authority-of-ap/" href="#" title="Linkedin"><i class="fa fa-linkedin-square"></i></a> 
        <a target="_blank" href="https://www.youtube.com/channel/UCy3mdgAFCimIxl60stdXopQ" href="#" title="Youtube"><i class="fa fa-youtube"></i></a></div>
    </div>
  </div>
  <div class="footer-top">
    <div class="container">
      <div class="row">
        <div class="col-lg-3 col-md-6 footer-info">
          <h4>Know more about Us</h4>
          <p>Sports Authority of Andhra Pradesh is an Apex body for Promotion of Sports in the state. SAAP is implementing the Sports development programs, Schemes of Govt. of India / SAI, besides Construction / Maintenance of Stadia, Establishment / Sports Authority of India.</p>
        </div>
        <div class="col-lg-3 col-md-6 footer-links">
          <h4>Company </h4>
          <ul>
            <li> <a href="index.html">Home</a></li>
            <li> <a href="about-us.html">About us</a></li>
            <li> <a href="online-mis.html">Online Mis</a></li>
            <li> <a href="feedback.html">Feedback</a></li>
            <li> <a href="contact.html">Contact Us</a></li>
          </ul>
        </div>
        <div class="col-lg-3 col-md-6 footer-contact">
          <h4>Our location</h4>
          <div class="contact-info-box">
            <div class="contact-info-item">
              <div class="contact-text"><i class="fa fa-map-marker"></i></div>
              <div class="contact-value">Bandar Road, Labbipet, Vijayawada- 520010,
                INDIRA GANDHI MUNICIPAL CORPORATION (IGMC) STADIUM</div>
            </div>
            <div class="contact-info-item">
              <div class="contact-text"><i class="fa fa-phone"></i></div>
              <div class="contact-value">0866 - 2499699</div>
            </div>
            <div class="contact-info-item">
              <div class="contact-text"><i class="fa fa-envelope"></i></div>
              <div class="contact-value"><a href="sportsinap@gmail.com">sportsinap@gmail.com</a></div>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 footer-newsletter">
          <h4>Business Hours</h4>
          <div class="contact-info-box">
            <p>Our support available to help you 24 hours a day, seven days a week.</p>
            <ul class="hours">
              <li>Monday-Friday: <span>9am to 5pm</span></li>
              <li>Saturday: <span>10am to 2pm</span></li>
              <li>Sunday: <span>Closed</span></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="copyright"> &copy; copyright © 2019 <strong>Sports Authority of Andhra Pradesh</strong> . All rights reserved. </div>
  </div>
</footer>
<!-- #footer --> 

<a href="#" class="back-to-top"><i class="fa fa-angle-double-up"></i></a>
<div id="preloader"></div>

<!-- JavaScript /resource/libraries --> 
<script src="${pageContext.request.contextPath}/resources/lib/jquery/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/lib/jquery/jquery-migrate.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/lib/bootstrap/js/bootstrap.bundle.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/lib/easing/easing.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/lib/superfish/hoverIntent.js"></script> 
<script src="${pageContext.request.contextPath}/resources/lib/superfish/superfish.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/lib/wow/wow.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/lib/waypoints/waypoints.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/lib/counterup/counterup.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/lib/isotope/isotope.pkgd.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/lib/lightbox/js/lightbox.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/lib/touchSwipe/jquery.touchSwipe.min.js"></script> 
<!-- Contact Form JavaScript File --> 
 

<!-- Template Main Javascript File --> 
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
