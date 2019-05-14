<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Tendering Process</title>
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
              <h2 class="section-title">Tendering Process</h2>
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
    <form id="msform" method="post" action="tenderingProcess" modelAttribute="tenderingProcessObj">
      <%--    <fieldset>
            <div class="fs-list-full"> 
                <h2 class="fs-title">Tendering Process</h2>
                
                <ul class="fs-list-details">
                <li><p>Work <span class="red">*</span></p></li>
                <li><input type="text" name="workName" class="form-control mb-md" readonly value="${workInfo.workDetails}"></li>
               </ul>
               <input type="hidden" name="workId"  readonly value="${workInfo.id}">
               <ul class="fs-list-details">
                <li><p>Work Number <span class="red">*</span></p></li>
                <li><input type="text" name="workNumber" class="form-control mb-md" readonly value="${workInfo.workNo}"></li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Date of Preparation of IFB<span class="red">*</span></p></li>
                <li><input type="text" id="ifbPreperationDate" name="ifbPreperationDate" class="form-control mb-md hasDatepicker" placeholder="DD/MM/YYYY">
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Tender Notice Number<span class="red">*</span></p></li>
                <li><input type="text" id="tenderNoticeNumber" name="tenderNoticeNumber" class="form-control mb-md">
				 
               </li>
               </ul>
               
                 <ul class="fs-list-details">
                <li><p>Tender Notice Issued date   <span class="red">*</span></p></li>
                <li><input type="text" id="tenderNoticeIssuedDate" name="tenderNoticeIssuedDate" class="form-control mb-md hasDatepicker" placeholder="DD/MM/YYYY">
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Notice issuing authorities (SE/CE/ENC)  <span class="red">*</span></p></li>
                <li><select name="noticeIssuingAuthorities" class="form-control mb-md" id="noticeIssuingAuthorities">
                           <option value=""> -- please select -- </option>
                           <option>SE</option>
                           <option>CE</option>
                           <option>ENC</option>
                             <option>EE</option>
                          </select>
						   
               </li>
               </ul>
                
                </div>
                
            </fieldset> --%>
            
               <!-- fieldsets -->
            <fieldset>
            <div class="fs-list-full"> 
                <h2 class="fs-title">Tendering Process</h2>
                
                <ul class="fs-list-details">
                <li><p>Work <span class="red">*</span></p></li>
                <li><input type="text" name="workName" class="form-control mb-md" readonly value="${workInfo.workDetails}">
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Work Number <span class="red">*</span></p></li>
                <li><input type="text" name="workNumber" class="form-control mb-md" readonly value="${workInfo.workNo}"></li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Date of Preparation of IFB<span class="red">*</span></p></li>
                <li><input type="text" id="ifbPreperationDate" name="ifbPreperationDate" class="form-control mb-md hasDatepicker" placeholder="DD/MM/YYYY">
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Tender Notice Number<span class="red">*</span></p></li>
                <li><input type="text" id="tenderNoticeNumber" name="tenderNoticeNumber" class="form-control mb-md">
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Tender Notice Issued date   <span class="red">*</span></p></li>
                <li><input type="text" id="tenderNoticeIssuedDate" name="tenderNoticeIssuedDate" class="form-control mb-md hasDatepicker" placeholder="DD/MM/YYYY">
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Notice issuing authorities (SE/CE/ENC)  <span class="red">*</span></p></li>
                <li><select name="noticeIssuingAuthorities" class="form-control mb-md" id="noticeIssuingAuthorities">
                           <option value=""> -- please select -- </option>
                           <option>SE</option>
                           <option>CE</option>
                           <option>ENC</option>
                             <option>EE</option>
                          </select>
               </li>
               </ul>
                
                </div>
                
                
            </fieldset>
            
             <fieldset>
               <div class="fs-list-full"> 
                <h2 class="fs-title">Publication in News Paper</h2>
                
                <ul class="fs-list-details">
                <li><p>English Newspaper name </p></li>
                <li><input type="text" name="englishNewspaperName" id="englishNewspaperName" class="charcterId form-control mb-md">
               </li>
               </ul>
               
                  <ul class="fs-list-details">
                <li><p>Date </p></li>
                <li><input name="engNewsPaperDate" id="engNewsPaperDate" class="form-control mb-md hasDatepicker" placeholder="DD/MM/YYYY">
               </li>
               </ul>
               
                 <ul class="fs-list-details">
                <li><p>soft copy upload - English (pdf/jpg/png) </p></li>
                <li><input type="file" name="englishPaperCopyLocation" id="englishPaperCopyLocationFile" class="form-control mb-md">
               </li>
               </ul>
                                           
               
               <ul class="fs-list-details">
                <li><p>Telugu Newspaper name </p></li>
                <li><input type="text" name="teluguNewspaperName" id="teluguNewspaperName" class="charcterId form-control mb-md">
               </li>
               </ul>
               
                <ul class="fs-list-details">
                <li><p>Date </p></li>
                <li><input name="telNewspaperDate" id="telNewspaperDate" class="form-control mb-md hasDatepicker" placeholder="DD/MM/YYYY">
               </li>
               </ul>
               
            
                 <ul class="fs-list-details">
                <li><p>soft copy upload - Telugu (pdf/jpg/png)</p></li>
                <li><input type="file" name="teluguPaperCopyLocation" id="teluguPaperCopyLocationFile" class="form-control mb-md">
               </li>
               </ul>
               
                 <ul class="fs-list-details">
                <li><p>Bid Start Date</p></li>
                <li><input type="text" name="bidStrartDate" id="bidStrartDate" class="form-control mb-md hasDatepicker" placeholder="DD/MM/YYYY">
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Bid Closing Date</p></li>
                <li><input type="text" name="bidClosingDate" id="bidClosingDate" class="form-control mb-md hasDatepicker" placeholder="DD/MM/YYYY">
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Bid Opening Date </p></li>
                <li><input type="text" name="bidOpeningDate" id="bidOpeningDate" class="form-control mb-md hasDatepicker" placeholder="DD/MM/YYYY">
               </li>
               </ul>
               
                
              
               <ul class="fs-list-details">
                <li><p>No of Bids received through Online</p></li>
                <li><input type="text" name="bidsReceived"  class="numberId form-control mb-md" id="bidsReceived">
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>No of Bidders Submitted Hard Copy</p></li>
                <li><input type="text" name="hardCopiesSubmitted"  class="numberId form-control mb-md" id="hardCopiesSubmitted">
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>No of Bids qualified for Opening of Price Bid</p></li>
                <li><input type="text" name="bidsForPriceBid"  class="numberId form-control mb-md" id="noofBidsQualified">
               </li>
               </ul>
               
                <ul class="fs-list-details">
                <li><p>Date of Evaluation Completed</p></li>
                <li><input type="text"  id="dateOfEvaluationCompleted" name="dateOfEvaluationCompleted" class="form-control mb-md hasDatepicker" placeholder="DD/MM/YYYY">
               </li>
               </ul>
               
             
               
               <ul class="fs-list-details">
                <li><p>Estimated Contract Value (in Rs.)</p></li>
                <li><input type="text"  id="contractValue" name="contractValue" class="form-control mb-md" >
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Contract Value quoted By L1 Bidder</p></li>
                <li><input type="text" id="contractValueByL1Bidder"  name="contractValueByL1Bidder" maxlength="10" class="form-control mb-md" >
               </li>
               </ul>
               
                  <ul class="fs-list-details">
                <li><p>Percentage quoted Less / Excess</p></li>
                <li><input type="text"  id="percentageQuoted" name="percentageQuoted" class="charcterId form-control mb-md">
               </li>
               </ul>
               
                   <ul class="fs-list-details fs-list-full">
                <li><p>Check Bid Status</p></li>
                <li><p><input type="radio" checked="checked" name="bidStatus" value="In Process">In Process</p>
                <p><input type="radio" name="bidStatus"  value="Bid Accepted">Bid Accepted</p>
                <p><input type="radio" name="bidStatus"  value="Bid Rejected">Bid Rejected</p>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Date of LOA Issued to Contractor</p></li>
                <li><input type="text" name="dateOfLoaIssued" id="dateOfLoaIssued"  class="form-control mb-md hasDatepicker" placeholder="DD/MM/YYYY">
               </li>
               </ul>
               
               
              <!-- <ul class="fs-list-details">
                <li><p> Name of the agency <span class="red">*</span> </p></li>
                <li><select id="agencyName" name="angencyName" class="form-control mb-md">
                     <option disabled="" selected="" value="0"> -- select contractor -- </option>
			              <option value="9">M/s Sundeep Ravindra Engineers and Contractors</option>
			              <option value="11">M/s GDR Infratech formerly M/s Dorayya &amp; co</option>
			              <option value="13">M/s Vinayaka Constructions, Ubalanka</option>
			              <option value="42">M/s Jakson Limited in JV with M/s Jakson Engineers Limited</option>
			              <option value="35">M/s Sri Maruthi Constructions</option>
			              <option value="15">Sri G. Hemanth Reddy</option>
			              <option value="10">M/S G R CONSTRUCTIONS</option>
			              <option value="25">M/s Sri Srinivasa Constructions  Alwar Street Bobbili VZNM Dist.</option>
			              <option value="37">Sri. K. Sekhar Babu</option>
			              <option value="23">M/S IR Constructions</option>
			              <option value="20">A.Kasivisweswara Rao</option>
			              <option value="19">NSN Reddy&amp;Co</option>
			              <option value="5">P Nageswara Rao</option>
			              <option value="8">M/s Ramanaiah Constructions</option>
			              <option value="43">Sri G. Hemanth Reddy of Tirupati</option>
			              <option value="36">M/s Vyshno Construction</option>
			              <option value="21">T.Ramakrishna Raju</option>
			              <option value="31">M/s Sri Rajyalakshmi Constructions</option>
			              <option value="45">M/S GRG Projects</option>
			              <option value="27">M/s K.L.R. Constructions of Rajahmundry</option>
			              <option value="24">M/s K.S.R. Constructions of Srikakulam</option>
			              <option value="12">P Satyanarayana Reddy</option>
			              <option value="3">A Kasivisweswara Rao</option>
			              <option value="34">M/s Kalyani Constructions</option>
			              <option value="41">N.CH. Pulla Rao</option>
			              <option value="38">Sri. K. Jagannadham</option>
			              <option value="18">M/s Larsen &amp; Toubro Limited, Chennai</option>
			              <option value="1">M/s SVS Mookambika Constructions Pvt. Ltd.,</option>
			              <option value="29">M/s Sri Shiridi Sai Balaji Constructions of Srikakulam</option>
			              <option value="14">M Anjaneya Reddy</option>
			              <option value="46">Sri G.Chinnam Naidu Special Class ( Civil) Contractor </option>
			              <option value="44">M/s Tirumala Constructions</option>
			              <option value="7">T Rama krishna Raju</option>
			              <option value="17">M/s Vijai Electricals Limited, Hyderabad</option>
			              <option value="28">M/s IR Constructions of Visakhapatnam</option>
			              <option value="33">M/s Vijayalakshmi Constructions of Srikakulam</option>
			              <option value="4">M/s Sri Venkateswara Constructions</option>
			              <option value="40">Srinivasa Infrastructure Private Ltd.</option>
			              <option value="39">M/s Srinivasareddy Constructions</option>
			              <option value="26">M/s K.A.Prasada Raju, Special Class  Civil Contractor </option>
			              <option value="22">M/S Blossom Infraventures Pvt Ltd Hyderabad</option>
			              <option value="6">K Koteswara Reddy</option>
			              <option value="32">M/s Srinivasa Edifice Private Limited of Vijayawada</option>
			              <option value="16">M/s Bhavani Constructions</option>
                     </select>
               </li>
               </ul> -->
               <ul class="fs-list-details">
                <li><p> Name of the agency <span class="red">*</span> </p></li>
                <li><select id="agencyName" name="angencyName" class="form-control mb-md">
                     <option disabled="" selected="" value="0"> -- select contractor -- </option>
			              <option value="M/s Sundeep Ravindra Engineers and Contractors">M/s Sundeep Ravindra Engineers and Contractors</option>
			              <option value="M/s GDR Infratech formerly M/s Dorayya & co">M/s GDR Infratech formerly M/s Dorayya &amp; co</option>
			              <option value="M/s Vinayaka Constructions, Ubalanka">M/s Vinayaka Constructions, Ubalanka</option>
			              <option value="M/s Jakson Limited in JV with M/s Jakson Engineers Limited">M/s Jakson Limited in JV with M/s Jakson Engineers Limited</option>
			              <option value="M/s Sri Maruthi Constructions">M/s Sri Maruthi Constructions</option>
			              <option value="Sri G. Hemanth Reddy">Sri G. Hemanth Reddy</option>
			              <option value="M/S G R CONSTRUCTIONS">M/S G R CONSTRUCTIONS</option>
			              <option value="M/s Sri Srinivasa Constructions  Alwar Street Bobbili VZNM Dist.">M/s Sri Srinivasa Constructions  Alwar Street Bobbili VZNM Dist.</option>
			              <option value="Sri. K. Sekhar Babu">Sri. K. Sekhar Babu</option>
			              <option value="M/S IR Constructions">M/S IR Constructions</option>
			              <option value="A.Kasivisweswara Rao">A.Kasivisweswara Rao</option>
			              <option value="NSN Reddy & Co">NSN Reddy&amp;Co</option>
			              <option value="P Nageswara Rao">P Nageswara Rao</option>
			              <option value="M/s Ramanaiah Constructions">M/s Ramanaiah Constructions</option>
			              <option value="Sri G. Hemanth Reddy of Tirupati">Sri G. Hemanth Reddy of Tirupati</option>
			              <option value="M/s Vyshno Construction">M/s Vyshno Construction</option>
			              <option value="T.Ramakrishna Raju">T.Ramakrishna Raju</option>
			              <option value="M/s Sri Rajyalakshmi Constructions">M/s Sri Rajyalakshmi Constructions</option>
			              <option value="M/S GRG Projects">M/S GRG Projects</option>
			              <option value="M/s K.L.R. Constructions of Rajahmundry">M/s K.L.R. Constructions of Rajahmundry</option>
			              <option value="M/s K.S.R. Constructions of Srikakulam">M/s K.S.R. Constructions of Srikakulam</option>
			              <option value="P Satyanarayana Reddy">P Satyanarayana Reddy</option>
			              <option value="A Kasivisweswara Rao">A Kasivisweswara Rao</option>
			              <option value="M/s Kalyani Constructions">M/s Kalyani Constructions</option>
			              <option value="N.CH. Pulla Rao">N.CH. Pulla Rao</option>
			              <option value="Sri. K. Jagannadham">Sri. K. Jagannadham</option>
			              <option value="M/s Larsen & Toubro Limited, Chennai">M/s Larsen &amp; Toubro Limited, Chennai</option>
			              <option value="M/s SVS Mookambika Constructions Pvt. Ltd.,">M/s SVS Mookambika Constructions Pvt. Ltd.,</option>
			              <option value="M/s Sri Shiridi Sai Balaji Constructions of Srikakulam">M/s Sri Shiridi Sai Balaji Constructions of Srikakulam</option>
			              <option value="M Anjaneya Reddy">M Anjaneya Reddy</option>
			              <option value="Sri G.Chinnam Naidu Special Class ( Civil) Contractor">Sri G.Chinnam Naidu Special Class ( Civil) Contractor </option>
			              <option value="M/s Tirumala Constructions">M/s Tirumala Constructions</option>
			              <option value="T Rama krishna Raju">T Rama krishna Raju</option>
			              <option value="M/s Vijai Electricals Limited, Hyderabad">M/s Vijai Electricals Limited, Hyderabad</option>
			              <option value="M/s IR Constructions of Visakhapatnam">M/s IR Constructions of Visakhapatnam</option>
			              <option value="M/s Vijayalakshmi Constructions of Srikakulam">M/s Vijayalakshmi Constructions of Srikakulam</option>
			              <option value="M/s Sri Venkateswara Constructions">M/s Sri Venkateswara Constructions</option>
			              <option value="Srinivasa Infrastructure Private Ltd.">Srinivasa Infrastructure Private Ltd.</option>
			              <option value="M/s Srinivasareddy Constructions">M/s Srinivasareddy Constructions</option>
			              <option value="M/s K.A.Prasada Raju, Special Class  Civil Contractor">M/s K.A.Prasada Raju, Special Class  Civil Contractor </option>
			              <option value="M/S Blossom Infraventures Pvt Ltd Hyderabad">M/S Blossom Infraventures Pvt Ltd Hyderabad</option>
			              <option value="K Koteswara Reddy">K Koteswara Reddy</option>
			              <option value="M/s Srinivasa Edifice Private Limited of Vijayawada">M/s Srinivasa Edifice Private Limited of Vijayawada</option>
			              <option value="M/s Bhavani Constructions">M/s Bhavani Constructions</option>
			          
                     </select>
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
<script src="contactform/contactform.js"></script> 

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
