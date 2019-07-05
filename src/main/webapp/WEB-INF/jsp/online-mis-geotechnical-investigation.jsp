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
<title>SAAP : Geotechnical investigation</title>
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
			<div class="row m-0">
				<div class="col-md-12">
					<c:url value="/geotechnicalInvestigation/save" var="createUrl" />
					<form:form id="msform" method="post" action="${createUrl }"
						modelAttribute="geotechnicalInvestigationDetails">
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
										value="${geotechnicalInvestigationDetails.work.natureOfWork.name}" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Work Number <span class="red">*</span>
										</p></li>
									<li><input type="text" id="worknum" title="1"
										class="form-control mb-md" readonly="true"
										value="${geotechnicalInvestigationDetails.work.workNo}" /></li>
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


								<h2 class="fs-title">Geotechnical investigation</h2>

								<ul class="fs-list-details">
									<li><p>
											Comments 
										</p></li>
									<li><form:textarea id="natureofwork"
											class="form-control mb-md" path="comments"
											placeHolder="Comments"></form:textarea></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Upload Document(pdf/jpg/png)</p></li>
									<li><label for="files" class="fileuploadLabel">Select
											Files</label> <input type="file" name="file" id="files" multiple
										class="form-control mb-md" accept=".pdf, .jpg, .png">
										<small id="selectedFilesCount">* file selected
											${fn:length(geotehnicalInvestigationLayoutAttachmentFiles)}</small></li>
								</ul>
							</div>
							<br />
							<div class="table-responsive">
								<table class="table table-hover mb-3 table-bordered">
									<thead class="thead-light">
										<tr>
											<th style="width: 5%">S.No.</th>
											<th style="width: 60%">Name</th>
											<th style="width: 30%">Upload on</th>
											<th style="width: 5%">Action</th>
										</tr>
									</thead>
									<tbody id="landDetailsAttachmentsTable" class=" text-left">
										<c:forEach
											items="${geotehnicalInvestigationLayoutAttachmentFiles}"
											var="file" varStatus="loop">
											<c:set var="filePathParts"
												value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
											<tr data-attachment-id="${file.id}">
												<td>${loop.index + 1}</td>
												<td>${filePathParts[fn:length(filePathParts)-1]}</td>
												<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm a"
														value="${empty file.updatedAt ? file.createdAt : file.updatedAt}" /></td>
												<td class="text-center"><a href="#" name="remove"><i
														class="fa fa-trash"></i></a>&nbsp;&nbsp;<a
													href="${pageContext.request.contextPath}${file.path}"
													target="_blank"><i class="fa fa-eye"></i></a></td>
											</tr>

										</c:forEach>
										<c:if test="${fn:length(filePathParts) == 0}">
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
								class="next action-button"
								value="${empty geotechnicalInvestigationDetails.id ? 'Save' : 'Update'} and Continue">

							<input type="hidden" id="workid" value="${work.id}" />
						</fieldset>

						<form:input type="hidden" path="id" />
						<form:input type="hidden" path="work.id" />
					</form:form>

				</div>
			</div>
			<!-- /.MultiStep Form -->

		</div>
	</section>

	<!-- #contact --> </main>

	<script>
		
		//var filesList = [];

		// vallid file extensions
		var allowedFileExtensions = [ '.pdf', '.jpg', '.png' ];

		var moduleName = "${moduleName}", csrf_tokenName = "${_csrf.parameterName}", csrf_tokenvalue = "${_csrf.token}"

		var maxFileSize = 1024 * 1024 * 2;

		var deleteDocumentFileUrl = "<c:url value='/upload/deleteFiles'/>", saveDocumentFileUrl = "<c:url value='/upload/files'/>";
		var contextPath = "${pageContext.request.contextPath}";
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/js/uploadDocuments/fileUploadDocuments.js"
		type="text/javascript"></script>
	<!--=== Footer ====-->
	<jsp:include page="online-mis-footer.jsp" />


</body>
</html>