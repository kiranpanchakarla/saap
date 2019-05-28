<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Agreement Details</title>
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
              <h2 class="section-title">Agreement Details</h2>
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
     
          <c:url value="/agreementDetails/save" var="createUrl" />
      <form id="msform" method="POST" action="${createUrl}" modelAttribute="agreementDetailsObj"  >
      <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />     
            
            <!-- fieldsets -->
            <fieldset>
            <div class="fs-list-full"> 
                <h2 class="fs-title">Agreement Details</h2>
                
                <ul class="fs-list-details">
                <li><p>Nature of Work <span class="red">*</span></p></li>
                <li><input type="text" id="natureOfWork" name="natureOfWork"  class="form-control mb-md" readonly value="${workInfo.natureOfWork}">
                <span id="natureOfWorkErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Work Number  <span class="red">*</span></p></li>
                <li><input type="text" id="workNo" name="workNo" title="workno" class="form-control mb-md" readonly value="${workInfo.workNo}">
                <span id="workNoErr" class="errors" style="color:red;float:right;"></span>
                </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Contractor Name<span class="red">*</span></p></li>
                <li><input type="text"  id="contratorName" name="contratorName" class="form-control mb-md" readonly value="${tenderingInfo.angencyName}">
                <span id="contratorNameErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Amount(in Rs.) <span class="red">*</span></p></li>
                <li><input type="text" name="bgAmount" id="bgAmount"  class="form-control mb-md" maxlength="9"  value ="00.00">
                <span id="bgAmountErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Performance Security Amount(in Rs.)   <span class="red">*</span></p></li>
                <li><input type="text" name="performanceSecurityAmount" id="performanceSecurityAmount"  class="form-control mb-md" maxlength="9"  value ="00.00">
                <span id="performanceSecurityAmountErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Site Hand Over Date: <span class="red">*</span></p></li>
                <li><input type="date" name="siteHandOverDate" id="siteHandOverDate" placeholder="DD/MM/YYYY" class="datepicker form-control mb-md hasDatepicker">
                <span id="siteHandOverDateErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Agreement Concluded Date: <span class="red">*</span></p></li>
                <li><input type="date" name="agreementCouncludedDate" id="agreementCouncludedDate" placeholder="DD/MM/YYYY" class="form-control mb-md hasDatepicker">
                <span id="agreementCouncludedDateErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Period of Contract (No. of Months): <span class="red">*</span></p></li>
                <li><input type="text" name="periodOfContract" id="periodOfContract" class="form-control mb-md" maxlength="9">
                <span id="periodOfContractErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Expected date of Completion as per Agreement: <span class="red">*</span></p></li>
                <li><input type="date" name="expectedCompletionDate" id="expectedCompletionDate" placeholder="DD/MM/YYYY" class="form-control mb-md" ><!-- readonly -->
               <span id="expectedCompletionDateErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Agreement Number: <span class="red">*</span></p></li>
                <li><input type="text" name="agreementNumber" id="agreementNumber" class="form-control mb-md" placeholder="Agreement Number">
                <span id="agreementNumberErr" class="errors" style="color:red;float:right;"></span>
               </li>
               </ul>
               
                
                </div>
                
                
            </fieldset>
            
            
            <!-- fieldsets -->
            <fieldset>
            <div class="fs-list-full"> 
                <h2 class="fs-title">Agreement Details</h2>
                
                <ul class="fs-list-details fs-list-full inline-mis-list">
                <li><p>Bank Guarantee Details</p></li>
                <li><p><input type="radio" id="bankGuarantee" name="bankGuaranteeDetails" value="yes" class="radioClass">Yes</p>
                <p><input type="radio" id="bankGuarantee" name="bankGuaranteeDetails" value="no" class="radioClass" checked=""> No</p>
               </li>
               </ul>
               
               <ul class="fs-list-details fs-list-full inline-mis-list">
                <li><p>Demand Draft Details</p></li>
                <li><p><input type="radio" id="demandDraft" name="demandDraftDetails" value="yes" class="radioClassOne">Yes</p>
                <p><input type="radio" id="demandDraft" name="demandDraftDetails" value="no" class="radioClassOne" checked=""> No</p>
               </li>
               </ul>
               
               <ul class="fs-list-details fs-list-full inline-mis-list">
                <li><p>Others</p></li>
                <li><p><input type="radio" id="othe" name="others" value="yes" class="radioClassTwo">Yes</p>
                <p><input type="radio" id="othe" name="others" value="no" class="radioClassTwo" checked=""> No</p>
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
      
  <!-- #contact -->   
</main>

<!--=== Footer ====-->
<jsp:include page="online-mis-footer.jsp" />
<!-- Contact Form JavaScript File --> 
<script src="contactform/contactform.js"></script> 

<script type="text/javascript">

$("#performanceSecurityAmount,#bgAmount").on('input', function () {
    this.value = this.value.match(/^\d+\.?\d{0,2}/);
});
$("#periodOfContract").on('input', function () {
    this.value = this.value.match(/^\d+/);
});


$("#submit").click(function(){
	
	var natureOfWork=$("#natureOfWork").val();
	if(natureOfWork=="" || natureOfWork==null){
	    $("#natureOfWorkErr").html("Please Enter Nature of Work");
	    $("#natureOfWork").focus();
	    return false;
	}else{
	    $("#natureOfWorkErr").html("");
	}
	
	
	var workNo=$("#workNo").val();
	if(workNo=="" || workNo==null){
	    $("#workNokErr").html("Please Enter Work Number");
	    $("#workNo").focus();
	    return false;
	}else{
	    $("#workNoErr").html("");
	}
	
	var contratorName=$("#contratorName").val();
	if(contratorName=="" || contratorName==null){
	    $("#contratorNameErr").html("Please Enter Contractor Name");
	    $("#contratorName").focus();
	    return false;
	}else{
	    $("#contratorNameErr").html("");
	}
	
	var bgAmount=$("#bgAmount").val();
	if(bgAmount=="" || bgAmount==null){
	    $("#bgAmountErr").html("Please Enter Amount");
	    $("#bgAmount").focus();
	    return false;
	}else{
	    $("#bgAmountErr").html("");
	}
	
	var performanceSecurityAmount=$("#performanceSecurityAmount").val();
	if(performanceSecurityAmount=="" || performanceSecurityAmount==null){
	    $("#performanceSecurityAmountErr").html("Please Enter  Security Amount");
	    $("#performanceSecurityAmount").focus();
	    return false;
	}else{
	    $("#performanceSecurityAmountErr").html("");
	}
	
	var siteHandOverDate=$("#siteHandOverDate").val();
	if(siteHandOverDate=="" || siteHandOverDate==null){
	    $("#siteHandOverDateErr").html("Please Enter Date");
	    $("#siteHandOverDate").focus();
	    return false;
	}else{
	    $("#siteHandOverDateErr").html("");
	}
	
	
	var agreementCouncludedDate=$("#agreementCouncludedDate").val();
	if(agreementCouncludedDate == "" || agreementCouncludedDate == null){
	    $("#agreementCouncludedDateErr").html("Please Enter Date");
	    $("#agreementCouncludedDate").focus();
	    return false;
	}else{
	    $("#agreementCouncludedDateErr").html("");
	}
	
	
	var agreementCouncludedDate=$("#agreementCouncludedDate").val();
	if(agreementCouncludedDate == "" || agreementCouncludedDate == null){
	    $("#agreementCouncludedDateErr").html("Please Enter Date");
	    $("#agreementCouncludedDate").focus();
	    return false;
	}else{
	    $("#agreementCouncludedDateErr").html("");
	}
	
	var periodOfContract=$("#periodOfContract").val();
	if(periodOfContract =="" || periodOfContract ==null){
	    $("#periodOfContractErr").html("Please Enter Period of Contract ");
	    $("#periodOfContract").focus();
	    return false;
	}else{
	    $("#periodOfContractErr").html("");
	}
	
	var expectedCompletionDate=$("#expectedCompletionDate").val();
	if(expectedCompletionDate == "" || expectedCompletionDate == null){
	    $("#expectedCompletionDateErr").html("Please Enter Date");
	    $("#expectedCompletionDate").focus();
	    return false;
	}else{
	    $("#expectedCompletionDateErr").html("");
	}
	
	var agreementNumber=$("#agreementNumber").val();
	if(agreementNumber=="" || agreementNumber==null){
	    $("#agreementNumberErr").html("Please Enter Agreement Number");
	    $("#agreementNumber").focus();
	    return false;
	}else{
	    $("#agreementNumberErr").html("");
	}		
})
</script>
</body>
</html>
