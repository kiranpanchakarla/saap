<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Line Department</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicons -->
<link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Raleway:400,500i,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Oswald:400,500,600" rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="${pageContext.request.contextPath}/resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Libraries CSS Files -->
<link href="${pageContext.request.contextPath}/resources/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/lib/animate/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Main Stylesheet File -->
<link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet">
</head>

<body>

<!--==========================
    Header
  ============================-->
<header id="header">
  <div class="container social-links">
    <div class="social-links"> 
    <a target="_blank" href="https://www.facebook.com/SportsAuthorityAP/" class="facebook"><i class="fa fa-facebook"></i></a> 
    <a target="_blank" href="https://twitter.com/SportsinAP" class="twitter"><i class="fa fa-twitter"></i></a> 
    <a target="_blank" href="https://www.instagram.com/sports_authority_ap/" class="instagram"><i class="fa fa-instagram"></i></a> 
    <a target="_blank" href="https://www.linkedin.com/company/sports-authority-of-ap/" class="linkedin"><i class="fa fa-linkedin"></i></a> 
    <a target="_blank" href="https://www.youtube.com/channel/UCy3mdgAFCimIxl60stdXopQ" class="youtube"><i class="fa fa-youtube"></i></a> </div>
  </div>
  <div class="container-fluid">
    <div id="logo" class="pull-left">
      <h1><a href="index.html"><img src="img/logo.png" alt="" title="" /></a></h1>
    </div>
    <nav id="nav-menu-container">
      <ul class="nav-menu">
        <li><a href="index.html">Home</a></li>
        <li><a href="about-us.html">About</a></li>
        <li class="menu-has-children"><a href="facilities.html">Facilities</a>
        <ul>
              <li><a href="stadiums-inout-door.html">Stadiums (Indoor / Outdoor)</a></li>
              <li><a href="pools.html">Pools</a></li>
              <li><a href="sports-schools.html">Sports Schools</a></li>
              <li><a href="kvk-indoor.html">KVK’s (Playfields / Indoor / Pavilion Building)</a></li>
              <li><a href="regional.html">Regional Academies</a></li>
              <li><a href="water-sports.html">Water Sports Academies</a></li>
              <li><a href="distric-sports.html">District Sports Complexes</a></li>
              <li><a href="shopping.html">Shopping Complexes</a></li>
            </ul>
        </li>
        <li class="menu-has-children"><a href="schemes.html">Schemes</a>
        <ul>
              <li><a href="pay-play.html">Pay and Play</a></li>
              <li><a href="khelo-india.html">KHELO INDIA</a></li>
              <li><a href="day-borders.html">Day Borders & Nurseries</a></li>
              <li><a href="gaandiva.html">Gaandiva</a></li>
            </ul>
        </li>
        <li><a href="notifications.html">Notifications</a></li>
        <li><a href="gallery.html">Gallery</a></li>
        <li class="menu-has-children"><a href="associations.html">Associations</a>
        <ul>
              <li><a href="coaches.html">Coaches</a></li>
              <li><a href="http://34.216.29.65:8080/" target="_blank">AP Associations Data</a></li>
            </ul>
        </li>
        <li class="menu-has-children"><a href="infrastructure.html">Infrastructure</a>
        <ul>
              <li><a href="stadiums.html">Stadiums</a></li>
              <li><a href="sports-schools.html">Sports Schools</a></li>
            </ul>
        </li>
        <li class="menu-active"><a href="online-mis.html">Online Mis</a></li>
        <li><a href="feedback.html">Feedback</a></li>
        <li><a href="contact.html">Contact Us</a></li>
        <li><a href="stadium.html">Stadia Booking</a></li>
      </ul>
    </nav>
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
              <h2 class="section-title">Linking with Line Department</h2>
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
  
  <section id="contact" class="section-bg-con">
    <div class="container">
    
    <div class="row">
    <div class="col-md-12">
        <form id="msform" method="post" action="lineDepartment" modelAttribute="lineDeptObj">
           
            
            <!-- fieldsets -->
            <fieldset>
            <div class="fs-list-full"> 
                <h2 class="fs-title">Linking with Line Department</h2>
                
                <ul class="fs-list-details">
                <li><p>Name of Department <span class="red">*</span></p></li>
                <li><input type="text" name="departmentName" placeholder="Name of Department"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Nature of work <span class="red">*</span></p></li>
                <li><input type="text" name="workNature" placeholder="Nature of work"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Circle <span class="red">*</span></p></li>
                <li><input type="text" name="circle" placeholder="Circle"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Name of the Division <span class="red">*</span></p></li>
                <li><select id="divisionId" name="divisionName">
       				<option value="" selected="" disabled="">--select division--</option>
			 		<option value="SRIKAKULAM">PIU DIVISION SRIKAKULAM</option>
			 		<option value="TEKKALI">PIU DIVISION TEKKALI</option>
			 		<option value="PALAKONDA">PR DIVISION PALAKONDA</option>
      				</select></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Name of the SubDivision <span class="red">*</span></p></li>
                <li>
                <select id="subdivisionId" name="subdivisionName" class="form-control mb-md">
               <!--  <option value="" selected="" disabled="">--select subdivision--</option> -->
                <option value="" selected="" disabled="">--select subdivision--</option>
                <option value="SRIKAKULAM">PIU DIVISION SRIKAKULAM</option>
			 	<option value="TEKKALI">PIU DIVISION TEKKALI</option>
			 	<option value="PALAKONDA">PR DIVISION PALAKONDA</option>
                </select>
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Name of the Section <span class="red">*</span></p></li>
                <li>
                <select id="sectionId" name="sectionName" class="form-control mb-md">
                <option value="" selected="" disabled="">--select section--</option>
                <option value="SRIKAKULAM">PIU DIVISION SRIKAKULAM</option>
			 	<option value="TEKKALI">PIU DIVISION TEKKALI</option>
			 	<option value="PALAKONDA">PR DIVISION PALAKONDA</option>
                </select>
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Name of the Section officer <span class="red">*</span></p></li>
                <li>
                <input type="text" name="sectionOfficerName" placeholder="Name of the Section officer">
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Mobile No <span class="red">*</span></p></li>
                <li>
                <input type="text" class="numberId form-control mb-md" id="mobileNo" name="mobileNo" maxlength="10">
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Email Id <span class="red">*</span></p></li>
                <li>
                <input type="text" class="form-control mb-md" id="emailId" name="email">
                </li>
                </ul>
                
                
                </div>
                <input type="submit" name="next" class="next action-button" value="Save and Continue">
                
            </fieldset>
        </form>
        
    </div>
</div>
<!-- /.MultiStep Form -->
    

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
        <a target="_blank" href="https://www.facebook.com/SportsAuthorityAP/" title="Facebook">
        <i class="fa fa-facebook"></i></a> 
        <a target="_blank" href="https://twitter.com/SportsinAP" title="Twitter">
        <i class="fa fa-twitter"></i></a> 
        <a target="_blank" href="https://www.instagram.com/sports_authority_ap/" href="#" title="Instagram">
        <i class="fa fa-instagram"></i></a> 
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

<!-- JavaScript Libraries --> 
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

<script>

//jQuery time
var current_fs, next_fs, previous_fs; //fieldsets
var left, opacity, scale; //fieldset properties which we will animate
var animating; //flag to prevent quick multi-click glitches

$(".next").click(function(){
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	next_fs = $(this).parent().next();
	
	//activate next step on progressbar using the index of next_fs
	$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
	
	//show the next fieldset
	next_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale current_fs down to 80%
			scale = 1 - (1 - now) * 0.2;
			//2. bring next_fs from the right(50%)
			left = (now * 50)+"%";
			//3. increase opacity of next_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({
        'transform': 'scale('+scale+')',
        'position': 'absolute'
      });
			next_fs.css({'left': left, 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});

$(".previous").click(function(){
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	previous_fs = $(this).parent().prev();
	
	//de-activate current step on progressbar
	$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
	
	//show the previous fieldset
	previous_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale previous_fs from 80% to 100%
			scale = 0.8 + (1 - now) * 0.2;
			//2. take current_fs to the right(50%) - from 0%
			left = ((1-now) * 50)+"%";
			//3. increase opacity of previous_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'left': left});
			previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});

$(".submit").click(function(){
	return false;
})

$(document).ready(function(){
  $(".create-button").click(function(){
    $("#work_table_div").toggle();
  });
});

</script>
</body>
</html>
