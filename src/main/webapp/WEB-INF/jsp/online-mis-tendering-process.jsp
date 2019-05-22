<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Tendering Process</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
</head>

<body>

<!--=== Header ====-->
<jsp:include page="online-mis-header.jsp" />
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
            <!-- fieldsets -->
            <fieldset>
            <div class="fs-list-full"> 
                <h2 class="fs-title">Tendering Process</h2>
                
                <ul class="fs-list-details">
                <li><p>Work <span class="red">*</span></p></li>
                <li><input type="text" id="workName" name="workName" class="form-control mb-md" readonly value="${workInfo.workDetails}">
                <span id="workNameErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Work Number <span class="red">*</span></p></li>
                <li><input type="text" id="workNumber" name="workNumber" class="form-control mb-md" readonly value="${workInfo.workNo}">
                <span id="workNumberErr" class="errors" style="color:red;float:right;"></span>
                </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Date of Preparation of IFB<span class="red">*</span></p></li>
                <li><input type="date" id="ifbPreperationDate" name="ifbPreperationDate" class="form-control mb-md hasDatepicker" placeholder="DD/MM/YYYY">
                <span id="ifbPreperationDateErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Tender Notice Number<span class="red">*</span></p></li>
                <li><input type="text" id="tenderNoticeNumber" name="tenderNoticeNumber" class="form-control mb-md" placeholder="Tender Notice Number">
                <span id="tenderNoticeNumberErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Tender Notice Issued date   <span class="red">*</span></p></li>
                <li><input type="date" id="tenderNoticeIssuedDate" name="tenderNoticeIssuedDate" class="form-control mb-md hasDatepicker" placeholder="DD/MM/YYYY">
               <span id="tenderNoticeIssuedDateErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Notice issuing authorities (SE/CE/ENC)  <span class="red">*</span></p></li>
                <li>                                          
                 <select id="noticeIssuingAuthorities" name="noticeIssuingAuthorities">
					<option value="" selected="" disabled="">--Select Authorities --</option>
					<c:forEach  var="auth" items="${authoritiesTypeList}">
					<option value="${auth.id}">${auth.name}</option>
					</c:forEach>
				</select>	       
				<span id="noticeIssuingAuthoritiesErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               </div>
            </fieldset>
            
            
             <fieldset>
               <div class="fs-list-full"> 
                <h2 class="fs-title">Publication in News Paper</h2>
                
                <ul class="fs-list-details">
                <li><p>English Newspaper name </p></li>
                <li><input type="text" name="englishNewspaperName" id="englishNewspaperName" class="charcterId form-control mb-md" placeholder="English Newspaper name">
               <span id="englishNewspaperNameErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
                  <ul class="fs-list-details">
                <li><p>Date </p></li>
                <li><input type="date" name="engNewsPaperDate" id="engNewsPaperDate" class="form-control mb-md hasDatepicker" placeholder="DD/MM/YYYY">
                <span id="engNewsPaperDateErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
                 <ul class="fs-list-details">
                <li><p>soft copy upload - English (pdf/jpg/png) </p></li>
                <li><input type="file" name="englishPaperCopyLocation" id="englishPaperCopyLocationFile" class="form-control mb-md"  >
               </li>
               </ul>
                                           
               
               <ul class="fs-list-details">
                <li><p>Telugu Newspaper name </p></li>
                <li><input type="text" name="teluguNewspaperName" id="teluguNewspaperName" class="charcterId form-control mb-md" placeholder="Telugu Newspaper name">
               <span id="teluguNewspaperNameErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
                <ul class="fs-list-details">
                <li><p>Date </p></li>
                <li><input type="date" name="telNewspaperDate" id="telNewspaperDate" class="form-control mb-md hasDatepicker" placeholder="DD/MM/YYYY">
               <span id="telNewspaperDateErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
            
                 <ul class="fs-list-details">
                <li><p>soft copy upload - Telugu (pdf/jpg/png)</p></li>
                <li><input type="file" name="teluguPaperCopyLocation" id="teluguPaperCopyLocationFile" class="form-control mb-md">
               </li>
               </ul>
               
                 <ul class="fs-list-details">
                <li><p>Bid Start Date</p></li>
                <li><input type="date" name="bidStrartDate" id="bidStrartDate" class="form-control mb-md hasDatepicker" placeholder="DD/MM/YYYY">
               <span id="bidStrartDateErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Bid Closing Date</p></li>
                <li><input type="date" name="bidClosingDate" id="bidClosingDate" class="form-control mb-md hasDatepicker" placeholder="DD/MM/YYYY">
               <span id="bidClosingDateErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Bid Opening Date </p></li>
                <li><input type="date" name="bidOpeningDate" id="bidOpeningDate" class="form-control mb-md hasDatepicker" placeholder="DD/MM/YYYY">
                <span id="bidOpeningDateErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
                
              
               <ul class="fs-list-details">
                <li><p>No of Bids received through Online</p></li>
                <li><input type="text" id="bidsReceived" name="bidsReceived"  class="numberId form-control mb-md" placeholder="No of Bids">
                <span id="bidsReceivedErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>No of Bidders Submitted Hard Copy</p></li>
                <li><input type="text" id="hardCopiesSubmitted" name="hardCopiesSubmitted"  class="numberId form-control mb-md" placeholder="No of Bidders">
                <span id="hardCopiesSubmittedErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>No of Bids qualified for Opening of Price Bid</p></li>
                <li><input type="text" name="bidsForPriceBid"  class="numberId form-control mb-md" id="noofBidsQualified" placeholder="No of Bids">
                 <span id="bidsForPriceBidErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
                <ul class="fs-list-details">
                <li><p>Date of Evaluation Completed</p></li>
                <li><input type="date"  id="dateOfEvaluationCompleted" name="dateOfEvaluationCompleted" class="form-control mb-md hasDatepicker" placeholder="DD/MM/YYYY">
                <span id="dateOfEvaluationCompletedErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
             
               
               <ul class="fs-list-details">
                <li><p>Estimated Contract Value (in Rs.)<span class="red">*</span></p></li>
                <li><input type="text"  id="contractValue" name="contractValue" class="form-control mb-md" value="00.00" placeholder="Estimated Contract Value">
                <span id="contractValueErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Contract Value quoted By L1 Bidder<span class="red">*</span></p></li>
                <li><input type="text" id="contractValueByL1Bidder"  name="contractValueByL1Bidder" maxlength="10" value="00.00" class="form-control mb-md" >
                <span id="contractValueByL1BidderErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
                  <ul class="fs-list-details">
                <li><p>Percentage quoted Less / Excess<span class="red">*</span></p></li>
                <li><input type="text"  id="percentageQuoted" name="percentageQuoted" value="00" class="charcterId form-control mb-md">
                <span id="percentageQuotedErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
                   <ul class="fs-list-details fs-list-full">
                <li><p>Check Bid Status</p></li>
                <li><p><input type="radio" checked="checked" name="bidStatus" value="In Process">In Process</p>
                <p><input type="radio" name="bidStatus"  value="Bid Accepted">Bid Accepted</p>
                <p><input type="radio" name="bidStatus"  value="Bid Rejected">Bid Rejected</p>
                 <span id="bidStatusErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Date of LOA Issued to Contractor</p></li>
                <li><input type="date" name="dateOfLoaIssued" id="dateOfLoaIssued"  class="form-control mb-md hasDatepicker" placeholder="DD/MM/YYYY">
                <span id="dateOfLoaIssuedErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
 
               <ul class="fs-list-details">
                <li><p> Name of the agency <span class="red">*</span> </p></li>
                <li>
<!--                 <select id="agencyName" name="angencyName" class="form-control mb-md">
                     <option disabled="" selected="" value=""> -- select Agency -- </option>
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
 -->                     
                <select id="agencyName" name="angencyName" class="form-control mb-md">
					<option value="" selected="" disabled="">--Select Agency --</option>
					<c:forEach  var="agency" items="${agencyList}">
					<option value="${agency.id}">${agency.name}</option>
					</c:forEach>
				</select>
				<span id="agencyNameErr" class="errors" style="color:red;float:right;"></span>
               	</li>
               	</ul>
                </div>
                <input type="submit" id="submit" name="next" class="next action-button" value="Save and Continue">
                
            </fieldset>
        </form>
    </div>
</div>
<!-- /.MultiStep Form -->
</div>
</section>
 
  
</main>

<!--=== Footer ====-->
<jsp:include page="online-mis-footer.jsp" />

<script type="text/javascript">

$("#tenderNoticeNumber").on('input', function () {
    this.value = this.value.match(/^\d+/);
});

$("#contractValue").on('input', function () {
    this.value = this.value.match(/^\d+\.?\d{0,2}/);
});

$("#contractValueByL1Bidder").on('input', function () {
    this.value = this.value.match(/^\d+\.?\d{0,2}/);
});
$("#percentageQuoted").on('input', function () {
    this.value = this.value.match(/^\d+/);
});


$("#submit").click(function(){

/* 	var workName=$("#workName").val();
	if(workName=="" || workName==null){
	    $("#workNameErr").html("Please Enter Name of Work ");
	    $("#workNameErr").focus();
	    return false;
	}else{
	    $("#workNameErr").html("");
	} */
	
	var workNumber=$("#workNumber").val();
	if(workNumber=="" || workNumber==null){
	    $("#workNumberErr").html("Please Enter Work Number");
	    return false;
	}else{
	    $("#workNumberErr").html("");
	}
	
	var ifbPreperationDate=$("#ifbPreperationDate").val();
	if(ifbPreperationDate=="" || ifbPreperationDate==null){
	    $("#ifbPreperationDateErr").html("Please Enter Date");
	    $("#ifbPreperationDate").focus();
	    return false;
	}else{
	    $("#ifbPreperationDateErr").html("");
	}
	
	var tenderNoticeNumber=$("#tenderNoticeNumber").val();
	if(tenderNoticeNumber=="" || tenderNoticeNumber==null){
	    $("#tenderNoticeNumberErr").html("Please Enter Tender Notice Number");
	    $("#tenderNoticeNumber").focus();
	    return false;
	}else{
	    $("#tenderNoticeNumberErr").html("");
	}
	
	var tenderNoticeIssuedDate=$("#tenderNoticeIssuedDate").val();
	if(tenderNoticeIssuedDate=="" || tenderNoticeIssuedDate==null){
	    $("#tenderNoticeIssuedDateErr").html("Please Enter Date ");
	    $("#tenderNoticeIssuedDate").focus();
	    return false;
	}else{
	    $("#tenderNoticeIssuedDateErr").html("");
	}
	
	if( $("#noticeIssuingAuthorities option:selected").val()==""){
		  $("#noticeIssuingAuthoritiesErr").text("Please Select Notice issuing authorities");
		  $("#noticeIssuingAuthorities").focus();
		  return false;
	}else{
		$("#noticeIssuingAuthoritiesErr").text("");
	}
	
	
	var contractValue=$("#contractValue").val();
	if(contractValue=="" || contractValue==null){
	    $("#contractValueErr").html("Please Enter contract Value ");
	    $("#contractValue").focus();
	    return false;
	}else{
	    $("#contractValueErr").html("");
	}
	
	var contractValueByL1Bidder=$("#contractValueByL1Bidder").val();
	if(contractValueByL1Bidder=="" || contractValueByL1Bidder==null){
	    $("#contractValueByL1BidderErr").html("Please Enter Contract Value quoted By L1 Bidder ");
	    $("#contractValueByL1Bidder").focus();
	    return false;
	}else{
	    $("#contractValueByL1BidderErr").html("");
	}
	
 	var percentageQuoted=$("#percentageQuoted").val();
	if(percentageQuoted=="" || percentageQuoted==null){
	    $("#percentageQuotedErr").html("Please Enter Percentage");
	    $("#percentageQuoted").focus();
	    return false;
	}else{
	    $("#percentageQuotedErr").html("");
	} 
	
	if( $("#agencyName option:selected").val()==""){
		  $("#agencyNameErr").text("Please Select Name of the agency");
		  $("#agencyName").focus();
		  return false;
	}else{
		$("#agencyNameErr").text("");
	}
})	
	
</script>
</body>
</html>
