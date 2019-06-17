<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Tendering Process</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
</head>
 <script type="text/javascript"> 
 $(document).ready(function() {

	    $('#ifbPreperationDate').datepicker({dateFormat: 'yy-mm-dd'});
	    $('#ifbPreperationDate').datepicker('setDate', $('#ifbDate').val());
	    
	    $('#tenderNoticeIssuedDate').datepicker({dateFormat: 'yy-mm-dd'});
	    $('#tenderNoticeIssuedDate').datepicker('setDate', $('#tendDate').val());
	    
	    $('#engNewsPaperDate').datepicker({dateFormat: 'yy-mm-dd'});
	    $('#engNewsPaperDate').datepicker('setDate', $('#engDate').val());
	    
	    $('#telNewspaperDate').datepicker({dateFormat: 'yy-mm-dd'});
	    $('#telNewspaperDate').datepicker('setDate', $('#telDate').val());
	    
	    $('#bidStrartDate').datepicker({dateFormat: 'yy-mm-dd'});
	    $('#bidStrartDate').datepicker('setDate', $('#bsDate').val());
	    
	    $('#bidClosingDate').datepicker({dateFormat: 'yy-mm-dd'});
	    $('#bidClosingDate').datepicker('setDate', $('#bcDate').val());
	    
	    $('#bidOpeningDate').datepicker({dateFormat: 'yy-mm-dd'});
	    $('#bidOpeningDate').datepicker('setDate', $('#boDate').val());
	    
	    $('#dateOfEvaluationCompleted').datepicker({dateFormat: 'yy-mm-dd'});
	    $('#dateOfEvaluationCompleted').datepicker('setDate', $('#evalDate').val());
	    
	    $('#dateOfLoaIssued').datepicker({dateFormat: 'yy-mm-dd'});
	    $('#dateOfLoaIssued').datepicker('setDate', $('#loaDate').val());
	    	    
	 }); 
 </script>
<body>

<!--=== Header ====-->
<jsp:include page="online-mis-header.jsp" />
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
              <h2 class="section-title">Tendering Process</h2>
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
  
  <section id="contact" class="section-bg-con">
    <div class="container">
    
    <div class="row">
    <div class="col-md-12">
   
    <c:url value="/tenderProcess/save" var="createUrl" />
      <form:form id="msform" method="POST" action="${createUrl}" modelAttribute="tenderingProcessObj"  enctype="multipart/form-data" >
      
      <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />   
		<c:choose>
		<c:when test="${!empty tenderingProcessObj.id}">
			<form:input type="hidden" path="id" class="form-control" id="id" ></form:input>
			<input type="hidden" name="ifbDate" id ="ifbDate" value="${tenderingProcessObj.ifbPreperationDate}">
			<input type="hidden" name="tendDate" id ="tendDate" value="${tenderingProcessObj.tenderNoticeIssuedDate}"> 
			<input type="hidden" name="engDate" id ="engDate" value="${tenderingProcessObj.engNewsPaperDate}"> 
			<input type="hidden" name="telDate" id ="telDate" value="${tenderingProcessObj.telNewspaperDate}"> 
			<input type="hidden" name="bsDate" id ="bsDate" value="${tenderingProcessObj.bidStrartDate}"> 
			<input type="hidden" name="bcDate" id ="bcDate" value="${tenderingProcessObj.bidClosingDate}"> 
			<input type="hidden" name="boDate" id ="boDate" value="${tenderingProcessObj.bidOpeningDate}"> 
			<input type="hidden" name="evalDate" id ="evalDate" value="${tenderingProcessObj.dateOfEvaluationCompleted}"> 
			<input type="hidden" name="loaDate" id ="loaDate" value="${tenderingProcessObj.dateOfLoaIssued}"> 
		</c:when>
		</c:choose> 
            <!-- fieldsets -->
            <fieldset>
            <div class="fs-list-full"> 
                <h2 class="fs-title">Tendering Process</h2>
                
                <ul class="fs-list-details">
                <li><p>Work <span class="red">*</span></p></li>
                <li><form:input type="text" id="workName" path="workName" class="form-control mb-md" readonly="true" value="${workLineItems.workDetails}"/>
                <span id="workNameErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Work Number <span class="red">*</span></p></li>
                <li><form:input type="text" id="workNumber" path="workNumber" class="form-control mb-md" readonly="true" value="${workInfo.workNo}"/>
                <span id="workNumberErr" class="errors" style="color:red;float:right;"></span>
                </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Date of Preparation of IFB<span class="red">*</span></p></li>
                <li><form:input type="date" id="ifbPreperationDate" path="ifbPreperationDate"  /> <!-- class="form-control mb-md hasDatepicker" -->
                <span id="ifbPreperationDateErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Tender Notice Number<span class="red">*</span></p></li>
                <li><form:input type="text" id="tenderNoticeNumber" path="tenderNoticeNumber" class="form-control mb-md" placeholder="Tender Notice Number"/>
                <span id="tenderNoticeNumberErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Tender Notice Issued date   <span class="red">*</span></p></li>
                <li><form:input type="date" id="tenderNoticeIssuedDate" path="tenderNoticeIssuedDate" placeholder="DD/MM/YYYY"/>
               <span id="tenderNoticeIssuedDateErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Notice issuing authorities (SE/CE/ENC)  <span class="red">*</span></p></li>
                <li>                                          
                 <form:select id="noticeIssuingAuthorities" path="noticeIssuingAuthorities.id">
					<form:option value="" selected="" disabled="">--Select Authorities --</form:option>
					<c:forEach  var="auth" items="${authoritiesTypeList}">
					<form:option value="${auth.id}">${auth.name}</form:option>
					</c:forEach>
				</form:select>	       
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
                <li><form:input type="text" path="englishNewspaperName" id="englishNewspaperName" class="charcterId form-control mb-md" placeholder="English Newspaper name"/>
               <span id="englishNewspaperNameErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul> 
               
               <ul class="fs-list-details">
                <li><p>Date </p></li>
                <li><form:input type="date" path="engNewsPaperDate" id="engNewsPaperDate"/>
                <span id="engNewsPaperDateErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
                <ul class="fs-list-details">
                <li><p>soft copy upload - English (pdf/jpg/png) </p></li>
                <li><input type="file" name="engfile" id="englishPaperCopyLocationFile" value="${engUpload}"  onchange="document.getElementById('image').src = window.URL.createObjectURL(this.files[0])" class="form-control mb-md">
                 <li> <img id="image" src="${engUpload}"   width="100" height="70"/> </li>
                  <form:input type="hidden" path="engUpload" class="form-control" id="engfileName" value="${tenderingProcessObj.engUpload}"></form:input>
                 <span id="file_error1" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
             
                                           
               
               <ul class="fs-list-details">
                <li><p>Telugu Newspaper name </p></li>
                <li><form:input type="text" path="teluguNewspaperName" id="teluguNewspaperName" class="charcterId form-control mb-md" placeholder="Telugu Newspaper name"/>
               <span id="teluguNewspaperNameErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
                <ul class="fs-list-details">
                <li><p>Date </p></li>
                <li><form:input type="date" path="telNewspaperDate" id="telNewspaperDate"/>
               <span id="telNewspaperDateErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
            
                 <ul class="fs-list-details">
                <li><p>soft copy upload - Telugu (pdf/jpg/png)</p></li>
                <li><input type="file" name="telugufile" id="teluguPaperCopyLocationFile" value="${telUpload}" class="form-control mb-md" onchange="document.getElementById('telimage').src = window.URL.createObjectURL(this.files[0])" class="form-control mb-md"/>
               <li> <img id="telimage" src="${telUpload}"   width="100" height="70"/> </li>
                  <form:input type="hidden" path="telUpload" class="form-control" id="telfileName" value="${tenderingProcessObj.telUpload}"></form:input>
               <span id="file_error2" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               
               
               
                 <ul class="fs-list-details">
                <li><p>Bid Start Date</p></li>
                <li><form:input type="date" path="bidStrartDate" id="bidStrartDate"/>
               <span id="bidStrartDateErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Bid Closing Date</p></li>
                <li><form:input type="date" path="bidClosingDate" id="bidClosingDate" />
               <span id="bidClosingDateErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Bid Opening Date </p></li>
                <li><form:input type="date" path="bidOpeningDate" id="bidOpeningDate" />
                <span id="bidOpeningDateErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
              
               <ul class="fs-list-details">
                <li><p>No of Bids received through Online</p></li>
                <li><form:input type="text" id="bidsReceived" path="bidsReceived"  class="numberId form-control mb-md" placeholder="No of Bids"/>
                <span id="bidsReceivedErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>No of Bidders Submitted Hard Copy</p></li>
                <li><form:input type="text" id="hardCopiesSubmitted" path="hardCopiesSubmitted"  class="numberId form-control mb-md" placeholder="No of Bidders"/>
                <span id="hardCopiesSubmittedErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>No of Bids qualified for Opening of Price Bid</p></li>
                <li><form:input type="text" path="bidsForPriceBid"  class="numberId form-control mb-md" id="noofBidsQualified" placeholder="No of Bids"/>
                 <span id="bidsForPriceBidErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
                <ul class="fs-list-details">
                <li><p>Date of Evaluation Completed</p></li>
                <li><form:input type="date"  id="dateOfEvaluationCompleted" path="dateOfEvaluationCompleted" />
                <span id="dateOfEvaluationCompletedErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
             
               
               <ul class="fs-list-details">
                <li><p>Estimated Contract Value (in Rs.)<span class="red">*</span></p></li>
                <li><form:input type="text"  id="contractValue" path="contractValue" class="form-control mb-md" maxlength="9" value="" placeholder="Estimated Contract Value"/>
                <span id="contractValueErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Contract Value quoted By L1 Bidder<span class="red">*</span></p></li>
                <li><form:input type="text" id="contractValueByL1Bidder"  path="contractValueByL1Bidder" maxlength="9" value="" class="form-control mb-md" />
                <span id="contractValueByL1BidderErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
                  <ul class="fs-list-details">
                <li><p>Percentage quoted Less / Excess<span class="red">*</span></p></li>
                <li><form:input type="text"  id="percentageQuoted" path="percentageQuoted" maxlength="9" value="" class="charcterId form-control mb-md"/>
                <span id="percentageQuotedErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
                <ul class="fs-list-details fs-list-full">
                <li><p>Check Bid Status</p></li>
                <li><p><form:radiobutton checked="checked" path="bidStatus" value="In Process"/>In Process</p>
                <p><form:radiobutton path="bidStatus"  value="Bid Accepted"/>Bid Accepted</p>
                <p><form:radiobutton path="bidStatus"  value="Bid Rejected"/>Bid Rejected</p>
                 <span id="bidStatusErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Date of LOA Issued to Contractor</p></li>
                <li><form:input type="date" path="dateOfLoaIssued" id="dateOfLoaIssued"  />
                <span id="dateOfLoaIssuedErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
                
                <ul class="fs-list-details">
                <li><p> Name of the agency <span class="red">*</span> </p></li>
                <li>                    
                <form:select id="agencyName" path="angencyName.id" >
					<form:option value="" selected="" disabled="">--Select Agency --</form:option>
					<c:forEach  var="agency" items="${agencyList}">
					<form:option value="${agency.id}">${agency.name}</form:option>
					</c:forEach>
				</form:select>				
				<span id="agencyNameErr" class="errors" style="color:red;float:right;"></span>
               	</li>
               	</ul>
                </div> 
                
                <c:if test="${tenderingProcessObj.id==null}">
                <input type="submit" id="submit" name="next" class="next action-button" value="Save and Continue">
                </c:if>
                <c:if test="${tenderingProcessObj.id!=null}">
                <input type="submit" id="submit" name="next" class="next action-button" value="update and Continue">
                </c:if> 
                
            </fieldset>
            <input type="hidden" id="workid" name="work.id" value="${workInfo.id}">
         </form:form>
    </div>
</div>
<!-- /.MultiStep Form -->
</div>
</section>
 
  
</main>

<!--=== Footer ====-->
<jsp:include page="online-mis-footer.jsp" />

<script type="text/javascript">

$(document).ready(function(){
	  $("input[name='engfile']").on("change", function () {
		  $("#file_error1").html("");
		     if(this.files[0].size > 2000000) {
		    	 $("#file_error1").html("File size is greater than 2MB");
		     $(this).val('');
		     }
		    });
	  
	  $("input[name='telugufile']").on("change", function () {
		  $("#file_error2").html("");
		     if(this.files[0].size > 2000000) {
		    	 $("#file_error2").html("File size is greater than 2MB");
		     $(this).val('');
		     }
		    });
	});
$("#percentageQuoted,#bidsReceived,#hardCopiesSubmitted,#noofBidsQualified").on('input', function () {
    this.value = this.value.match(/^\d+/);
});

$("#contractValue,#contractValueByL1Bidder").on('input', function () {
    this.value = this.value.match(/^\d+\.?\d{0,2}/);
});
$('#englishNewspaperName,#teluguNewspaperName').on('input', function() {
	  $(this).val($(this).val().replace(/[^a-z ]/gi, ''));
});
$('#tenderNoticeNumber').on('input', function() {
	  $(this).val($(this).val().replace(/[^a-z0-9]/gi, ''));
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
