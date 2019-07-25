<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>SAAP : Letter of Acceptance(LOA)</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
<link href="${pageContext.request.contextPath}/resources/css/uploadDocuments/fileUploadDocuments.css"
	rel="stylesheet">
</head>
<body>
 <!--=== Header ====-->
<jsp:include page="online-mis-header.jsp" />

<div class="container">
<div class="tab-content">
	<div class="tab-pane fade show" id="nav-land" role="tabpanel" aria-labelledby="nav-land-tab">
		<div class="row">
			<div class="col-md-12"> 
			              
				<c:url value="/letterOfAcceptance/save" var="createUrl" /> 
				<form:form id="msform" method="POST" action="${createUrl}"
					modelAttribute="letterOfAcceptance" enctype="multipart/form-data">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				             <c:choose>
									<c:when test="${!empty letterOfAcceptance.id}">
										<form:input type="hidden" path="id" class="form-control" id="id" ></form:input>
									</c:when>
								</c:choose>  
					<fieldset>
						<div class="fs-list-full">
							<h2 class="fs-title">Letter of Acceptance</h2>

							<ul class="fs-list-details">
								<li><p>Name<span class="red">*</span></p></li>
								<li><form:input type="text" id="name"
										path="name"  class="form-control mb-md alpha-and-spaces" maxlength="30"/> 
										<span id="nameErrMsg" class="errors"
									style="color: red; float: right;"></span></li>
							</ul>

							<ul class="fs-list-details">
                                <li><p>Upload Document</p></li>
								<li><label for="files" class="fileuploadLabel">Select
										Files</label> <input type="file" name="file" id="files" multiple
									class="form-control mb-md"> <small
									id="selectedFilesCount">* file selected
										${fn:length(attachments)}/${fileUploadConstraint.maxFileUploadCount}</small></li>
							</ul>
							
								<div class="table-responsive">
								<table class="table table-hover mb-3 table-bordered">
									<thead class="thead-light">
										<tr>
											<th style="width: 5%">S.No.</th>
											<th style="width: 60%">Name</th>
											<th style="width: 10%">Size</th>
											<th style="width: 20%">Uploaded Date</th>
											<th style="width: 5%">Action</th>
										</tr>
									</thead>
									<tbody id="landDetailsAttachmentsTable" class=" text-left">
										<c:forEach
											items="${attachments}"
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
										<c:if test="${fn:length(attachments) == 0}">
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
								value="${empty letterOfAcceptance.id ? 'Save' : 'Update'} and Continue">
								 
							
						</div>
					</fieldset>
					<form:input type="hidden" id="workid" path="work.id" />
				</form:form>
			</div>
		</div>
	</div>
</div>
</div>

    <!--=== Footer ====-->
	<jsp:include page="online-mis-footer.jsp" />
<script type="text/javascript">
var contextPath = "${pageContext.request.contextPath}";
$(document).ready(function(){
	updateTotalFileCount( ${fn:length(attachments)} );
});
var moduleName = "${moduleName}", csrf_tokenName = "${_csrf.parameterName}", csrf_tokenvalue = "${_csrf.token}"

var maxFileSize = ${fileUploadConstraint.maxFileUploadSize};
var maxFileUploadCount = ${fileUploadConstraint.maxFileUploadCount};
var allowedFileExtensions = "${fileUploadConstraint.allowedExtensions}".replace(/\s/g,'').split(",");

var deleteDocumentFileUrl = "<c:url value='/upload/deleteFiles'/>", saveDocumentFileUrl = "<c:url value='/upload/files'/>";

</script>
<script type="text/javascript">
$("#submit").click(function(){
	var name=$("#name").val();
	if(name=="" ||name==null){
		$("#nameErrMsg").html("Please enter name");
		$("#name").focus();
		return false;
	}else{
		$("#nameErrMsg").html(" ");
	}
	
})

</script>
<script src="${pageContext.request.contextPath}/resources/js/libraries/moment.js"
		type="text/javascript"></script>	
 <script src="${pageContext.request.contextPath}/resources/js/uploadDocuments/fileUploadDocuments.js"
		type="text/javascript"></script> 
</body>
</html>