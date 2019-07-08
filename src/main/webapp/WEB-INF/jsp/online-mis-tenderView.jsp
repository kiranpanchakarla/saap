<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Tendering Process</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
<jsp:include page="online-mis-header.jsp" />
</head>

<body>
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
<main id="main"> 

  <section id="contact" class="section-bg-con">
    <div class="container">
    <div class="row">
    <div class="col-md-12">
    <form method="GET" id="msform">
      <fieldset>
            <div class="fs-list-full"> 
                <h2 class="fs-title">Tendering Process</h2>
                
                <ul class="fs-list-details">
                <li><p>Work <span class="red">*</span></p></li>
                <li><input type="text" id="workName" name="workName" class="form-control mb-md" readonly value="${workLineItems.workDetails}">
                 </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Work Number <span class="red">*</span></p></li>
                <li><input type="text" id="workNumber" name="workNumber" class="form-control mb-md" readonly value="${tenderInfo.work.workNo}">
               
                </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Date of Preparation of IFB<span class="red">*</span></p></li>
                <li><fmt:formatDate pattern = "dd/MM/yyyy" var="fmtifbPreperationDate" value="${tenderInfo.ifbPreperationDate}" />  
				  <input type="text" id="ifbPreperationDate" name="ifbPreperationDate" readonly class="form-control mb-md hasDatepicker" value="${fmtifbPreperationDate}">
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Tender Notice Number<span class="red">*</span></p></li>
                <li><input type="text" id="tenderNoticeNumber" name="tenderNoticeNumber" readonly class="form-control mb-md" value="${tenderInfo.tenderNoticeNumber}">
                
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Tender Notice Issued date   <span class="red">*</span></p></li>
                <li><fmt:formatDate pattern = "dd/MM/yyyy" var="fmttenderNoticeIssuedDate" value="${tenderInfo.tenderNoticeIssuedDate}" />
                <input type="text" id="tenderNoticeIssuedDate" name="tenderNoticeIssuedDate" readonly class="form-control mb-md hasDatepicker" value="${fmttenderNoticeIssuedDate}" >
               
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Notice issuing authorities (SE/CE/ENC)  <span class="red">*</span></p></li>
                <li> <input type="text" id="noticeIssuingAuthorities" name="noticeIssuingAuthorities" readonly class="form-control mb-md" value="${tenderInfo.noticeIssuingAuthorities.name}">                                         
                
               </li>
               </ul>
               </div>
            </fieldset>
            
            
             <fieldset>
               <div class="fs-list-full"> 
                <h2 class="fs-title">Publication in News Paper</h2>
                
                <ul class="fs-list-details">
                <li><p>English Newspaper name </p></li>
                <li><input type="text" name="englishNewspaperName" id="englishNewspaperName" readonly class="charcterId form-control mb-md" value="${tenderInfo.englishNewspaperName}">
               
               </li>
               </ul> 
               
               <ul class="fs-list-details">
                <li><p>Date </p></li>
                <fmt:formatDate pattern = "dd/MM/yyyy" var="fmtengNewsPaperDate" value="${tenderInfo.engNewsPaperDate}" />
                <li><input type="text" name="engNewsPaperDate" id="engNewsPaperDate" readonly class="form-control mb-md hasDatepicker" value="${fmtengNewsPaperDate}">
                
               </li>
               </ul>
               
                 <ul class="fs-list-details">
                <li><p>soft copy upload - English (pdf/jpg/png) </p></li>
             <%--  <li><a href="${engUpload}" target="_self" id="docView" name="image" >View Document</a></li>  --%>
                  <c:forEach items="${engUpload}" var="engfile">
			      <li><a href="${engfile}" target="_blank" id="docView" name="image" >View Document</a></li>
		       </c:forEach>
               </li>
               </ul>
                                           
               
               <ul class="fs-list-details">
                <li><p>Telugu Newspaper name </p></li>
                <li><input type="text" name="teluguNewspaperName" id="teluguNewspaperName" readonly class="charcterId form-control mb-md" value="${tenderInfo.teluguNewspaperName}">
               
               </li>
               </ul>
               
                <ul class="fs-list-details">
                <li><p>Date </p></li>
                <li><fmt:formatDate pattern = "dd/MM/yyyy" var="fmttelNewspaperDate" value="${tenderInfo.telNewspaperDate}" />
                <input type="text" name="telNewspaperDate" id="telNewspaperDate" readonly value="${fmttelNewspaperDate}" class="form-control mb-md hasDatepicker" >
               </li>
               </ul>
               
            
                 <ul class="fs-list-details">
                <li><p>soft copy upload - Telugu (pdf/jpg/png)</p></li>
               <c:forEach items="${telUpload}" var="telfile">
			      <li><a href="${telfile}" target="_blank" id="docView" name="image" >View Document</a></li>
		       </c:forEach>
                </li>
               </ul>
               
               
               
                 <ul class="fs-list-details">
                <li><p>Bid Start Date</p></li>
                <li> <fmt:formatDate pattern = "dd/MM/yyyy" var="fmtbidStrartDate" value="${tenderInfo.bidStrartDate}" />
                <input type="text" name="bidStrartDate" id="bidStrartDate" readonly class="form-control mb-md hasDatepicker" value="${fmtbidStrartDate}">
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Bid Closing Date</p></li>
                <li><fmt:formatDate pattern = "dd/MM/yyyy" var="fmtbidClosingDate" value="${tenderInfo.bidClosingDate}" />
                <input type="text" name="bidClosingDate" id="bidClosingDate" readonly class="form-control mb-md hasDatepicker" value="${fmtbidClosingDate}">
              </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Bid Opening Date </p></li>
                <li><fmt:formatDate pattern = "dd/MM/yyyy" var="fmtbidOpeningDate" value="${tenderInfo.bidOpeningDate}" />
                <input type="text" name="bidOpeningDate" id="bidOpeningDate" readonly class="form-control mb-md hasDatepicker" value="${fmtbidOpeningDate}">
               </li>
               </ul>
              
               <ul class="fs-list-details">
                <li><p>No of Bids received through Online</p></li>
                <li><input type="text" id="bidsReceived" name="bidsReceived" readonly class="numberId form-control mb-md" value="${tenderInfo.bidsReceived}">
                </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>No of Bidders Submitted Hard Copy</p></li>
                <li><input type="text" id="hardCopiesSubmitted" name="hardCopiesSubmitted" readonly  class="numberId form-control mb-md" value="${tenderInfo.hardCopiesSubmitted}">
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>No of Bids qualified for Opening of Price Bid</p></li>
                <li><input type="text" name="bidsForPriceBid"  class="numberId form-control mb-md" readonly id="noofBidsQualified" value="${tenderInfo.bidsForPriceBid}">
               </li>
               </ul>
               
                <ul class="fs-list-details">
                <li><p>Date of Evaluation Completed</p></li>
                <li><fmt:formatDate pattern = "dd/MM/yyyy" var="fmtdateOfEvaluationCompleted" value="${tenderInfo.dateOfEvaluationCompleted}" />
                <input type="text"  id="dateOfEvaluationCompleted" name="dateOfEvaluationCompleted" readonly class="form-control mb-md hasDatepicker" value="${fmtdateOfEvaluationCompleted}">
                </li>
               </ul>
               
             
               
               <ul class="fs-list-details">
                <li><p>Estimated Contract Value (in Rs.)<span class="red">*</span></p></li>
                <li><input type="text"  id="contractValue" name="contractValue" class="form-control mb-md" readonly value="${tenderInfo.contractValue}">
                </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Contract Value quoted By L1 Bidder<span class="red">*</span></p></li>
                <li><input type="text" id="contractValueByL1Bidder"  name="contractValueByL1Bidder" readonly value="${tenderInfo.contractValueByL1Bidder}" class="form-control mb-md" >
               </li>
               </ul>
               
                  <ul class="fs-list-details">
                <li><p>Percentage quoted Less / Excess<span class="red">*</span></p></li>
                <li><input type="text"  id="percentageQuoted" name="percentageQuoted" readonly value="${tenderInfo.percentageQuoted}" class="charcterId form-control mb-md">
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
                <li><fmt:formatDate pattern = "dd/MM/yyyy" var="fmtdateOfLoaIssued" value="${tenderInfo.dateOfLoaIssued}" />
                <input type="text" name="dateOfLoaIssued" id="dateOfLoaIssued" readonly  class="form-control mb-md hasDatepicker" value="${fmtdateOfLoaIssued}">
                 </li>
               </ul>
               
 
               <ul class="fs-list-details">
                <li><p> Name of the agency <span class="red">*</span> </p></li>
                <li><input type="text"  id="agencyName" name="agencyName" readonly value="${tenderInfo.angencyName.name}" class="charcterId form-control mb-md">
               </li>
               	</ul>
                </div>
            </fieldset>
         <div class="row">
          <div class="col-sm-6 form-group"><a href="#" onclick="goBack()" class="btn btn-info ">Back</a></div>
         <c:if test="${agreementInfo!=null}">
          <div class="col-sm-6 form-group"><a href="<c:url value="/agreementDetails/view?workId=${tenderInfo.work.id}"/>" class="btn btn-info ">Technical Sanction Page</a></div>
        </c:if>
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
