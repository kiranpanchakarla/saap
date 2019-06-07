<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Agreement Details</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
</head>

<body>
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
<main id="main"> 
 <section id="contact" class="section-bg-con">
    <div class="container">
    <div class="row">
    <div class="col-md-12">
      <form method="GET" id="msform">
       <fieldset>
            <div class="fs-list-full"> 
                <h2 class="fs-title">Agreement Details</h2>
                
                <ul class="fs-list-details">
                <li><p>Nature of Work <span class="red">*</span></p></li>
                <li><input type="text" id="natureOfWork" name="natureOfWork"  class="form-control mb-md" readonly value="${agreementInfo.work.natureOfWork.name}">
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Work Number  <span class="red">*</span></p></li>
                <li><input type="text" id="workNo" name="workNo" title="workno" class="form-control mb-md" readonly value="${agreementInfo.work.workNo}">
                </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Contractor Name<span class="red">*</span></p></li>
                <li><input type="text"  id="contratorName" name="contratorName" class="form-control mb-md" readonly value="${agreementInfo.tenderingProcess.angencyName.name}">
                </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Amount(in Rs.) <span class="red">*</span></p></li>
                <li><input type="text" name="bgAmount" id="bgAmount"  class="form-control mb-md"  readonly  value ="${agreementInfo.performanceSecurityAmount}">
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Performance Security Amount(in Rs.)   <span class="red">*</span></p></li>
                <li><input type="text" name="performanceSecurityAmount" id="performanceSecurityAmount" readonly class="form-control mb-md"   value ="${agreementInfo.performanceSecurityAmount}">
                </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Site Hand Over Date: <span class="red">*</span></p></li>
                <li><fmt:formatDate pattern = "dd/MM/yyyy" var="fmtsiteHandOverDate" value="${agreementInfo.siteHandOverDate}" />
                <input type="text" name="siteHandOverDate" id="siteHandOverDate" readonly class="datepicker form-control mb-md hasDatepicker" value="${fmtsiteHandOverDate}">
               
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Agreement Concluded Date: <span class="red">*</span></p></li>
                <li><fmt:formatDate pattern = "dd/MM/yyyy" var="fmtagreementCouncludedDate" value="${agreementInfo.agreementCouncludedDate}" />
                <input type="text" name="agreementCouncludedDate" id="agreementCouncludedDate" readonly value="${fmtagreementCouncludedDate}" class="form-control mb-md hasDatepicker">
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Period of Contract (No. of Months): <span class="red">*</span></p></li>
                <li><input type="text" name="periodOfContract" id="periodOfContract" class="form-control mb-md" readonly value="${agreementInfo.periodOfContract}">
                </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Expected date of Completion as per Agreement: <span class="red">*</span></p></li>
                <li><fmt:formatDate pattern = "dd/MM/yyyy" var="fmtexpectedCompletionDate" value="${agreementInfo.expectedCompletionDate}" />
                <input type="text" name="expectedCompletionDate" id="expectedCompletionDate" readonly value="${fmtexpectedCompletionDate}" class="form-control mb-md" >
                </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Agreement Number: <span class="red">*</span></p></li>
                <li><input type="text" name="agreementNumber" id="agreementNumber" class="form-control mb-md" readonly value="${agreementInfo.agreementNumber}">
                </li>
               </ul>
               </div>
            </fieldset>
            
            
           
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
             </fieldset>
        <div class="row">
          <div class="col-sm-6 form-group" ><a href="#" onclick="goBack()" class="btn btn-info center">Back</a></div>
        </div> 
        </form>
    </div>
</div>
</div>
  </section>
</main>

<jsp:include page="online-mis-footer.jsp" />
   <script type="text/javascript">
	function goBack() {
			window.history.back();
		}
	</script>
</body>
</html>
