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
<title>SAAP : Preliminary preparation layout</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
<link
	href="${pageContext.request.contextPath}/resources/css/uploadDocuments/fileUploadDocuments.css"
	rel="stylesheet">
</head>
<body>
	<!--=== Header ====-->
	<jsp:include page="online-mis-header.jsp" />
	<main id="main"> <!--==========================
      Contact Us Section
    ============================-->

	<section id="contact" class="section-bg-con">
		<div class="container">
		<c:import url="/WEB-INF/jsp/online-mis-consultantTabView.jsp" />

		<div class="tab-content">

			<div class="tab-pane fade show" id="nav-admin" role="tabpanel"
				aria-labelledby="nav-admin-tab">
			<div class="row m-0">
				<div class="col-md-12">
					<c:url value="/geotechnicalInvestigation/create" var="createUrl" />
					<form id="msform" method="get" action="${createUrl }">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />

						<!-- fieldsets -->
						<fieldset>
							<div class="fs-list-full">
								<h2 class="fs-title">Works</h2>

								<ul class="fs-list-details">
									<li><p>
											Nature of Work <span class="red">*</span>
										</p></li>
									<li><input type="text" id="natureofwork"
										class="form-control mb-md" readonly="true"
										value="${work.natureOfWork.name}" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Work Number <span class="red">*</span>
										</p></li>
									<li><input type="text" id="worknum" title="1"
										class="form-control mb-md" readonly="true"
										value="${work.workNo}" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Name of the Work <span class="red">*</span>
										</p></li>
									<li><input type="text" id="nameofwork"
										class="form-control mb-md" readonly="true"
										value="${workLineItems.workDetails}" /></li>
								</ul>

							</div>
							<hr />
							<div class="fs-list-full">
								<h2 class="fs-title">Preliminary preparation layout
									documents</h2>
								<ul class="fs-list-details">
									<li><p>Upload Document</p></li>
									<li><label for="files" class="fileuploadLabel">Select
											Files</label> <input type="file" name="file" id="files" multiple
										class="form-control mb-md"> <small
										id="selectedFilesCount">* file selected
											${fn:length(preliminaryPreparationLayoutAttachmentFiles)}/${fileUploadConstraint.maxFileUploadCount}</small></li>
								</ul>
							</div>
							<br />
							<div class="table-responsive">
								<table class="table table-hover mb-3 table-bordered">
									<thead class="thead-light">
										<tr>
											<th style="width: 5%">S.No.</th>
											<th style="width: 50%">Name</th>
											<th style="width: 10%">Size</th>
											<th style="width: 18%">Uploaded Date</th>
											<th style="width: 12%">Status</th>
											<th style="width: 5%">Action</th>
										</tr>
									</thead>
									<tbody id="landDetailsAttachmentsTable" class=" text-left">
										<c:forEach
											items="${preliminaryPreparationLayoutAttachmentFiles}"
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

												<td><c:choose>

														<c:when test="${FILE_UPLOAD_APPROVED == file.status}">
															<span class="text-success"><i class="fa fa-check"></i>&nbsp;Approved</span>
														</c:when>

														<c:when test="${FILE_UPLOAD_REJECTED == file.status}">
															<span class="text-danger"><i class="fa fa-close"></i>&nbsp;Rejected</span>
														</c:when>

														<c:otherwise>
															<span class="text-muted"><i
																class="fa fa-hourglass"></i>&nbsp;Pending</span>
														</c:otherwise>
													</c:choose></td>

												<td class="text-center"><a href="#" name="remove"
													data-disabled="${FILE_UPLOAD_APPROVED == file.status ? 1 :0}"><i
														class="fa fa-trash ${FILE_UPLOAD_APPROVED == file.status ? 'text-muted cursor-not-allowed' :'' }"></i></a>&nbsp;&nbsp;<a
													href="${pageContext.request.contextPath}${file.path}"
													target="_blank"><i class="fa fa-eye"></i></a></td>
											</tr>

										</c:forEach>
										<c:if
											test="${fn:length(preliminaryPreparationLayoutAttachmentFiles) == 0}">
											<tr data-is-noupload="true" data-attachment-id="-1">
												<td colspan="6">
													<p class="text-center pt-4 mb-4 notfound">No file
														uploads found</p>
												</td>
											</tr>
										</c:if>

									</tbody>
								</table>
							</div>


							<input type="submit" id="submit" name="next"
								class="next action-button"
								value="${fn:length(preliminaryPreparationLayoutAttachmentFiles) == 0 ? 'Save' : 'Update'} and Continue">

							<input type="hidden" id="workid" value="${work.id}" />
						</fieldset>
					</form>

				</div>
			</div>
			<!-- /.MultiStep Form -->

		</div>
		</div>
		</div>
	</section>

	<!-- #contact --> </main>

	<script>
	
		var onChange = false;
	
    <c:if test="${landSurveyDetails.id != null}">
    var form = document.querySelector('#msform');
    form.addEventListener('change', function() {
    	onChange = true;
    });
    </c:if>
		$(document).ready(function() {
			updateTotalFileCount(${fn:length(preliminaryPreparationLayoutAttachmentFiles)});
			$("#msform").on('submit', function(e) {
				e.preventDefault();
				window.location.href = $(this).attr("action");
			})
			
			$('#nav-layouts-tab').addClass('active');
		     $('#nav-layouts').addClass('active');
		     /* $("#nav-investigation-tab").css({"background": "#02c05b !important;"}); */
		})

		//var filesList = [];
		
		var moduleName = "${moduleName}", csrf_tokenName = "${_csrf.parameterName}", csrf_tokenvalue = "${_csrf.token}"

				
		var maxFileSize = ${fileUploadConstraint.maxFileUploadSize};
		var maxFileUploadCount = ${fileUploadConstraint.maxFileUploadCount};
		var allowedFileExtensions = "${fileUploadConstraint.allowedExtensions}".replace(/\s/g,'').split(",");

		var deleteDocumentFileUrl = "<c:url value='/upload/deleteFiles'/>", saveDocumentFileUrl = "<c:url value='/upload/files'/>";
		var contextPath = "${pageContext.request.contextPath}";
		
		var FILE_UPLOAD_PENDING = "${FILE_UPLOAD_PENDING}",
		FILE_UPLOAD_APPROVED = "${FILE_UPLOAD_APPROVED}",
		FILE_UPLOAD_REJECTED="${FILE_UPLOAD_REJECTED}";
		
		var isFileUploadStatusColumnSupported = true;
		
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/js/libraries/moment.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/uploadDocuments/fileUploadDocuments.js"
		type="text/javascript"></script>
	<!--=== Footer ====-->
	<jsp:include page="online-mis-footer.jsp" />


</body>
</html>