<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Online MIS</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

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
<script>
$(document).ready(function(){
	  $(".createClass").click(function(){
		 	 var count = $("#noof_works").val(); 
		 	 //alert(count);
			$("#work_table tr").remove();
			
			var sno = 1;
			
			 $('#work_table')
	            .append(
	            '<tr>'
	            + ' <th>S.No</th>'
	            + ' <th>Work Detail</th>'
	            + ' <th>Estimated Cost (in Lakhs)</th>'
	            + '</tr>');
			
			for(var i=1;i<=count;i++){
				$('#work_table')
	            .append(
	            '<tr><td><b>'+ sno +'<b></td>'
	            + '<td>'
	    		+ '<input type="text" name="workDetails" id="work_details"  class="form-control mb-md" />'
	    		+ '</td>'
	    		+ '<td>'
	    		+ '<input type="text" name="cost" id="estimated_cost"  class="form-control mb-md" />'
	    		+ '</td>'
	            +'</tr>');
				sno=sno+1;
			}
			$("#work_table_div").toggle();
	    
	  });
	});

</script>
<body>
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
              <h2 class="section-title">Work Creation</h2>
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
    <c:url value="/worksCreation/save" var="createUrl" />
        <form id="msform" method="post" action="${createUrl}" modelAttribute="workObject">
        
           <input type="hidden" name="${_csrf.parameterName}"
            value="${_csrf.token}" /> 
            
            <!-- fieldsets -->
            <fieldset>
                <h2 class="fs-title">Work Creation</h2>
                <!--<h3 class="fs-subtitle">Tell us something about you</h3>-->  
                
                <ul class="fs-list-details">
                <li><p>Types of Work <span class="red">*</span></p></li>
                <li><select id="typeworkid" name="typeOfWork">
                <option value="" selected="">--Types of Work --</option>
                <option value="New">New</option>
                <option value="upgrade">Upgrade</option>
                <option value="repair">Repair</option>
                </select> 
                </ul>
                
                
                <ul class="fs-list-details">
                <li><p>Nature of work <span class="red">*</span></p></li>
                <li><select id="worknatureid" name="natureOfWork" >
                <option value="" selected="">--select work--</option>
             	 <option value="NTR KVK (Constituency KVKs)">NTR KVK (Constituency KVKs)</option>
             	 <option value="NTR MKVKs">NTR MKVKs</option>
             	 <option value="Modernization Works">Modernization Works</option>
             	 <option value="Regional Academics">Regional Academics</option>
             	 <option value="District Level Sports Complex">District Level Sports Complex</option>
             	 <option value="Swimming Pools">Swimming Pools</option>
             	 <option value="400 mtrs Synthetic Athletic Track">400 mtrs Synthetic Athletic Track</option>
             	 <option value="Water Sports Academies">Water Sports Academies</option>
             	 <option value="Model Sport School at Vizzy Stadium">Model Sport School at Vizzy Stadium</option>
             	 <option value="Twin Synthetic Tennis Courts">Twin Synthetic Tennis Courts</option>
             	 <option value="Wooden Flooring">Wooden Flooring</option>
             	 <option value="Repairs to Swimming Pools">Repairs to Swimming Pools</option>
             	 <option value="Shopping Complex">Shopping Complex</option>
               </select>
               </li>
                </ul>
                
                <!-- <ul class="fs-list-details">
                <li><p>Nature of work <span class="red">*</span></p></li>
                <li><select id="worknatureid" name="natureOfWork" >
                <option value="" selected="">--select work--</option>
             	 <option value="work1">NTR KVK (Constituency KVKs)</option>
             	 <option value="work2">NTR MKVKs</option>
             	 <option value="work3">Modernization Works</option>
             	 <option value="work4">Regional Academics</option>
             	 <option value="work5">District Level Sports Complex</option>
             	 <option value="work6">Swimming Pools</option>
             	 <option value="work7">400 mtrs Synthetic Athletic Track</option>
             	 <option value="work8">Water Sports Academies</option>
             	 <option value="work9">Model Sport School at Vizzy Stadium</option>
             	 <option value="work10">Twin Synthetic Tennis Courts</option>
             	 <option value="work11">Wooden Flooring</option>
             	 <option value="work12">Repairs to Swimming Pools</option>
             	 <option value="work13">Shopping Complex</option>
               </select>
               </li>
                </ul> -->
                
                <ul class="fs-list-details">
                <li><p>District <span class="red">*</span></p></li>
                <li><select id="districtid" name="district" >
                <option value="" selected="">--select district--</option>
                 <c:forEach  var="districts" items="${districts}">
         <option value="${districts.name}">${districts.name}</option>
      </c:forEach>
      
             	<!--  <option value="28">Ananthapuramu</option>
             	 <option value="29">Chitoor</option>
             	 <option value="30">East Godavari</option>
             	 <option value="31">Guntur</option>
             	 <option value="32">Kadapa</option>
             	 <option value="33">Krishna</option>
             	 <option value="34">Kurnool</option>
             	 <option value="35">Nellore</option>
             	 <option value="36">Prakasam</option>
             	 <option value="38">Srikakulam</option>
             	 <option value="39">Visakhapatnam</option>
             	 <option value="40">Vizianagaram</option>
             	 <option value="41">West Godavari</option> -->
               </select>
               </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Constituency <span class="red">*</span></p></li>
                <li>
                
                <select id="constituancyId" name="constituency">
                  <option value="select" selected="" disabled="">--select --</option>
                   <c:forEach  var="constituency" items="${allConstituencs}">
         <option value="${constituency.name}">${constituency.name}</option>
      </c:forEach>
                  
                 <!--  <option value="1">Ichchapuram</option>
                  <option value="2">Palasa</option>
                  <option value="3">Tekkali</option>
                  <option value="4">Pathapatnam</option>
                  <option value="5">Amadalavalasa</option>
                  <option value="6">Kothuru</option>
                  <option value="7">Rajam</option>
                  <option value="8">Narasannapeta</option> -->
              </select>
            </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Mandal <span class="red">*</span></p></li>
                <li>
                <select id="mandalId" name="mandal" class="form-control mb-md">
              <option value="select" selected="" disabled="">--select Mandal--</option>
               <c:forEach  var="mandals" items="${allMandals}">
         <option value="${mandals.name}">${mandals.name}</option>
      </c:forEach>
              
             <!-- 	 <option value="8">Amadalavalasa</option>
             	 <option value="34">Bhamini</option>
             	 <option value="35">Burja</option>
             	 <option value="6">Etcherla</option>
             	 <option value="28">Ganguvarisigadam</option>
             	 <option value="10">Gara</option>
             	 <option value="33">Hiramandalam</option>
             	 <option value="5">Ichchapuram</option>
             	 <option value="23">Kanchili</option>
             	 <option value="13">Kaviti</option>
             	 <option value="15">Kotabommali</option>
             	 <option value="22">Kothuru</option>
             	 <option value="38">Lakshminarsupeta</option>
             	 <option value="21">Laveru</option>
             	 <option value="9">Mandasa</option>
             	 <option value="31">Meliaputti</option>
             	 <option value="29">Nandigam</option>
             	 <option value="12">Narasannapeta</option>
             	 <option value="14">Palakonda</option>
             	 <option value="3">Palasa</option>
             	 <option value="27">Pathapatnam</option>
             	 <option value="24">Polaki</option>
             	 <option value="17">Ponduru</option>
             	 <option value="4">Rajam</option>
             	 <option value="7">Ranastalam</option>
             	 <option value="20">Regidi Amadalavalasa</option>
             	 <option value="19">Santhabommali</option>
             	 <option value="26">Santhakaviti</option>
             	 <option value="32">Saravakota</option>
             	 <option value="37">Sarubujjili</option>
             	 <option value="30">Seethampeta</option>
             	 <option value="11">Sompeta</option>
             	 <option value="2">Srikakulam</option>
             	 <option value="16">Tekkali</option>
             	 <option value="18">Vajrapukothuru</option>
             	 <option value="36">Vangara</option>
             	 <option value="25">Veeraghattam</option> -->
            </select>
            </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Village <span class="red">*</span></p></li>
                <li><select id="villagesId" class="form-control mb-md" name="village">
              <option value="select" selected="" disabled="">--select--</option>
                <c:forEach  var="village" items="${allVillages}">
         <option value="${village.name}">${village.name}</option>
      </c:forEach>
            <!--    <option value="1">Alikam</option>
               <option value="2">Balivada</option>
               <option value="3">Batteru</option>
               <option value="4">Ippili</option> -->
            </select></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Location <span class="red">*</span></p></li>
                <li><input type="text" name="location" placeholder="Work Number"/></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Work Number <span class="red">*</span></p></li>
                <li><input type="text" name="workNo" placeholder="Work Number"></li>
                </ul>
                
                <ul class="fs-list-details fs-list-full">
                <li><p>No. of Works <span class="red">*</span></p></li>
                <li class="work-space"><input type="text" id="noof_works" name="noOfWorks" placeholder="No. of Works">  <input type="button" name="Create" class="create-button createClass" value="Create"></li> 
                </ul>
                
            <div id="work_table_div">
	        <table id="work_table" class=" table table-bordered  table-striped mb-none table_head animated fadeInUp">
	           <!--<tbody>
            	<tr>
                  <th>S.No</th> 
            	  <th>Work Detail</th> 
            	  <th>Estimated Cost (in Lakhs)</th>
            	</tr>
            	<!-- <tr>
            	  <td><b>1</b></td>
                  <td><input type="text" class="form-control mb-md" id="s.no" name="s.no" value=""> </td> 
            	  <td><input type="text" class="form-control mb-md" id="work-details-new" maxlength="10" name="work-details-new"></td>
            	</tr> -->
              </tbody>
            </table>
        </div> 
                
                
                <input type="submit" name="next" class="next action-button float-right" value="Save and Continue"/>
                
                
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
<!-- <script src="/resources/contactform/contactform.js"></script>  -->

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

</body>
</html>
