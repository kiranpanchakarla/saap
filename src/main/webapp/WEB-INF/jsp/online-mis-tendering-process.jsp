<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Tendering Process</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link
	href="${pageContext.request.contextPath}/resources/css/uploadDocuments/fileUploadDocuments.css"
	rel="stylesheet">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
.fileuploadLabel{
line-height : 3;
}

input[type="radio"]{
 cursor: pointer;
}
input[type="radio"]+label
	 {
    color: #033d75;
    padding-left: 10px;
    position: relative;
    top: -2px;
    cursor: pointer;
    margin-right: 1.5%;
}
</style>
</head>
<script type="text/javascript">
	$(document).ready(
			function() {

				/*$('#englishPaperCopyLocationFile').change(
						function(event) {
							$('#engdocView').empty();
							var file = URL
									.createObjectURL(event.target.files[0]);
							$('#engdocView').append(
									'<a href="' + file + '" target="_self">'
											+ event.target.files[0].name
											+ '</a><br>');
						});

				$('#teluguPaperCopyLocationFile').change(
						function(event) {
							$('#teldocView').empty();
							var file = URL
									.createObjectURL(event.target.files[0]);
							$('#teldocView').append(
									'<a href="' + file + '" target="_self">'
											+ event.target.files[0].name
											+ '</a><br>');
						});

				$("input[name='engfile']").on(
						"change",
						function() {
							$("#file_error1").html("");
							if (this.files[0].size > 2000000) {
								$("#file_error1").html(
										"File size is greater than 2MB");
								$(this).val('');
							}
						});

				$("input[name='telugufile']").on(
						"change",
						function() {
							$("#file_error2").html("");
							if (this.files[0].size > 2000000) {
								$("#file_error2").html(
										"File size is greater than 2MB");
								$(this).val('');
							}
						});
				
				*/

				$('#ifbPreperationDate').datepicker({
					altField : "#ifbDate",
					altFormat : "yy-mm-dd",
					dateFormat : 'dd-mm-yy'
				});

				$('#tenderNoticeIssuedDate').datepicker({
					altField : "#tendDate",
					altFormat : "yy-mm-dd",
					dateFormat : 'dd-mm-yy'
				});

				$('#engNewsPaperDate').datepicker({
					altField : "#engDate",
					altFormat : "yy-mm-dd",
					dateFormat : 'dd-mm-yy'
				});

				$('#telNewspaperDate').datepicker({
					altField : "#telDate",
					altFormat : "yy-mm-dd",
					dateFormat : 'dd-mm-yy'
				});

				$('#bidStrartDate').datepicker({
					altField : "#bsDate",
					altFormat : "yy-mm-dd",
					dateFormat : 'dd-mm-yy'
				});

				$('#bidClosingDate').datepicker({
					altField : "#bcDate",
					altFormat : "yy-mm-dd",
					dateFormat : 'dd-mm-yy'
				});

				$('#bidOpeningDate').datepicker({
					altField : "#boDate",
					altFormat : "yy-mm-dd",
					dateFormat : 'dd-mm-yy'
				});

				$('#dateOfEvaluationCompleted').datepicker({
					altField : "#evalDate",
					altFormat : "yy-mm-dd",
					dateFormat : 'dd-mm-yy'
				});

				$('#dateOfLoaIssued').datepicker({
					altField : "#loaDate",
					altFormat : "yy-mm-dd",
					dateFormat : 'dd-mm-yy'
				});

				$('#ifbPreperationDate').datepicker('setDate',
						convertDateToLocalFormat($('#ifbDate').val()));

				$('#tenderNoticeIssuedDate').datepicker('setDate',
						convertDateToLocalFormat($('#tendDate').val()));

				$('#engNewsPaperDate').datepicker('setDate',
						convertDateToLocalFormat($('#engDate').val()));

				$('#telNewspaperDate').datepicker('setDate',
						convertDateToLocalFormat($('#telDate').val()));

				$('#bidStrartDate').datepicker('setDate', convertDateToLocalFormat($('#bsDate').val()));

				$('#bidClosingDate').datepicker('setDate', convertDateToLocalFormat($('#bcDate').val()));

				$('#bidOpeningDate').datepicker('setDate', convertDateToLocalFormat($('#boDate').val()));

				$('#dateOfEvaluationCompleted').datepicker('setDate',
						convertDateToLocalFormat($('#evalDate').val()));

				$('#dateOfLoaIssued')
						.datepicker('setDate',convertDateToLocalFormat( $('#loaDate').val()));

			});
	
	function convertDateToLocalFormat(date){
		return new moment(date, "YYYY-MM-DD").format("DD-MM-YYYY");
	}
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

	<main id="main"> <!--==========================
      Contact Us Section
    ============================--> <section id="contact"
		class="section-bg-con">
	<div class="container">
		<c:import url="/WEB-INF/jsp/online-mis-departmentTabView.jsp" />
		<div class="row">
			<div class="col-md-12">

				<c:url value="/tenderProcess/save" var="createUrl" />
				<form:form id="msform" method="POST" action="${createUrl}"
					modelAttribute="tenderingProcessObj" enctype="multipart/form-data">

					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<%-- <c:choose>
						<c:when test="${!empty tenderingProcessObj.id}">
							<form:input type="hidden" path="id" class="form-control" id="id"></form:input>
							<input type="hidden" name="ifbDate" id="ifbDate"
								value="${tenderingProcessObj.ifbPreperationDate}">
							<input type="hidden" name="tendDate" id="tendDate"
								value="${tenderingProcessObj.tenderNoticeIssuedDate}">
							<input type="hidden" name="engDate" id="engDate"
								value="${tenderingProcessObj.engNewsPaperDate}">
							<input type="hidden" name="telDate" id="telDate"
								value="${tenderingProcessObj.telNewspaperDate}">
							<input type="hidden" name="bsDate" id="bsDate"
								value="${tenderingProcessObj.bidStrartDate}">
							<input type="hidden" name="bcDate" id="bcDate"
								value="${tenderingProcessObj.bidClosingDate}">
							<input type="hidden" name="boDate" id="boDate"
								value="${tenderingProcessObj.bidOpeningDate}">
							<input type="hidden" name="evalDate" id="evalDate"
								value="${tenderingProcessObj.dateOfEvaluationCompleted}">
							<input type="hidden" name="loaDate" id="loaDate"
								value="${tenderingProcessObj.dateOfLoaIssued}">
						</c:when>
					</c:choose> --%>

					<form:input type="hidden" path="id" class="form-control" id="id"></form:input>
					<form:input type="hidden" id="ifbDate" path="ifbPreperationDate" />
					<form:input type="hidden" id="tendDate"
						path="tenderNoticeIssuedDate" />
					<form:input type="hidden" id="engDate" path="engNewsPaperDate" />
					<form:input type="hidden" id="telDate" path="telNewspaperDate" />
					<form:input type="hidden" id="bsDate" path="bidStrartDate" />
					<form:input type="hidden" id="bcDate" path="bidClosingDate" />
					<form:input type="hidden" id="boDate" path="bidOpeningDate" />
					<form:input type="hidden" id="evalDate"
						path="dateOfEvaluationCompleted" />
					<form:input type="hidden" id="loaDate" path="dateOfLoaIssued" />


					<!-- fieldsets -->
					<fieldset>
						<div class="fs-list-full">
							<h2 class="fs-title">Tendering Process</h2>

							<ul class="fs-list-details">
								<li><p>
										Work <span class="red">*</span>
									</p></li>
								<li><form:input type="text" id="workName" path="workName"
										class="form-control mb-md" readonly="true"
										value="${workLineItems.workDetails}" /> <span
									id="workNameErr" class="errors"
									style="color: red; float: right;"></span></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>
										Work Number <span class="red">*</span>
									</p></li>
								<li><form:input type="text" id="workNumber"
										path="workNumber" class="form-control mb-md" readonly="true"
										value="${workObject.workNo}" /> <span id="workNumberErr"
									class="errors" style="color: red; float: right;"></span></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>
										Date of Preparation of IFB<span class="red">*</span>
									</p></li>
								<li><input type="text" id="ifbPreperationDate"
										path="ifbPreperationDate" placeholder="DD/MM/YYYY"  autocomplete="off"/> <!-- class="form-control mb-md hasDatepicker" -->
									<span id="ifbPreperationDateErr" class="errors"
									style="color: red; float: right;"></span></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>
										Tender Notice Number<span class="red">*</span>
									</p></li>
								<li><form:input type="text" id="tenderNoticeNumber"
										path="tenderNoticeNumber" class="form-control mb-md"
										placeholder="Tender Notice Number" /> <span
									id="tenderNoticeNumberErr" class="errors"
									style="color: red; float: right;"></span></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>
										Tender Notice Issued date <span class="red">*</span>
									</p></li>
								<li><input type="text" id="tenderNoticeIssuedDate"
										path="tenderNoticeIssuedDate" placeholder="DD/MM/YYYY" autocomplete="off"/> <span
									id="tenderNoticeIssuedDateErr" class="errors"
									style="color: red; float: right;"></span></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>
										Notice issuing authorities (SE/CE/ENC) <span class="red">*</span>
									</p></li>
								<li><form:select id="noticeIssuingAuthorities"
										path="noticeIssuingAuthorities.id">
										<form:option value="" selected="" disabled="">--Select Authorities --</form:option>
										<c:forEach var="auth" items="${authoritiesTypeList}">
											<form:option value="${auth.id}">${auth.name}</form:option>
										</c:forEach>
									</form:select> <span id="noticeIssuingAuthoritiesErr" class="errors"
									style="color: red; float: right;"></span></li>
							</ul>
						</div>
					</fieldset>


					<fieldset>
						<div class="fs-list-full">
							<h2 class="fs-title">Publication in News Paper</h2>

							<ul class="fs-list-details">
								<li><p>English Newspaper name</p></li>
								<li><form:input type="text" path="englishNewspaperName"
										id="englishNewspaperName"
										class="charcterId form-control mb-md"
										placeholder="English Newspaper name" /> <span
									id="englishNewspaperNameErr" class="errors"
									style="color: red; float: right;"></span></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>Date</p></li>
								<li><input type="text" path="engNewsPaperDate"
										id="engNewsPaperDate" placeholder="DD/MM/YYYY"  autocomplete="off"/> <span
									id="engNewsPaperDateErr" class="errors"
									style="color: red; float: right;"></span></li>
							</ul>

							<%-- <ul class="fs-list-details d-none">
								<li><p>soft copy upload - English (pdf/jpg/png)</p></li>
								<li><input type="file" name="engfile"
									id="englishPaperCopyLocationFile" multiple value="${engUpload}">
									<c:if test="${tenderingProcessObj.id!=null}">
										 <li> <img id="image" src="${engUpload}"   width="100" height="70"/> </li>
										<li><a href="${engUpload}" target="_self" id="engdocView"
											name="image">View Document</a></li>
									</c:if>  <form:input type="hidden" path="engUpload" class="form-control" id="engfileName" value="${tenderingProcessObj.engUpload}"></form:input>
									<span id="file_error1" class="errors"
									style="color: red; float: right;"></span></li>
							</ul> --%>
							
							
							<ul class="fs-list-details clearfix">

											<li><p>Upload Document</p></li>
											<li><label for="engPaperPublicationFile" class="fileuploadLabel" ${fn:length(engPublicationAttachements) >= fileUploadConstraint.maxFileUploadCount ? "style='cursor:not-allowed;'":""}>Select
													Files</label> <input type="file" name="file" id="engPaperPublicationFile" multiple
												class="form-control mb-md" data-target-table-id="engPaperPublicationDocumentFileTable" ${fn:length(engPublicationAttachements) >= fileUploadConstraint.maxFileUploadCount ? "disabled='true'":""}> <small
												class="counts">* file selected
													${fn:length(engPublicationAttachements)}/${fileUploadConstraint.maxFileUploadCount}</small></li>
										</ul>
										
										<div class="table-responsive" style="width:98%;">
								<table class="table table-hover mb-3 table-bordered" id="engPaperPublicationDocumentFileTable" data-target-file-id="engPaperPublicationFile">
									<thead class="thead-light">
										<tr>
											<th style="width: 5%">S.No.</th>
											<th style="width: 60%">Name</th>
											<th style="width: 10%">Size</th>
											<th style="width: 20%">Uploaded Date</th>
											<th style="width: 5%">Action</th>
										</tr>
									</thead>
									<tbody class="publicationDocumentsTableBody text-left">
										<c:forEach
											items="${engPublicationAttachements}"
											var="file" varStatus="loop">
											<c:set var="filePathParts"
												value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
											<tr data-attachment-id="${file.id}"
												data-file-size="${empty file.fileSize ? 0 : file.fileSize}">
												<td>${loop.index + 1}</td>
												<td>${filePathParts[fn:length(filePathParts)-1]}</td>
												<td>${file.convertFileSize}</td>
												<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm a"
														value="${empty file.updatedAt ? file.createdAt : file.updatedAt}" /></td>
												<td class="text-center"><a href="#" name="remove"><i
														class="fa fa-trash"></i></a>&nbsp;&nbsp;<a
													href="${pageContext.request.contextPath}${file.path}"
													target="_blank"><i class="fa fa-eye"></i></a></td>
											</tr>

										</c:forEach>
										<c:if test="${fn:length(engPublicationAttachements) == 0}">
											<tr data-is-noupload="true" data-attachment-id="-1">
												<td colspan="5">
													<p class="text-center pt-4 mb-4 notfound">No file
														uploads found</p>
												</td>
											</tr>
										</c:if>

									</tbody>
								</table>
							</div> 


							<ul class="fs-list-details">
								<li><p>Telugu Newspaper name</p></li>
								<li><form:input type="text" path="teluguNewspaperName"
										id="teluguNewspaperName" class="charcterId form-control mb-md"
										placeholder="Telugu Newspaper name" /> <span
									id="teluguNewspaperNameErr" class="errors"
									style="color: red; float: right;"></span></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>Date</p></li>
								<li><input type="text" path="telNewspaperDate"
										id="telNewspaperDate" placeholder="DD/MM/YYYY"  autocomplete="off"/> <span
									id="telNewspaperDateErr" class="errors"
									style="color: red; float: right;"></span></li>
							</ul>


							<%-- <ul class="fs-list-details d-none">
								<li><p>soft copy upload - Telugu (pdf/jpg/png)</p></li>
								<li><input type="file" name="telugufile"
									id="teluguPaperCopyLocationFile" multiple value="${telUpload}"
									class="form-control mb-md" /> <c:if
										test="${tenderingProcessObj.id!=null}">
										   <li> <img id="telimage" src="${telUpload}"   width="100" height="70"/> </li>
										<li><a href="${telUpload}" target="_self" id="teldocView"
											name="image">View Document</a></li>
									</c:if>  <form:input type="hidden" path="telUpload" class="form-control" id="telfileName" value="${tenderingProcessObj.telUpload}"></form:input>
									<span id="file_error2" class="errors"
									style="color: red; float: right;"></span></li>
							</ul> --%>

							<ul class="fs-list-details clearfix">

											<li><p>Upload Document</p></li>
											<li><label for="telPaperPublicationFile" class="fileuploadLabel" ${fn:length(teluguPublicationAttachements) >= fileUploadConstraint.maxFileUploadCount ? "style='cursor:not-allowed;'":""}>Select
													Files</label> <input type="file" name="file" id="telPaperPublicationFile" multiple
												class="form-control mb-md" data-target-table-id="telPaperPublicationDocumentFileTable" ${fn:length(teluguPublicationAttachements) >= fileUploadConstraint.maxFileUploadCount ? "disabled='true'":""}> <small
												class="counts">* file selected
													${fn:length(teluguPublicationAttachements)}/${fileUploadConstraint.maxFileUploadCount}</small></li>
										</ul>
										
										<div class="table-responsive" style="width:98%;">
								<table class="table table-hover mb-3 table-bordered" id="telPaperPublicationDocumentFileTable" data-target-file-id="telPaperPublicationFile">
									<thead class="thead-light">
										<tr>
											<th style="width: 5%">S.No.</th>
											<th style="width: 60%">Name</th>
											<th style="width: 10%">Size</th>
											<th style="width: 20%">Uploaded Date</th>
											<th style="width: 5%">Action</th>
										</tr>
									</thead>
									<tbody class="publicationDocumentsTableBody text-left">
										<c:forEach
											items="${teluguPublicationAttachements}"
											var="file" varStatus="loop">
											<c:set var="filePathParts"
												value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
											<tr data-attachment-id="${file.id}"
												data-file-size="${empty file.fileSize ? 0 : file.fileSize}">
												<td>${loop.index + 1}</td>
												<td>${filePathParts[fn:length(filePathParts)-1]}</td>
												<td>${file.convertFileSize}</td>
												<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm a"
														value="${empty file.updatedAt ? file.createdAt : file.updatedAt}" /></td>
												<td class="text-center"><a href="#" name="remove"><i
														class="fa fa-trash"></i></a>&nbsp;&nbsp;<a
													href="${pageContext.request.contextPath}${file.path}"
													target="_blank"><i class="fa fa-eye"></i></a></td>
											</tr>

										</c:forEach>
										<c:if test="${fn:length(teluguPublicationAttachements) == 0}">
											<tr data-is-noupload="true" data-attachment-id="-1">
												<td colspan="5">
													<p class="text-center pt-4 mb-4 notfound">No file
														uploads found</p>
												</td>
											</tr>
										</c:if>

									</tbody>
								</table>
							</div> 



							<ul class="fs-list-details">
								<li><p>Bid Start Date</p></li>
								<li><input type="text" path="bidStrartDate"
										id="bidStrartDate" placeholder="DD/MM/YYYY"  autocomplete="off"/> <span
									id="bidStrartDateErr" class="errors"
									style="color: red; float: right;"></span></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>Bid Closing Date</p></li>
								<li><input type="text" path="bidClosingDate"
										id="bidClosingDate" placeholder="DD/MM/YYYY"  autocomplete="off"/> <span
									id="bidClosingDateErr" class="errors"
									style="color: red; float: right;"></span></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>Bid Opening Date</p></li>
								<li><input type="text" path="bidOpeningDate"
										id="bidOpeningDate" placeholder="DD/MM/YYYY"  autocomplete="off"/> <span
									id="bidOpeningDateErr" class="errors"
									style="color: red; float: right;"></span></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>No of Bids received through Online</p></li>
								<li><form:input type="text" id="bidsReceived"
										path="bidsReceived" class="numberId form-control mb-md"
										placeholder="No of Bids" /> <span id="bidsReceivedErr"
									class="errors" style="color: red; float: right;"></span></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>No of Bidders Submitted Hard Copy</p></li>
								<li><form:input type="text" id="hardCopiesSubmitted"
										path="hardCopiesSubmitted" class="numberId form-control mb-md"
										placeholder="No of Bidders" /> <span
									id="hardCopiesSubmittedErr" class="errors"
									style="color: red; float: right;"></span></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>No of Bids qualified for Opening of Price Bid</p></li>
								<li><form:input type="text" path="bidsForPriceBid"
										class="numberId form-control mb-md" id="noofBidsQualified"
										placeholder="No of Bids" /> <span id="bidsForPriceBidErr"
									class="errors" style="color: red; float: right;"></span></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>Date of Evaluation Completed</p></li>
								<li><input type="text" id="dateOfEvaluationCompleted"
										path="dateOfEvaluationCompleted" placeholder="DD/MM/YYYY"  autocomplete="off"/>
									<span id="dateOfEvaluationCompletedErr" class="errors"
									style="color: red; float: right;"></span></li>
							</ul>



							<ul class="fs-list-details">
								<li><p>
										Estimated Contract Value (in Rs.)<span class="red">*</span>
									</p></li>
								<li><form:input type="text" id="contractValue"
										path="contractValue" class="form-control mb-md" maxlength="9"
										value="" placeholder="Estimated Contract Value" /> <span
									id="contractValueErr" class="errors"
									style="color: red; float: right;"></span></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>
										Contract Value quoted By L1 Bidder<span class="red">*</span>
									</p></li>
								<li><form:input type="text" id="contractValueByL1Bidder"
										path="contractValueByL1Bidder" maxlength="9" value=""
										class="form-control mb-md" /> <span
									id="contractValueByL1BidderErr" class="errors"
									style="color: red; float: right;"></span></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>
										Percentage quoted Less / Excess<span class="red">*</span>
									</p></li>
								<li><form:input type="text" id="percentageQuoted"
										path="percentageQuoted" maxlength="9" value=""
										class="charcterId form-control mb-md" /> <span
									id="percentageQuotedErr" class="errors"
									style="color: red; float: right;"></span></li>
							</ul>

							<ul class="fs-list-details "><!-- fs-list-full -->
								<li><p>Check Bid Status</p></li>
								<li><p class="pt-0">
										<form:radiobutton checked="checked" path="bidStatus" value="In Process" label="In Process"/>																														
										<form:radiobutton path="bidStatus" value="Bid Accepted" label="Bid Accepted"/>																			
										<form:radiobutton path="bidStatus" value="Bid Rejected" label="Bid Rejected"/>
									</p>
									<%-- <p>
										<form:radiobutton checked="checked" path="bidStatus" value="In Process" label="In Process"/>																					
									</p>
									<p>
										<form:radiobutton path="bidStatus" value="Bid Accepted" label="Bid Accepted"/>										
									</p>
									<p>
										<form:radiobutton path="bidStatus" value="Bid Rejected" label="Bid Rejected"/>
									</p> --%>																											
									 <span id="bidStatusErr" class="errors"
									style="color: red; float: right;"></span></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>Date of LOA Issued to Contractor</p></li>
								<li><input type="text" 
										id="dateOfLoaIssued" placeholder="DD/MM/YYYY"  autocomplete="off"/> <span
									id="dateOfLoaIssuedErr" class="errors"
									style="color: red; float: right;"></span></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>
										Name of the agency <span class="red">*</span>
									</p></li>
								<li><form:select id="agencyName" path="angencyName.id">
										<form:option value="" selected="" disabled="">--Select Agency --</form:option>
										<c:forEach var="agency" items="${agencyList}">
											<form:option value="${agency.id}">${agency.name}</form:option>
										</c:forEach>
									</form:select> <span id="agencyNameErr" class="errors"
									style="color: red; float: right;"></span></li>
							</ul>
						</div>

						<c:if test="${tenderingProcessObj.id==null}">
							<input type="submit" id="submit" name="next"
								class="next action-button" value="Save and Continue">
						</c:if>
						<c:if test="${tenderingProcessObj.id!=null}">
							<input type="submit" id="submit" name="next"
								class="next action-button" value="update and Continue">
						</c:if>
						<!-- <input type="submit" id="submit" name="next"
							class="next action-button" value="Save"> -->
					</fieldset>
					<form:input type="hidden" id="workid" path="work.id" />
				</form:form>
			</div>
		</div>
		<!-- /.MultiStep Form -->
	</div>
	</section> </main>

	<!--=== Footer ====-->
	<jsp:include page="online-mis-footer.jsp" />

	<script type="text/javascript">
	var onChange = false;
	$(document).ready(function(){
		$('#nav-process-tab').addClass('active');
		$('#nav-process').addClass('active');
	});
	var contextPath = "${pageContext.request.contextPath}";
	
	var english_paper_notification_module = "${englishPaperPublicationAttachmentModuleName}", telugu_paper_notification_module = "${teluguPaperPublicationAttachmentModuleName}", csrf_tokenName = "${_csrf.parameterName}", csrf_tokenvalue = "${_csrf.token}"

	var maxFileSize = ${fileUploadConstraint.maxFileUploadSize};
	var maxFileUploadCount = ${fileUploadConstraint.maxFileUploadCount};
	var allowedFileExtensions = "${fileUploadConstraint.allowedExtensions}".replace(/\s/g,'').split(",");

	var deleteDocumentFileUrl = "<c:url value='/upload/deleteFiles'/>", saveDocumentFileUrl = "<c:url value='/upload/files/${workObject.id}'/>";
	
	
	
	
		$(
				"#percentageQuoted,#bidsReceived,#hardCopiesSubmitted,#noofBidsQualified")
				.on('input', function() {
					this.value = this.value.match(/^\d+/);
				});

		$("#contractValue,#contractValueByL1Bidder").on('input', function() {
			this.value = this.value.match(/^\d+\.?\d{0,2}/);
		});
		$('#englishNewspaperName,#teluguNewspaperName').on('input', function() {
			$(this).val($(this).val().replace(/[^a-z ]/gi, ''));
		});
		$('#tenderNoticeNumber').on('input', function() {
			$(this).val($(this).val().replace(/[^a-z0-9]/gi, ''));
		});
		

		function isInvalidInput(input){
			return typeof input === "undefined" || input === null || input === "";
		}
		
		function isBidOpenDateAfterCloseDate(openDate, closeDate){

			if(!(isInvalidInput(openDate) && isInvalidInput(closeDate))){
				if(typeof openDate === "object"){
					if(moment.isDate(openDate)){
						openDate = new moment(openDate);
					}												
				}else if(typeof openDate === "string"){
					openDate = new moment(openDate, "DD-MM-YYYY");
				}
				
				// Open date is valid moment object or not
				if(!openDate.isValid()){
					console.log("Invalid date format");
					//invalid open date
					return -1;
				}
				
				if(typeof closeDate === "object"){
					if(moment.isDate(closeDate)){
						closeDate = new moment(closeDate);
					}												
				}else if(typeof closeDate === "string"){
					closeDate = new moment(closeDate, "DD-MM-YYYY");
				}
				
				// Close date is valid moment object or not
				if(!closeDate.isValid()){
					console.log("Invalid date format");
					//invalid close date
					return -2;
				}
				
				// Check bid openDate is before close Date or not
				if(openDate.isSameOrAfter(closeDate)){
					//open date is after close date
					return 1;
				}
				
				// open date is before close date
				return 0;
				
			}
			
			// None of the dates or one of the date is not taken
			return -3;
									
		}
		
		$("#submit")
				.click(
						function() {

							var workNumber = $("#workNumber").val();
							if (workNumber == "" || workNumber == null) {
								$("#workNumberErr").html(
										"Please Enter Work Number");
								return false;
							} else {
								$("#workNumberErr").html("");
							}

							var ifbPreperationDate = $("#ifbPreperationDate")
									.val();
							if (ifbPreperationDate == ""
									|| ifbPreperationDate == null) {
								$("#ifbPreperationDateErr").html("Please Enter Date");
								$("#ifbPreperationDate").focus();
								return false;
							} else {
								$("#ifbPreperationDateErr").html("");
							}

							var tenderNoticeNumber = $("#tenderNoticeNumber")
									.val();
							if (tenderNoticeNumber == ""
									|| tenderNoticeNumber == null) {
								$("#tenderNoticeNumberErr").html(
										"Please Enter Tender Notice Number");
								$("#tenderNoticeNumber").focus();
								return false;
							} else {
								$("#tenderNoticeNumberErr").html("");
							}

							var tenderNoticeIssuedDate = $(
									"#tenderNoticeIssuedDate").val();
							if (tenderNoticeIssuedDate == ""
									|| tenderNoticeIssuedDate == null) {
								$("#tenderNoticeIssuedDateErr").html(
										"Please Enter Date ");
								$("#tenderNoticeIssuedDate").focus();
								return false;
							} else {
								$("#tenderNoticeIssuedDateErr").html("");
							}
							
							var bidStartDate = $("#bidStrartDate").val();
							var bidCloseDate = $("#bidClosingDate").val();
							var statusBit = isBidOpenDateAfterCloseDate(bidStartDate, bidCloseDate);
							if(statusBit === 1){
								showWarnigModel("invalid Bid start and end dates","Bid start date should be before end date");
								return false;
							}
							
							
							
							var bidCloseDate = $("#bidOpeningDate").val();
							
							if ($("#noticeIssuingAuthorities option:selected")
									.val() == "") {
								$("#noticeIssuingAuthoritiesErr")
										.text(
												"Please Select Notice issuing authorities");
								$("#noticeIssuingAuthorities").focus();
								return false;
							} else {
								$("#noticeIssuingAuthoritiesErr").text("");
							}

							var contractValue = $("#contractValue").val();
							if (contractValue == "" || contractValue == null) {
								$("#contractValueErr").html(
										"Please Enter contract Value ");
								$("#contractValue").focus();
								return false;
							} else {
								$("#contractValueErr").html("");
							}

							var contractValueByL1Bidder = $(
									"#contractValueByL1Bidder").val();
							if (contractValueByL1Bidder == ""
									|| contractValueByL1Bidder == null) {
								$("#contractValueByL1BidderErr")
										.html(
												"Please Enter Contract Value quoted By L1 Bidder ");
								$("#contractValueByL1Bidder").focus();
								return false;
							} else {
								$("#contractValueByL1BidderErr").html("");
							}

							var percentageQuoted = $("#percentageQuoted").val();
							if (percentageQuoted == ""
									|| percentageQuoted == null) {
								$("#percentageQuotedErr").html(
										"Please Enter Percentage");
								$("#percentageQuoted").focus();
								return false;
							} else {
								$("#percentageQuotedErr").html("");
							}

							if ($("#agencyName option:selected").val() == "") {
								$("#agencyNameErr").text(
										"Please Select Name of the agency");
								$("#agencyName").focus();
								return false;
							} else {
								$("#agencyNameErr").text("");
							}
						});
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/js/libraries/moment.js"
		type="text/javascript"></script>
		 <script
		src="${pageContext.request.contextPath}/resources/js/uploadDocuments/tenderProcessPublicationDocuments.js"
		type="text/javascript"></script> 
</body>
</html>
