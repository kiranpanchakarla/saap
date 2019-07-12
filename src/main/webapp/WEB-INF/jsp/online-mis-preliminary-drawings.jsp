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

<style type="text/css">
table tr td > a{
margin-left: 10px;
}
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
					<c:url value="/preliminaryDrawings/sendforApproval" var="createUrl" />
					<form id="msform" method="post" action="${createUrl}">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />

						<!-- fieldsets -->
						<fieldset>
							<div class="fs-list-full">
								<h2 class="fs-title">Works</h2>

								<ul class="fs-list-details">
									<li><p>Nature of Work</p></li>
									<li><input type="text" id="natureofwork"
										class="form-control mb-md" readonly="true"
										value="${work.natureOfWork.name}" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Work Number</p></li>
									<li><input type="text" id="worknum" title="1"
										class="form-control mb-md" readonly="true"
										value="${work.workNo}" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Name of the Work</p></li>
									<li><input type="text" id="nameofwork"
										class="form-control mb-md" readonly="true"
										value="${workLineItems.workDetails}" /></li>
								</ul>

							</div>

						</fieldset>


						<fieldset>
							<div class="fs-list-full">
								<h2 class="fs-title">Consultant Information</h2>

								<ul class="fs-list-details">
									<li><p>Name of Consultant Firm</p></li>
									<li><input type="text" title="consultant-firm"
										id="consultant_firm" value="${consultant.consultant_firm}"
										class="form-control mb-md"
										placeholder="Name of Consultant Firm" readonly="true" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>PAN Number</p></li>
									<li><input type="text" title="pan-number" id="pan_number"
										value="${consultant.pan_number}" class="form-control mb-md"
										placeholder="PAN Number" readonly="true" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>TIN Number</p></li>
									<li><input type="text" title="tin-number" id="tin_number"
										value="${consultant.tin_number}" class="form-control mb-md"
										readonly="true" placeholder="TIN Number" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Mobile Number</p></li>
									<li><input type="text" title="mobile-number"
										id="mobile_no" value="${consultant.mobile_no}" readonly="true"
										maxlength="10" class="form-control mb-md"
										placeholder="Mobile Number" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Landline Number</p></li>
									<li><input type="text" title="landline-number"
										id="landline_no" value="${consultant.landline_no}"
										readonly="true" maxlength="10" class="form-control mb-md"
										placeholder="landline Number" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Email Id</p></li>
									<li><input type="text" title="email-id" id="emailId"
										value="${consultant.emailId}" readonly="true"
										class="form-control mb-md" placeholder="Email Number" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Address</p></li>
									<li><textarea title="address" id="address" readonly="true"
											class="form-control mb-md" placeholder="Address">${consultant.address}</textarea>
									</li>
								</ul>
							</div>
							<div class="fs-list-full mt-4">

								<h2 class="fs-title">Bank Details of Firm</h2>

								<ul class="fs-list-details">
									<li><p>Bank</p></li>
									<li><input type="text" title="bank" id="bank"
										value="${consultant.bank_name}" readonly="true"
										class="form-control mb-md" placeholder="Bank" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Branch</p></li>
									<li><input type="text" title="branch" id="branch"
										value="${consultant.branch}" readonly="true"
										class="form-control mb-md" placeholder="Branch" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Account Type</p></li>
									<li><input type="text" title="account-type"
										id="account_type" value="${consultant.account_type}"
										readonly="true" class="form-control mb-md"
										placeholder="Account Type" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>A/c Number</p></li>
									<li><input type="text" title="account-number"
										id="account_number" value="${consultant.account_number}"
										readonly="true" class="form-control mb-md"
										placeholder="Account Number" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>IFSC Code</p></li>
									<li><input type="text" title="ifsc-code" id="ifsc_code"
										value="${consultant.ifsc_code}" readonly="true"
										class="form-control mb-md" placeholder="IFSC Code" /></li>
								</ul>

							</div>
						</fieldset>



						<fieldset>
							<div class="fs-list-full">
								<h2 class="fs-title">Land survey details</h2>

								<ul class="fs-list-details">
									<li><p>Land Extend</p></li>
									<li><input type="text" id="LandExtended"
										class="form-control mb-md" readonly="true"
										value="${landSurveyDetails.landDetails.landExtend}" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Survey Number</p></li>
									<li><input type="text" id="SurveyNumber"
										class="form-control mb-md" readonly="true"
										value="${landSurveyDetails.landDetails.surveyNo}" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Field Mesurment Book Details</p></li>
									<li><input type="text" id="bookDetailsErr"
										class="form-control mb-md" readonly="true"
										value="${landSurveyDetails.landDetails.bookDetails}" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Type Of Land</p></li>
									<li><input type="text" id="typeOfLand"
										class="form-control mb-md" readonly="true"
										value="${landSurveyDetails.landDetails.typeOfLand.name}" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>What is the Survey</p></li>
									<li><textarea id="surveycontent" readonly="true"
											placeholder="What is the survey!" class="form-control mb-md">${landSurveyDetails.surveycontent}</textarea>
										<span id="surveycontentErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Comments</p></li>
									<li><textarea id="comments" readonly="true"
											placeholder="Comments" class="form-control mb-md">${landSurveyDetails.comments}</textarea>
										<span id="commentsErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Uploaded Land Details Document</p></li>
									<li>
										<div class="tableresponsive">
											<table class="text-left readOnlyTable w-100">
												<!-- <thead>
													<tr>
														<th>S.no</th>
														<th>File</th>
														<th>Size</th>
													</tr>
												</thead> -->
												<tbody>
													<c:forEach items="${landAttachmentFiles}" var="file"
														varStatus="loop">
														<c:set var="filePathParts"
															value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
														<tr class="landDetailsUploadDocuments">
															<td>${loop.index + 1}</td>
															<td><a
																href="${pageContext.request.contextPath}${file.path}"
																target="_blank">${filePathParts[fn:length(filePathParts)-1]}</a></td>

															<td>${file.convertFileSize}</td>
														</tr>

													</c:forEach>
													<c:if test="${fn:length(landAttachmentFiles) == 0}">
														<tr class="landDetailsUploadDocuments">
															<td colspan="3">
																<p class="text-center p-4 mb-0">No attachments found</p>
															</td>
														</tr>
													</c:if>
												</tbody>
											</table>
										</div>
									</li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Uploaded Land Survey Details Document</p></li>
									<li>
										<div class="tableresponsive">
											<table class="text-left readOnlyTable w-100">
												<!-- <thead>
													<tr>
														<th>S.no</th>
														<th>File</th>
														<th>Size</th>
														<th>Status</th>
													</tr>
												</thead> -->
												<tbody>
													<c:forEach items="${landSurveyAttachmentFiles}" var="file"
														varStatus="loop">
														<c:set var="filePathParts"
															value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
														<tr class="landSurveyDetailsUploadDocuments">
															<td>${loop.index + 1}</td>
															<td><a
																href="${pageContext.request.contextPath}${file.path}"
																target="_blank">${filePathParts[fn:length(filePathParts)-1]}</a>
															</td>
															<td>${file.convertFileSize}</td>
															<td><c:choose>

																<c:when test="${FILE_UPLOAD_APPROVED == file.status}">
																	<span class="text-success"><i class="fa fa-check"></i>&nbsp;Approved</span>
         													</c:when>

																<c:when test="${FILE_UPLOAD_REJECTED == file.status}">
																	<span class="text-danger"><i class="fa fa-close"></i>&nbsp;Rejected</span>
         													</c:when>

																<c:otherwise>
																	<span class="text-muted"><i class="fa fa-hourglass"></i>&nbsp;Pending</span>
         													</c:otherwise>
															</c:choose></td>
														</tr>

													</c:forEach>
													<c:if test="${fn:length(landSurveyAttachmentFiles) == 0}">
														<tr class="landSurveyDetailsUploadDocuments">
															<td colspan="4">
																<p class="text-center p-4 mb-0">No attachments found</p>
															</td>
														</tr>
													</c:if>
												</tbody>
											</table>
										</div>

									</li>
								</ul>



								<%--
								show hide button for file upload model handling
								 <ul class="fs-list-details">
									<li><p>
											Uploaded Land Details Document 
										</p></li>
									<li>
										<Button type="button" class="fileViewButton"
											id="landAttachmentFiles" class="btn btn-block">
											<span>file&nbsp;uploads&nbsp;&nbsp;:${fn:length(landAttachmentFiles) }
											</span> <span>View files </span>
											<span>file uploads&nbsp;:
												${fn:length(landAttachmentFiles) == 0 ? 'No' : fn:length(landAttachmentFiles)  }
											</span>

										</Button>
									</li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Uploaded Land Survey Details Document 
										</p></li>
									<li>
										<Button type="button" class="fileViewButton"
											id="landSurveyAttachmentFiles" class="btn btn-block">

											<span>file uploads&nbsp;:
												${fn:length(landSurveyAttachmentFiles) == 0 ? 'No' : fn:length(landSurveyAttachmentFiles)  }
											</span>
											<span>file&nbsp;uploads&nbsp;&nbsp;:${fn:length(landSurveyAttachmentFiles) }
											</span><span>View files </span>
										</Button>
									</li>
								</ul> --%>

							</div>

						</fieldset>

						<fieldset>
							<div class="fs-list-full">
								<h2 class="fs-title">Preliminary preparation layout</h2>

								<ul class="fs-list-details">
									<li><p>Uploaded preliminary prepartion layout Document
										</p></li>
									<li>
										<div class="tableresponsive">
											<table class="text-left readOnlyTable w-100">
												<!-- <thead>
													<tr>
														<th>S.no</th>
														<th>File</th>
														<th>Size</th>
														<th>Status</th>
													</tr>
												</thead> -->
												<tbody>
													<c:forEach items="${PPLayoutAttachmentFiles}" var="file"
														varStatus="loop">
														<c:set var="filePathParts"
															value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
														<tr class="PPLayoutUploadDocuments">
															<td>${loop.index + 1}</td>
															<td><a
																href="${pageContext.request.contextPath}${file.path}"
																target="_blank">${filePathParts[fn:length(filePathParts)-1]}</a>
															</td>
															<td>${file.convertFileSize}</td>
															<td><c:choose>

																<c:when test="${FILE_UPLOAD_APPROVED == file.status}">
																	<span class="text-success"><i class="fa fa-check"></i>&nbsp;Approved</span>
         													</c:when>

																<c:when test="${FILE_UPLOAD_REJECTED == file.status}">
																	<span class="text-danger"><i class="fa fa-close"></i>&nbsp;Rejected</span>
         													</c:when>

																<c:otherwise>
																	<span class="text-muted"><i class="fa fa-hourglass"></i>&nbsp;Pending</span>
         													</c:otherwise>
															</c:choose></td>

														</tr>

													</c:forEach>
													<c:if test="${fn:length(PPLayoutAttachmentFiles) == 0}">
														<tr class="PPLayoutUploadDocuments">
															<td colspan="4">
																<p class="text-center p-4 mb-0">No attachments found</p>
															</td>
														</tr>
													</c:if>


												</tbody>
											</table>
										</div>
									</li>
								</ul>



								<%-- <ul class="fs-list-details">
									<li><p>
											Uploaded preliminary prepartion layout Document <span
												class="red">*</span>
										</p></li>
									<li>
										<Button type="button" class="fileViewButton"
											id="PPLayoutAttachmentFiles" class="btn btn-block">

											<span>file uploads&nbsp;:
											${fn:length(PPLayoutAttachmentFiles) == 0 ? 'No' : fn:length(PPLayoutAttachmentFiles)  }
										</span>
											<span>file&nbsp;uploads&nbsp;&nbsp;: ${ fn:length(PPLayoutAttachmentFiles)  }</span>
											<span>View files </span>
										</Button>
									</li>
								</ul> --%>
							</div>
						</fieldset>

						<fieldset>
							<div class="fs-list-full">
								<h2 class="fs-title">Geotechnical investigation</h2>



								<ul class="fs-list-details">
									<li><p>Comments</p></li>
									<li><textarea id="natureofwork" class="form-control mb-md"
											readonly="true" placeHolder="Comments">${geotechnicalInvestigation.comments}</textarea></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Uploaded geotehnical investigation Document</p></li>
									<li>
										<table class="text-left readOnlyTable">
											<tbody>
												<c:forEach items="${GIAttachmentFiles}" var="file"
													varStatus="loop">
													<c:set var="filePathParts"
														value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
													<tr class="GIUploadDocuments">
														<td>${loop.index + 1}</td>
														<td><a
															href="${pageContext.request.contextPath}${file.path}"
															target="_blank">${filePathParts[fn:length(filePathParts)-1]}</a>
														</td>
														<td>${file.convertFileSize}</td>
														<td><c:choose>

																<c:when test="${FILE_UPLOAD_APPROVED == file.status}">
																	<span class="text-success"><i class="fa fa-check"></i>&nbsp;Approved</span>
         													</c:when>

																<c:when test="${FILE_UPLOAD_REJECTED == file.status}">
																	<span class="text-danger"><i class="fa fa-close"></i>&nbsp;Rejected</span>
         													</c:when>

																<c:otherwise>
																	<span class="text-muted"><i class="fa fa-hourglass"></i>&nbsp;Pending</span>
         													</c:otherwise>
															</c:choose></td>
													</tr>

												</c:forEach>
												<c:if test="${fn:length(GIAttachmentFiles) == 0}">
													<tr class="GIUploadDocuments">
														<td colspan="4">
															<p class="text-center pt-4 mb-0">No attachments found</p>
														</td>
													</tr>
												</c:if>
											</tbody>
										</table>
									</li>
								</ul>



								<%-- <ul class="fs-list-details">
									<li><p>
											Uploaded geotehnical investigation Document 
										</p></li>
									<li><button type="button" id="GIAttachmentFiles"
											class="fileViewButton" class="btn btn-block">
											<span>file&nbsp;uploads&nbsp;&nbsp;:${fn:length(GIAttachmentFiles)}</span>
											<span>View files </span>
											<span>file uploads&nbsp;:
											${fn:length(GIAttachmentFiles) == 0 ? 'No' : fn:length(GIAttachmentFiles)  }</span>
										</button></li>
								</ul> --%>




							</div>
						</fieldset>

						<c:if test="${SAAP_APPROVED_STATUS eq work.workStatus}">
							<input type="button" id="approved" name="next" disabled="true"
								class="next action-button" value="Approved">
							<input type="button" id="backToHome" name="next"
								class="next action-button" value="Home">
						</c:if>

						<c:if test="${PENDING_SAAP_APPROVAL eq work.workStatus}">
							<input type="button" id="backToHome" name="next"
								class="next action-button" value="Home">
						</c:if>

						<c:if
							test="${!(SAAP_APPROVED_STATUS eq work.workStatus) and !(PENDING_SAAP_APPROVAL eq work.workStatus)}">
							<input type="submit" id="submit" name="next"
								class="next action-button" value="Send for approval">
						</c:if>


					</form>

				</div>
			</div>
		</div>
		<!-- /.MultiStep Form -->


	</section>


	<%-- 
	Modal for show uploaded files based on selected file upload button
	<div class="modal fade" id="fileUploadsModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header"
					style="background-color: rgba(25, 163, 204, 0.8); color: #fff;">
					<h4 class="modal-title" id="landDetailsUploadDocumentsHeader"
						class="d-none">Land details Attachments</h4>
					<h4 class="modal-title" id="landSurveyDetailsUploadDocumentsHeader"
						class="d-none">Land Survey details Attachments</h4>
					<h4 class="modal-title" id="PPLayoutUploadDocumentsHeader"
						class="d-none">Preliminary preparation layout Attachments</h4>
					<h4 class="modal-title" id="GIUploadDocumentsHeader" class="d-none">Geotechnical
						Investigation Attachments</h4>
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
									<th width="5%">S.No.</th>
									<th>Name</th>
									<th width="30%">Upload on</th>
									<th width="5%">Action</th>
								</tr>
							</thead>
							<tbody id="fileUploadsModalTable" class="">
								<c:forEach items="${landAttachmentFiles}" var="file"
									varStatus="loop">
									<c:set var="filePathParts"
										value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
									<tr class="landDetailsUploadDocuments">
										<td>${loop.index+1}</td>
										<td>${filePathParts[fn:length(filePathParts)-1]}</td>
										<td>${fn:length(filePathParts)}</td>
										<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm a"
												value="${empty file.updatedAt ? file.createdAt : file.updatedAt}" /></td>
										<td class="text-center"><a
											href="${pageContext.request.contextPath}${file.path}"
											target="_blank" id="docView" name="image"><i
												class="fa fa-eye"></i></a></td>
									</tr>

								</c:forEach>
								<c:if test="${fn:length(filePathParts) == 0}">
									<tr class="landDetailsUploadDocuments">
										<td colspan="4">
											<p class="text-center p-4 mb-0">No attachments found</p>
										</td>
									</tr>
								</c:if>

								<c:forEach items="${landSurveyAttachmentFiles}" var="file"
									varStatus="loop">
									<c:set var="filePathParts"
										value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
									<tr class="landSurveyDetailsUploadDocuments">
										<td>${loop.index+1}</td>
										<td>${filePathParts[fn:length(filePathParts)-1]}</td>
										<td>${fn:length(filePathParts)}</td>
										<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm a"
												value="${empty file.updatedAt ? file.createdAt : file.updatedAt}" /></td>
										<td class="text-center"><a
											href="${pageContext.request.contextPath}${file.path}"
											target="_blank" id="docView" name="image"><i
												class="fa fa-eye"></i></a></td>
									</tr>

								</c:forEach>
								<c:if test="${fn:length(landSurveyAttachmentFiles) == 0}">
									<tr class="landSurveyDetailsUploadDocuments">
										<td colspan="4">
											<p class="text-center p-4 mb-0">No attachments found</p>
										</td>
									</tr>
								</c:if>


								<c:forEach items="${PPLayoutAttachmentFiles}" var="file"
									varStatus="loop">
									<c:set var="filePathParts"
										value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
									<tr class="PPLayoutUploadDocuments">
										<td>${loop.index+1}</td>
										<td>${filePathParts[fn:length(filePathParts)-1]}</td>
										<td>${fn:length(filePathParts)}</td>
										<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm a"
												value="${empty file.updatedAt ? file.createdAt : file.updatedAt}" /></td>
										<td class="text-center"><a
											href="${pageContext.request.contextPath}${file.path}"
											target="_blank" id="docView" name="image"><i
												class="fa fa-eye"></i></a></td>
									</tr>

								</c:forEach>
								<c:if test="${fn:length(PPLayoutAttachmentFiles) == 0}">
									<tr class="PPLayoutUploadDocuments">
										<td colspan="4">
											<p class="text-center p-4 mb-0">No attachments found</p>
										</td>
									</tr>
								</c:if>

								<c:forEach items="${GIAttachmentFiles}" var="file"
									varStatus="loop">
									<c:set var="filePathParts"
										value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
									<tr class="GIUploadDocuments">
										<td>${loop.index+1}</td>
										<td>${filePathParts[fn:length(filePathParts)-1]}</td>
										<td>${fn:length(filePathParts)}</td>
										<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm a"
												value="${empty file.updatedAt ? file.createdAt : file.updatedAt}" /></td>
										<td class="text-center"><a
											href="${pageContext.request.contextPath}${file.path}"
											target="_blank" id="docView" name="image"><i
												class="fa fa-eye"></i></a></td>
									</tr>

								</c:forEach>
								<c:if test="${fn:length(GIAttachmentFiles) == 0}">
									<tr class="GIUploadDocuments">
										<td colspan="4">
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
			
		</div>
		
	</div> --%> <!-- #contact --> </main>
	<!--=== Footer ====-->
	<jsp:include page="online-mis-footer.jsp" />

	<script>
		<c:if test="${SAAP_APPROVED_STATUS eq work.workStatus || PENDING_SAAP_APPROVAL eq work.workStatus}">

		$(document).ready(function() {

			$("#backToHome").click(function() {
				<c:url value="/adminloggedin" var="homeUrl" />
				window.location.href = "${homeUrl}"
			});
		});

		</c:if>

		/* files show hide on model and filter rows based on selected attachment details button
		$(".fileViewButton")
				.on(
						'click',
						function() {
							var id = $(this).attr("id");
							var filterdTrClass = "";
							var filterdHeaderClass = "";

							switch (id) {

							case 'GIAttachmentFiles':
								filterdTrClass = "GIUploadDocuments";
								filterdHeaderClass = "GIUploadDocumentsHeader";
								break;
							case 'PPLayoutAttachmentFiles':
								filterdTrClass = "PPLayoutUploadDocuments";
								filterdHeaderClass = "PPLayoutUploadDocumentsHeader";
								break;
							case 'landSurveyAttachmentFiles':
								filterdTrClass = "landSurveyDetailsUploadDocuments";
								filterdHeaderClass = "landSurveyDetailsUploadDocumentsHeader";
								break;
							case 'landAttachmentFiles':
								filterdTrClass = "landDetailsUploadDocuments";
								filterdHeaderClass = "landDetailsUploadDocumentsHeader";
								break;

							}

							$("#fileUploadsModal")
									.off()
									.on(
											'show.bs.modal',
											function() {
												$(this)
														.find(
																".modal-header h4")
														.addClass("d-none")
														.filter(
																function() {
																	return $(
																			this)
																			.attr(
																					"id") === filterdHeaderClass
																}).removeClass(
																"d-none");
												$(this)
														.find(
																"tbody#fileUploadsModalTable tr")
														.addClass("d-none")
														.filter(
																function() {
																	return $(
																			this)
																			.hasClass(
																					filterdTrClass);
																}).removeClass(
																"d-none");
											}).modal('show');

						});
		
		 */
	</script>
</body>
</html>