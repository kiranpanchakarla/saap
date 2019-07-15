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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SAAP : Survey Of Land Details</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
<link
	href="${pageContext.request.contextPath}/resources/css/uploadDocuments/fileUploadDocuments.css"
	rel="stylesheet" />
<style>
/*.fileViewButton {
	line-height: 2.10;
}

.landDetailsAttachmentTableOuter {
	position: relative;
	padding-top: 2%;
	margin-right: 2%;
}

.tableCollapseButton {
	position: absolute;
	top: 2px;
	right: -15px;
	width: 30px;
	height: 30px;
	border: 1px solid #102b46;
	border-radius: 50%;
	box-shadow: 0px 0px 1px 1px #14274a;
	background: transparent;
}

 .tableCollapseButton:hover span {
	transform: translate(-50%, -50%) rotate(360deg);
	transition: transform .5s linear;
} 
.tableCollapseButton span {
	top: 50%;
	position: absolute;
	left: 50%;
	padding: 0px;
	transform: translate(-50%, -50%) rotate(0deg);
	transition: transform .5s linear;
}

.viewLandSurveyAttachmentTable {
	width: 0px;
	margin-left: 0px;
	visibility: hidden;
	transition: all .5s ease-out;
	transition-property: width, margin-left;
}

.openViewFileDiv .viewLandSurveyAttachmentTable {
	width: 109px;
	margin-left: 10px;
	visibility: visible;
	transition: all .25s ease-in;
	transition-property: width, margin-left;
}

.landDetailsAttachmentTableShow {
	height: auto;
	opacity: 1;
	visibility: visible;
	transition: all .5s ease-in;
}

.landDetailsAttachmentTableHide {
	height: 0;
	opacity: 0;
	visibility: hidden;
	transition: all .5s ease-out;
}

*/
</style>
</head>

<body>
	<!--=== Header ====-->
	<jsp:include page="online-mis-header.jsp" />
	<main id="main"> <!--==========================
      Contact Us Section
    ============================-->

	<section id="contact" class="section-bg-con">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<c:url value="/landSurveyDetails/save" var="createUrl" />
					<form:form id="msform" method="POST" action="${createUrl}"
						modelAttribute="landSurveyDetails" enctype="multipart/form-data">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />

						<!-- fieldsets -->
						<fieldset>
							<div class="fs-list-full">
								<h2 class="fs-title">Land details</h2>
								<ul class="fs-list-details">
									<li><p>
											Nature of Work <span class="red">*</span>
										</p></li>
									<li><input type="text" id="natureofwork"
										class="form-control mb-md" readonly="true"
										value="${landSurveyDetails.work.natureOfWork.name}" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Work Number <span class="red">*</span>
										</p></li>
									<li><input type="text" id="worknum" title="1"
										class="form-control mb-md" readonly="true"
										value="${landSurveyDetails.work.workNo}" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Name of the Work <span class="red">*</span>
										</p></li>
									<li><input type="text" id="nameofwork"
										class="form-control mb-md" readonly="true"
										value="${workLineItems.workDetails}" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Land Extend <span class="red">*</span>
										</p></li>
									<li><input type="text" id="LandExtended"
										class="form-control mb-md" readonly="true"
										value="${landSurveyDetails.landDetails.landExtend}" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Survey Number <span class="red">*</span>
										</p></li>
									<li><input type="text" id="SurveyNumber"
										class="form-control mb-md" readonly="true"
										value="${landSurveyDetails.landDetails.surveyNo}" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Field Mesurment Book Details <span class="red">*</span>
										</p></li>
									<li><input type="text" id="bookDetailsErr"
										class="form-control mb-md" readonly="true"
										value="${landSurveyDetails.landDetails.bookDetails}" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Type Of Land <span class="red">*</span>
										</p></li>
									<li><input type="text" id="typeOfLand"
										class="form-control mb-md" readonly="true"
										value="${landSurveyDetails.landDetails.typeOfLand.name}" /></li>
								</ul>

								<%-- <ul class="fs-list-details">
									<li><p>Uploaded Land Details Document</p></li>
									<li>
										<Button type="button" class="fileViewButton"
											id="viewUploadsLandDetails">
											<span>File&nbsp;uploads&nbsp;:&nbsp;${fn:length(landAttachmentFiles) }</span>
											<span>View files </span>
										</Button>
									</li>
								</ul> --%>


								<ul class="fs-list-details">
									<li><p>Uploaded Land Details Document</p></li>
									<li>
										<div class="tableresponsive">
											<table class="text-left readOnlyTable w-100">
												<thead>
													<tr>
														<th>S.no</th>
														<th>File</th>
														<th>Size</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${landAttachmentFiles}" var="file"
														varStatus="loop">
														<c:set var="filePathParts"
															value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
														<tr>
															<td>${loop.index + 1}</td>
															<td><a
																href="${pageContext.request.contextPath}${file.path}"
																target="_blank">${filePathParts[fn:length(filePathParts)-1]}</a>
															</td>
															<td>${file.convertFileSize}</td>
														</tr>

													</c:forEach>
													<c:if test="${fn:length(landAttachmentFiles) == 0}">
														<tr>
															<td colspan="4">
																<p class="text-center pt-4 mb-0">No attachments
																	found</p>
															</td>
														</tr>
													</c:if>

												</tbody>
											</table>
										</div>
									</li>
								</ul>







								<ul class="fs-list-details">
									<li><p>What is the Survey</p></li>
									<li><form:textarea id="surveycontent" path="surveycontent"
											placeholder="What is the survey!" class="form-control mb-md" />
										<span id="surveycontentErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Comments</p></li>
									<li><form:textarea id="comments" path="comments"
											placeholder="Comments" class="form-control mb-md" /> <span
										id="commentsErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Upload Document</p></li>
									<li><label for="files" class="fileuploadLabel mb-0">Select
											files</label> <input type="file" name="file" id="files" multiple
										class="d-none"> <small id="selectedFilesCount">*
											Files count :
											${fn:length(landSurveyAttachmentFiles)}/${fileUploadConstraint.maxFileUploadCount}</small></li>

								</ul>


								<%-- With show hide of view files button
								<ul class="fs-list-details">
									<li><p>Upload Land Details Document(pdf/jpg/png)</p></li>
									<li>
										<div class="d-flex flex-row">
											<div class="w-100">
												<label for="files" class="fileuploadLabel mb-0">Select
													files</label> <input type="file" name="file" id="files" multiple
													class="d-none"> <small id="selectedFilesCount">*
													Files count : ${fn:length(landSurveyAttachmentFiles)}</small>
											</div>
											<div class="viewLandSurveyAttachmentTable">
												<label class="fileuploadLabel  mb-0">View Files</label>
											</div>

										</div>

									</li>

								</ul> --%>
							</div>
							<div class="table-responsive landDetailsAttachmentTableShow">
								<div class="landDetailsAttachmentTableOuter">


									<!-- 
									table close button on top left to hide this table
									<button class="tableCollapseButton" type="button">
										<span> <i class="fa fa-close"></i></span>
									</button> -->

									<table class="table table-hover mb-3 table-bordered">
										<thead class="thead-light">
										<thead class="thead-light">
											<tr>
												<th style="width: 5%">S.No.</th>
												<th style="width: 50%">Name</th>
												<th style="width: 10%">Size</th>
												<th style="width: 18%">Upload on</th>
												<th style="width: 12%">Status</th>
												<th style="width: 5%">Action</th>
											</tr>
										</thead>
										</thead>

										<tbody id="landDetailsAttachmentsTable" class=" text-left">
											<c:forEach items="${landSurveyAttachmentFiles}" var="file"
												varStatus="loop">
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
											<c:if test="${fn:length(landSurveyAttachmentFiles) == 0}">
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

							</div>

							<input type="submit" id="submit" name="next"
								class="next action-button"
								value="${empty landSurveyDetails.id ? 'Save' : 'Update'} and Continue">
						</fieldset>
						<!-- Hiddend filds -->
						<form:input type="hidden" id="landId" path="landDetails.id" />

						<form:input type="hidden" id="workid" path="work.id" />


						<c:if test="${not empty landSurveyDetails.id}">
							<form:input type="hidden" id="landSurveyDetailsId" path="id" />
						</c:if>
					</form:form>


				</div>
			</div>
			<!-- /.MultiStep Form -->
		</div>




	</section>


	<div class="modal fade" id="landDetailsAttachmentsModalView"
		tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header"
					style="background-color: rgba(25, 163, 204, 0.8); color: #fff;">
					<h4 class="modal-title">Land details Attachments</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" style="margin-top: -9px; color: #fff;">
						<span aria-hidden="true">&times;</span>
					</button>

				</div>
				<div class="modal-body">
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
							<tbody id="landDetailsAttachmentsModalTable" class="">

								<c:forEach items="${landAttachmentFiles}" var="file"
									varStatus="loop">
									<c:set var="filePathParts"
										value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
									<tr data-file-size="2565423">
										<td>${loop.index+1}</td>
										<td>${filePathParts[fn:length(filePathParts)-1]}</td>
										<td>${file.convertFileSize}</td>
										<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm a"
												value="${empty file.updatedAt ? file.createdAt : file.updatedAt}" /></td>
										<td class="text-center"><a href="${file.path}"
											target="_blank"><i class="fa fa-eye"></i></a></td>
									</tr>

								</c:forEach>
								<c:if test="${fn:length(landAttachmentFiles) == 0}">
									<tr>
										<td colspan="5">
											<p class="text-center pt-4 mb-0">No attachments found</p>
										</td>
									</tr>
								</c:if>

							</tbody>
						</table>
					</div>


				</div>
				<div class="modal-footer mt-0" id="msform">
					<button type="button" class="action-button pb-2 pt-2"
						data-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal --> <!-- #contact --> </main>
	<!--=== Footer ====-->
	<jsp:include page="online-mis-footer.jsp" />


	<script>
		$(document).ready(function() {
			/*
			// Show uploaded files on model
			$("#viewUploadsLandDetails").off().on('click', function() {

				$("#landDetailsAttachmentsModalView").modal('show');
			});
			
			 */

			$(".tableCollapseButton").off().on('click', function() {

				toggleViewFileControllerButtonVisibilityHandler(false);
				landDetailsAttachmentTableVisibilityHandler(true);

			});

			$(".fileuploadLabel").off('click').on('click', '', function() {
				toggleViewFileControllerButtonVisibilityHandler(true);
				landDetailsAttachmentTableVisibilityHandler(false);
			});

		})

		function landDetailsAttachmentTableVisibilityHandler(state) {

			if (state) {
				$(".viewLandSurveyAttachmentTable").parent().addClass(
						"openViewFileDiv");
			} else {
				$(".viewLandSurveyAttachmentTable").parent().removeClass(
						"openViewFileDiv");
			}

		}

		function toggleViewFileControllerButtonVisibilityHandler(state) {

			var tableContainer = $(".tableCollapseButton").parent(
					".landDetailsAttachmentTableOuter").parent();

			if (state)
				tableContainer.addClass('landDetailsAttachmentTableShow')
						.removeClass("landDetailsAttachmentTableHide");
			else
				tableContainer.addClass("landDetailsAttachmentTableHide")
						.removeClass('landDetailsAttachmentTableShow');

		}

		//var filesList = [];

		// vallid file extensions
		/* var allowedFileExtensions = [ '.pdf', '.jpg', '.png' ]; */		
		
		
		 $(document).ready(function(){
			updateTotalFileCount( ${fn:length(landSurveyAttachmentFiles)} );
			
		}); 

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




</body>
</html>