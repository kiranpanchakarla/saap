<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Land details</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
<%-- <c:import url="/WEB-INF/jsp/online-mis-fileUpload.jsp" /> --%>
<link
	href="${pageContext.request.contextPath}/resources/css/uploadDocuments/fileUploadDocuments.css"
	rel="stylesheet">
</head>

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
              <h2 class="section-title">Land details</h2>
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
    ============================-->

	<section id="contact" class="section-bg-con">
		<div class="container">
			<%-- <c:if test="${!empty landDetails.id}"> --%>
			<c:import url="/WEB-INF/jsp/online-mis-tabView.jsp" />
			<%--   </c:if> --%>
			<div class="tab-content">
				<div class="tab-pane fade show" id="nav-land" role="tabpanel"
					aria-labelledby="nav-land-tab">
					<div class="row">
						<div class="col-md-12">
							<c:url value="/landDetails/save" var="createUrl" />
							<form:form id="msform" method="POST" action="${createUrl}"
								modelAttribute="landDetails" enctype="multipart/form-data">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<input type="hidden" id="moduleName" value="LANDDETAILS" />
								<form:input type="hidden" id="workid" path="work.id"
									value="${workObject.id}" />
								<c:choose>
									<c:when test="${!empty landDetails.id}">
										<form:input type="hidden" path="id" class="form-control"
											id="id"></form:input>
									</c:when>
								</c:choose>
								<!-- fieldsets -->
								<fieldset>
									<div class="fs-list-full">
										<h2 class="fs-title">Land details</h2>

										<ul class="fs-list-details">
											<li><p>
													Nature of Work <span class="red">*</span>
												</p></li>
											<li><form:input type="text" id="natureofwork"
													path="natureofwork" class="form-control mb-md"
													readonly="true" value="${workObject.natureOfWork.name}" /> <span
												id="natureofworkErr" class="errors"
												style="color: red; float: right;"></span></li>
										</ul>

										<ul class="fs-list-details">
											<li><p>
													Work Number <span class="red">*</span>
												</p></li>
											<li><form:input type="text" id="worknum" path="worknum"
													title="1" class="form-control mb-md" readonly="true"
													value="${workObject.workNo}" /> <span id="worknumErr"
												class="errors" style="color: red; float: right;"></span></li>
										</ul>

										<ul class="fs-list-details">
											<li><p>
													Name of the Work <span class="red">*</span>
												</p></li>
											<li><form:input type="text" id="nameofwork"
													path="nameofwork" title="Land work"
													class="form-control mb-md" readonly="true"
													value="${workLineItems.workDetails}" /> <span
												id="nameofworkErr" class="errors"
												style="color: red; float: right;"></span></li>
										</ul>

										<ul class="fs-list-details">
											<li><p>
													Land Extend <span class="red">*</span>
												</p></li>
											<li><form:input type="text" id="landExtend"
													path="landExtend" placeholder="Land Extend"
													class="form-control mb-md" /> <span id="landExtendErr"
												class="errors" style="color: red; float: right;"></span></li>
										</ul>

										<ul class="fs-list-details">
											<li><p>
													Survey Number <span class="red">*</span>
												</p></li>
											<li><form:input type="text" id="surveyNo"
													path="surveyNo" placeholder="Survey Number"
													class="form-control mb-md" /> <span id="surveyNoErr"
												class="errors" style="color: red; float: right;"></span></li>
										</ul>

										<ul class="fs-list-details">
											<li><p>
													Field Mesurment Book Details <span class="red">*</span>
												</p></li>
											<li><form:input type="text" id="bookDetails"
													path="bookDetails" placeholder="Mesurment Book Details"
													class="form-control mb-md" /> <span id="bookDetailsErr"
												class="errors" style="color: red; float: right;"></span></li>
										</ul>

										<ul class="fs-list-details">
											<li><p>
													Type Of Land <span class="red">*</span>
												</p></li>
											<li><form:select id="typeOfLand" path="typeOfLand.id">
													<form:option value="" selected="" disabled="">--Select Land Type --</form:option>
													<c:forEach var="land" items="${LandTypeList}">
														<form:option value="${land.id}">${land.name}</form:option>
													</c:forEach>
												</form:select> <br>
											<span id="typeOfLandErr" class="errors"
												style="color: red; float: right;"></span></li>
										</ul>


										<%-- <form method="POST"  id="fileUploadForm"> 
                 <ul class="fs-list-details">
                <li><p>Upload Land Details Document(pdf/jpg/png)<span class="red">*</span></p>
                <label for="files"  class="fileuploadLabel">Upload Image</label>
                <input type="file" name="file" id="files" style="display: none" accept=".png, .jpg, .jpeg, .pdf" value="${filePath}" multiple="multiple"> 
                <table id="filedetails"></table>
	            </li>
                <span id="file_error" class="errors" style="color:red;float:right;"></span>
                </ul>
                </form> --%>

										<ul class="fs-list-details">

											<li><p>Upload
													Document(${fn:replace(fileUploadConstraint.allowedExtensions,', ','/')})</p></li>
											<li><label for="files" class="fileuploadLabel">Select
													Files</label> <input type="file" name="file" id="files" multiple
												class="form-control mb-md"> <small
												id="selectedFilesCount">* file selected
													${fn:length(geotehnicalInvestigationLayoutAttachmentFiles)}/${fileUploadConstraint.maxFileUploadCount}</small></li>
										</ul>
										
										<div class="table-responsive">
								<table class="table table-hover mb-3 table-bordered">
									<thead class="thead-light">
										<tr>
											<th style="width: 5%">S.No.</th>
											<th style="width: 60%">Name</th>
											<th style="width: 10%">Size</th>
											<th style="width: 20%">Upload on</th>
											<th style="width: 5%">Action</th>
										</tr>
									</thead>
									<tbody id="landDetailsAttachmentsTable" class=" text-left">
										<c:forEach
											items="${landAttachmentFiles}"
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
										<c:if test="${fn:length(landAttachmentFiles) == 0}">
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
							
							<input type="submit" id="submit" name="next"
								class="next action-button float-right"
								value="${empty landDetails.id ? 'Save and Continue' : 'Home'} ">

									</div>
									<%-- <c:if test="${landDetails.id==null}">
										<input type="submit" id="submit" name="next"
											class="next action-button" value="Save and Continue">
									</c:if>
									<c:if test="${landDetails.id!=null}">
										<input type="submit" id="submit" name="next"
											class="next action-button" value="Home">
									</c:if> --%>
								</fieldset>

							</form:form>


						</div>
					</div>
					<!-- /.MultiStep Form -->


				</div>
	</section>




	<!-- #contact --> </main>

	<!--=== Footer ====-->
	<jsp:include page="online-mis-footer.jsp" />

<script type="text/javascript">
var contextPath = "${pageContext.request.contextPath}";
$(document).ready(function(){
	updateTotalFileCount( ${fn:length(adminAttachmentFiles)} );
	$('#nav-land-tab').addClass('active');
	 $('#nav-land').addClass('active');
});

var moduleName = "${moduleName}", csrf_tokenName = "${_csrf.parameterName}", csrf_tokenvalue = "${_csrf.token}"

var maxFileSize = ${fileUploadConstraint.maxFileUploadSize};
var maxFileUploadCount = ${fileUploadConstraint.maxFileUploadCount};
var allowedFileExtensions = "${fileUploadConstraint.allowedExtensions}".replace(/\s/g,'').split(",");

var deleteDocumentFileUrl = "<c:url value='/upload/deleteFiles'/>", saveDocumentFileUrl = "<c:url value='/upload/files'/>";

</script>

	<script type="text/javascript">
		$("#landExtend,#bookDetails,#surveyNo").on('input', function() {
			$(this).val($(this).val().replace(/[^a-z0-9 ]/gi, ''));
		})
		$("#submit").click(function() {

			var natureofwork = $("#natureofwork").val();
			if (natureofwork == "" || natureofwork == null) {
				$("#natureofworkErr").html("Please Enter Nature of Work ");
				$("#natureofwork").focus();
				return false;
			} else {
				$("#natureofworkErr").html("");
			}

			var worknum = $("#worknum").val();
			if (worknum == "" || worknum == null) {
				$("#worknumErr").html("Please Enter Work Number");
				$("#worknum").focus();
				return false;
			} else {
				$("#worknumErr").html("");
			}

			/*    var nameofwork=$("#nameofwork").val();
			 if(nameofwork=="" || nameofwork==null){
			 $("#nameofworkErr").html("Please Enter Name of the Work ");
			 return false;
			 }else{
			 $("#nameofworkErr").html("");
			 }  */

			var landExtend = $("#landExtend").val();
			if (landExtend == "" || landExtend == null) {
				$("#landExtendErr").html("Please Enter Land Extend");
				$("#landExtend").focus();
				return false;
			} else {
				$("#landExtendErr").html("");
			}

			var surveyNo = $("#surveyNo").val();
			if (surveyNo == "" || surveyNo == null) {
				$("#surveyNoErr").html("Please Enter Survey Number ");
				$("#surveyNo").focus();
				return false;
			} else {
				$("#surveyNoErr").html("");
			}

			var bookDetails = $("#bookDetails").val();
			if (bookDetails == "" || bookDetails == null) {
				$("#bookDetailsErr").html("Please Enter Book Details");
				$("#bookDetails").focus();
				return false;
			} else {
				$("#bookDetailsErr").html("");
			}

			if ($("#typeOfLand option:selected").val() == "") {
				$("#typeOfLandErr").text("Please Select Type Of Land ");
				$("#typeOfLand").focus();
				return false;
			} else {
				$("#typeOfLandErr").text("");
			}

			 

		})
		 
	</script>
<script
		src="${pageContext.request.contextPath}/resources/js/libraries/moment.js"
		type="text/javascript"></script>	
 <script
		src="${pageContext.request.contextPath}/resources/js/uploadDocuments/fileUploadDocuments.js"
		type="text/javascript"></script> 	 
</body>
</html>
