<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Online MIS</title>

<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
<jsp:include page="online-mis-header.jsp" />
<script src="<c:url value="/resources/lib/jquery/jquery.min.js"/>"
	type="text/javascript"></script>

<style>
.w-98 {
	width: 98% !important;
}

.undo-btn, .undo-btn:hover, .undo-btn:focus, .undo-btn:active,
	.reject-btn, .reject-btn:hover, .reject-btn:focus, .reject-btn:active,
	.approve-btn, .approve-btn:hover {
	outline: none !important;
	box-shadow: none !important;
	/* color: #9c9c9c !important; */
	color: #383838;
	transition: all .3S ease-out;
	cursor: pointer;
	/* opacity: .6; */
}

.undo-btn {
	background-color: #e4e4e4 !important;
}

/*  .undo-btn:hover, .undo-btn:focus, .undo-btn:active, .undo-btn.active{
	background-color: #cacaca !important;
	color: #383838 !important;
}
 */
.reject-btn {
	/* background-color: #f2dede !important; */
	background-color: #f9c0c0 !important;
}

.approve-btn {
	/* background-color: #dff0d8 !important; */
	background-color: #89f3a0 !important;
}

/* .reject-btn:hover, .reject-btn:focus, .reject-btn:active, .approve-btn:hover,
	.approve-btn:focus, .approve-btn:active, .undo-btn:hover, .undo-btn:focus,
	.undo-btn:active, .undo-btn.active {
	opacity: 1;
	color: #383838 !important;
} */
.approve-btn.active, .reject-btn.active {
	top: -5px;
	box-shadow: 0px 5px 4px 0px #908f8f !important;
	z-index: 5 !important;
	opacity: 1;
	color: #121e3a !important;
	border-radius: 5px !important;
}

.not-allowed {
	cursor: not-allowed !important;
}

button.btn {
	padding: 6px 9px;
}

.btn-group {
	display: -webkit-inline-box !important;
	display: -ms-inline-flexbox !important;
	display: inline-flex !important;
}
</style>

</head>

<body>

	<section id="contact" class="section-bg-con">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div id="nav-tab">
						<ul class="nav nav-fill nav-tabs border-bottom-0 mb-3"
							id="pills-tab" role="tablist">
							<li class="nav-item"><a class="nav-item nav-link active"
								id="pills-work-info-tab" data-toggle="pill"
								href="#pills-work-info" role="tab" aria-controls="pills-home"
								aria-selected="true">Work info</a></li>
							<li class="nav-item"><a class="nav-item nav-link"
								id="pills-attachments-tab" data-toggle="pill"
								href="#pills-attachments" role="tab"
								aria-controls="pills-profile" aria-selected="false">Attachments</a></li>
						</ul>
					</div>

					<div class="tab-content" id="pills-tabContent">

						<!-- General work info details -->
						<div class="tab-pane fade show active" id="pills-work-info"
							role="tabpanel" aria-labelledby="pills-home-tab">
							<form id="msform" method="get" action="#">
								<fieldset>
									<div class="col-md-6">
										<div class="text-center">
											<h4 class="section-title">Work</h4>
										</div>
										<div class="table-responsive">

											<table class="table table-bordered" style="width: 100%">

												<tbody>
													<tr>
														<th>Types of Work</th>
														<td>${work.typeOfWork.name}</td>
													</tr>
													<tr>
														<th>Nature of work</th>
														<td>${work.natureOfWork.name}</td>
													</tr>
													<tr>
														<th>District</th>
														<td>${work.district.name}</td>
													</tr>
													<tr>
														<th>Constituency</th>
														<td>${work.constituency.name}</td>

													</tr>
													<tr>
														<th>Mandal</th>
														<td>${work.mandal.name}</td>

													</tr>
													<tr>
														<th>Village</th>
														<td>${work.village.name}</td>

													</tr>
													<tr>
														<th>Location</th>
														<td>${work.district.name}</td>

													</tr>
													<tr>
														<th>Work Number</th>
														<td>${work.workNo}</td>

													</tr>
													<tr>
														<th>Work Detail</th>
														<td>${work.workDetails}</td>

													</tr>
													<tr>
														<th>Estimated Cost</th>
														<td>${work.cost}</td>
													</tr>

												</tbody>

											</table>

										</div>
									</div>

									<div class="col-md-6">
										<div class="text-center">
											<h4 class="section-title">Administrative Sanction</h4>
										</div>
										<div class="table-responsive">
											<table class="table table-bordered w-100">

												<tbody>
													<tr>
														<th>Nature of work</th>
														<td>${adminInfo.workName}</td>
													</tr>
													<tr>
														<th>Work Number</th>
														<td>${adminInfo.workNumber}</td>
													</tr>
													<tr>
														<th>AS Sanctioned Details</th>
														<td>${adminInfo.sanctionedDetails}</td>

													</tr>
													<tr>
														<th>Grant</th>
														<td>${adminInfo.typeOfGrant.name}</td>

													</tr>
													<tr>
														<th>Financial Year</th>
														<td>${adminInfo.financialYear.year}</td>

													</tr>
													<tr>
														<th>Engagement of Department by</th>
														<td>${adminInfo.executiveDept.name}</td>

													</tr>
													<tr>
														<th>Engagement of Consultant by</th>
														<td>${adminInfo.consultant.name}</td>

													</tr>
													<tr>
														<th>Document Details</th>

														<td><c:forEach items="${adminFile}" var="file">
																<a href="${file.value}" target="_blank"
																	style="float: left;">${file.key}</a>
																<br>
															</c:forEach></td>

													</tr>
												</tbody>

											</table>
										</div>
									</div>

									<br>

								</fieldset>

								<fieldset>
									<div class="col-md-6">
										<div class="text-center">
											<h4 class="section-title">Department</h4>
										</div>
										<div class="table-responsive">

											<table class="table table-bordered w-100">

												<tbody>
													<tr>
														<th>Name of Department</th>
														<td>${deptInfo.departmentName}</td>
													</tr>
													<tr>
														<th>Nature of work</th>
														<td>${work.natureOfWork.name}</td>
													</tr>
													<tr>
														<th>Circle</th>
														<td>${deptInfo.circle}</td>
													</tr>
													<tr>
														<th>Name of the Division</th>
														<td>${deptInfo.divisionName.name}</td>

													</tr>
													<tr>
														<th>Name of the SubDivision</th>
														<td>${deptInfo.subdivisionName.name}</td>

													</tr>
													<tr>
														<th>Name of the Section</th>
														<td>${deptInfo.sectionName.name}</td>

													</tr>
													<tr>
														<th>Section officer</th>
														<td>${deptInfo.sectionOfficerName}</td>

													</tr>
													<tr>
														<th>Mobile</th>
														<td>${deptInfo.mobileNo}</td>

													</tr>
													<tr>
														<th>Email Id</th>
														<td>${deptInfo.email}</td>

													</tr>

												</tbody>

											</table>

										</div>
									</div>

									<div class="col-md-6">
										<div class="text-center">
											<h4 class="section-title">Land Details</h4>
										</div>
										<div class="table-responsive">
											<table class="table table-bordered w-100">
												<tbody>
													<tr>
														<th>Work</th>
														<td>${landInfo.work.natureOfWork.name}</td>
													</tr>
													<tr>
														<th>Work Number</th>
														<td>${landInfo.work.workNo}</td>
													</tr>
													<tr>
														<th>Name of the Work</th>
														<td>${landInfo.work.workDetails}</td>
													</tr>
													<tr>
														<th>Land Extend</th>
														<td>${landInfo.landExtend}</td>

													</tr>
													<tr>
														<th>Survey Number</th>
														<td>${landInfo.surveyNo}</td>

													</tr>
													<tr>
														<th>Field Measurement Details</th>
														<td>${landInfo.bookDetails}</td>

													</tr>
													<tr>
														<th>Type Of Land</th>
														<td>${landInfo.typeOfLand.name}</td>

													</tr>
													<tr>
														<th>Document Details</th>
														<td><c:forEach items="${landFile}" var="landfile">
																<a href="${landfile.value}" target="_blank"
																	style="float: left;">${landfile.key}</a>
																<br>
															</c:forEach></td>

													</tr>

												</tbody>

											</table>
										</div>
									</div>
									<br>
									<div class="col-md-12" align="right">
										<input type="button" name="next" class="next action-button"
											value="Next">
									</div>
									<%--  </c:if> --%>

								</fieldset>

							</form>


						</div>

						<!-- Consultant uploaded attachments and work land related details -->
						<div class="tab-pane fade" id="pills-attachments" role="tabpanel"
							aria-labelledby="pills-profile-tab">
							<form id="msform" method="post" action="#">
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
											<li><input type="text" title="pan-number"
												id="pan_number" value="${consultant.pan_number}"
												class="form-control mb-md" placeholder="PAN Number"
												readonly="true" /></li>
										</ul>

										<ul class="fs-list-details">
											<li><p>TIN Number</p></li>
											<li><input type="text" title="tin-number"
												id="tin_number" value="${consultant.tin_number}"
												class="form-control mb-md" readonly="true"
												placeholder="TIN Number" /></li>
										</ul>

										<ul class="fs-list-details">
											<li><p>Mobile Number</p></li>
											<li><input type="text" title="mobile-number"
												id="mobile_no" value="${consultant.mobile_no}"
												readonly="true" maxlength="10" class="form-control mb-md"
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
											<li><textarea title="address" id="address"
													readonly="true" class="form-control mb-md"
													placeholder="Address">${consultant.address}</textarea></li>
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
													placeholder="What is the survey!"
													class="form-control mb-md">${landSurveyDetails.surveycontent}</textarea>
											</li>
										</ul>

										<ul class="fs-list-details">
											<li><p>Comments</p></li>
											<li><textarea id="comments" readonly="true"
													placeholder="Comments" class="form-control mb-md">${landSurveyDetails.comments}</textarea>
											</li>
										</ul>

										<ul class="fs-list-details clear-fix w-98">
											<li><p>Uploaded Land Details Document</p></li>
											<li>
												<div class="table-responsive">
													<table
														class="text-left readOnlyTable w-100 table table-bordered">
														<thead>
															<tr>
																<td style="width: 5%">S.no</td>
																<td>File Name</td>
																<td>Size</td>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${landAttachmentFiles}" var="file"
																varStatus="loop">
																<c:set var="filePathParts"
																	value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
																<tr class="landDetailsUploadDocuments">
																	<td>${loop.index + 1 }</td>
																	<td><a
																		href="${pageContext.request.contextPath}${file.path}"
																		target="_blank">${filePathParts[fn:length(filePathParts)-1]}</a></td>

																	<td>${file.convertFileSize}</td>
																</tr>

															</c:forEach>
															<c:if test="${fn:length(filePathParts) == 0}">
																<tr class="landDetailsUploadDocuments">
																	<td colspan="3">
																		<p class="text-center p-4 mb-0">No attachments
																			found</p>
																	</td>
																</tr>
															</c:if>
														</tbody>
													</table>
												</div>
											</li>
										</ul>

										<ul class="fs-list-details clear-fix w-100">
											<li><p>Uploaded Land Survey Details Document</p></li>
											<li>
												<div class="table-responsive">
													<table
														class="text-left readOnlyTable w-98 table table-bordered">
														<thead>
															<tr>
																<td style="width: 5%">S.no</td>
																<td style="width: 20%">File Name</td>
																<td style="width: 18%">Upload by</td>
																<td style="width: 17%">Upload on</td>
																<td style="width: 8%">Size</td>
																<td style="width: 30%">Action</td>

															</tr>
														</thead>
														<tbody class="uploadedFileDetails">
															<c:forEach items="${landSurveyAttachmentFiles}"
																var="file" varStatus="loop">
																<c:set var="filePathParts"
																	value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
																<tr class="landSurveyDetailsUploadDocuments"
																	data-allow-work-approval="${file.status == pendingAttachment ? '0' :'1'}">
																	<td>${loop.index + 1 }</td>
																	<td><a
																		href="${pageContext.request.contextPath}${file.path}"
																		target="_blank">${filePathParts[fn:length(filePathParts)-1]}</a></td>
																	<td>${file.fileUploadUserName}</td>
																	<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm a"
																			value="${empty file.updatedAt ? file.createdAt : file.updatedAt}" /></td>
																	<td>${file.convertFileSize}</td>
																	<td class="text-center">
																		<div class="btn-group" role="group"
																			data-attachment-id="${file.id}"
																			aria-label="Basic example">
																			<button type="button"
																				class="btn undo-btn ${file.status == pendingAttachment ? 'not-allowed' :''}"
																				${file.status == pendingAttachment ? 'disabled="true"' :''}>
																				<i class="fa fa-undo"></i>&nbsp;Undo
																			</button>
																			<button type="button"
																				class="btn approve-btn ${(file.status == approvedAttachment or file.status == rejectedAttachment)  ? 'not-allowed' :''} ${file.status == approvedAttachment ? 'active' :''}"
																				${(file.status == approvedAttachment or file.status == rejectedAttachment) ? 'disabled="true"' :''}>
																				<i class="fa fa-check"></i><span>Approve${file.status == approvedAttachment ? 'd' : ''}</span>
																			</button>
																			<button type="button"
																				class="btn reject-btn ${(file.status == approvedAttachment or file.status == rejectedAttachment)  ? 'not-allowed' :''} ${file.status == rejectedAttachment ? 'active' :''}"
																				${(file.status == approvedAttachment or file.status == rejectedAttachment) ? 'disabled="true"' :''}>
																				<i class="fa fa-close"></i><span>Reject${file.status == rejectedAttachment ? 'ed' : ''}</span>
																			</button>
																		</div>
																	</td>
																</tr>

															</c:forEach>
															<c:if test="${fn:length(landSurveyAttachmentFiles) == 0}">
																<tr class="landSurveyDetailsUploadDocuments"
																	data-allow-work-approval="1">
																	<td colspan="6">
																		<p class="text-center p-4 mb-0">No attachments
																			found</p>
																	</td>
																</tr>
															</c:if>
														</tbody>
													</table>
												</div>
											</li>
										</ul>



									</div>

								</fieldset>

								<fieldset>
									<div class="fs-list-full">
										<h2 class="fs-title">Preliminary preparation layout</h2>

										<ul class="fs-list-details clear-fix w-100">
											<li><p>Uploaded preliminary preparation layout
													Document</p></li>
											<li>
												<div class="table-responsive">
													<table
														class="text-left readOnlyTable w-98 table table-bordered">
														<thead>
															<tr>
																<td style="width: 5%">S.no</td>
																<td style="width: 20%">File Name</td>
																<td style="width: 18%">Upload by</td>
																<td style="width: 17%">Upload on</td>
																<td style="width: 8%">Size</td>
																<td style="width: 30%">Action</td>

															</tr>
														</thead>
														<tbody class="uploadedFileDetails">
															<c:forEach items="${PPLayoutAttachmentFiles}" var="file"
																varStatus="loop">
																<c:set var="filePathParts"
																	value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
																<tr class="PPLayoutUploadDocuments"
																	data-allow-work-approval="${file.status == pendingAttachment ? '0' :'1'}">
																	<td>${loop.index + 1}</td>
																	<td><a
																		href="${pageContext.request.contextPath}${file.path}"
																		target="_blank">${filePathParts[fn:length(filePathParts)-1]}</a></td>
																	<td>${file.fileUploadUserName}</td>
																	<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm a"
																			value="${empty file.updatedAt ? file.createdAt : file.updatedAt}" /></td>
																	<td>${file.convertFileSize}</td>
																	<td class="text-center">
																		<div class="btn-group" role="group"
																			data-attachment-id="${file.id}"
																			aria-label="Basic example">
																			<button type="button"
																				class="btn undo-btn ${file.status == pendingAttachment ? 'not-allowed' :''}"
																				${file.status == pendingAttachment ? 'disabled="true"' :''}>
																				<i class="fa fa-undo"></i>&nbsp;Undo
																			</button>
																			<button type="button"
																				class="btn approve-btn ${(file.status == approvedAttachment or file.status == rejectedAttachment)  ? 'not-allowed' :''} ${file.status == approvedAttachment ? 'active' :''}"
																				${(file.status == approvedAttachment or file.status == rejectedAttachment) ? 'disabled="true"' :''}>
																				<i class="fa fa-check"></i><span>Approve${file.status == approvedAttachment ? 'd' : ''}</span>
																			</button>
																			<button type="button"
																				class="btn reject-btn ${(file.status == approvedAttachment or file.status == rejectedAttachment)  ? 'not-allowed' :''} ${file.status == rejectedAttachment ? 'active' :''}"
																				${(file.status == approvedAttachment or file.status == rejectedAttachment) ? 'disabled="true"' :''}>
																				<i class="fa fa-close"></i><span>Reject${file.status == rejectedAttachment ? 'ed' : ''}</span>
																			</button>
																		</div>
																	</td>

																</tr>

															</c:forEach>
															<c:if test="${fn:length(PPLayoutAttachmentFiles) == 0}">
																<tr class="PPLayoutUploadDocuments"
																	data-allow-work-approval="1">
																	<td colspan="6">
																		<p class="text-center p-4 mb-0">No attachments
																			found</p>
																	</td>
																</tr>
															</c:if>


														</tbody>
													</table>
												</div>
											</li>
										</ul>


									</div>
								</fieldset>

								<fieldset>
									<div class="fs-list-full">
										<h2 class="fs-title">Geotechnical investigation</h2>



										<ul class="fs-list-details">
											<li><p>Comments</p></li>
											<li><textarea id="natureofwork"
													class="form-control mb-md" readonly="true"
													placeHolder="Comments">${geotechnicalInvestigation.comments}</textarea></li>
										</ul>

										<ul class="fs-list-details clear-fix w-100">
											<li><p>Uploaded geotehnical investigation Document</p></li>
											<li>
												<div class="table-responsive">
													<table
														class="text-left readOnlyTable w-98 table table-bordered">
														<thead>
															<tr>
																<td style="width: 5%">S.no</td>
																<td style="width: 20%">File Name</td>
																<td style="width: 18%">Upload by</td>
																<td style="width: 17%">Upload on</td>
																<td style="width: 8%">Size</td>
																<td style="width: 30%">Action</td>

															</tr>
														</thead>
														<tbody class="uploadedFileDetails">
															<c:forEach items="${GIAttachmentFiles}" var="file"
																varStatus="loop">
																<c:set var="filePathParts"
																	value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
																<tr class="GIUploadDocuments"
																	data-allow-work-approval="${file.status == pendingAttachment ? '0' :'1'}">
																	<td>${loop.index + 1 }</td>
																	<td><a
																		href="${pageContext.request.contextPath}${file.path}"
																		target="_blank">${filePathParts[fn:length(filePathParts)-1]}</a></td>
																	<td>${file.fileUploadUserName}</td>
																	<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm a"
																			value="${empty file.updatedAt ? file.createdAt : file.updatedAt}" /></td>
																	<td>${file.convertFileSize}</td>
																	<td class="text-center">
																		<div class="btn-group" role="group"
																			data-attachment-id="${file.id}"
																			aria-label="Basic example">
																			<button type="button"
																				class="btn undo-btn ${file.status == pendingAttachment ? 'not-allowed' :''}"
																				${file.status == pendingAttachment ? 'disabled="true"' :''}>
																				<i class="fa fa-undo"></i>&nbsp;Undo
																			</button>
																			<button type="button"
																				class="btn approve-btn ${(file.status == approvedAttachment or file.status == rejectedAttachment)  ? 'not-allowed' :''} ${file.status == approvedAttachment ? 'active' :''}"
																				${(file.status == approvedAttachment or file.status == rejectedAttachment) ? 'disabled="true"' :''}>
																				<i class="fa fa-check"></i><span>Approve${file.status == approvedAttachment ? 'd' : ''}</span>
																			</button>
																			<button type="button"
																				class="btn reject-btn ${(file.status == approvedAttachment or file.status == rejectedAttachment)  ? 'not-allowed' :''} ${file.status == rejectedAttachment ? 'active' :''}"
																				${(file.status == approvedAttachment or file.status == rejectedAttachment) ? 'disabled="true"' :''}>
																				<i class="fa fa-close"></i><span>Reject${file.status == rejectedAttachment ? 'ed' : ''}</span>
																			</button>
																		</div>
																	</td>
																</tr>

															</c:forEach>
															<c:if test="${fn:length(GIAttachmentFiles) == 0}">
																<tr class="GIUploadDocuments"
																	data-allow-work-approval="1">
																	<td colspan="6">
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


									</div>
								</fieldset>
								<div>

									<input type="button" name="previous" class="next action-button"
										value="Previous">

									<%-- <c:if test="${PENDING_SAAP_APPROVAL eq work.workStatus}">
										
									</c:if> --%>
									<input type="button" id="approveWork"
											class="next action-button" value="Approve">
									<input type="button" id="home" class="next action-button"
										value="Home"> <input type="hidden" id="workid"
										value="${work.id}" />
								</div>

							</form>


						</div>

					</div>


				</div>
			</div>
		</div>
	</section>
	<br>

	<br>
	<br>




	<script
		src=<c:url value="/resources/js/scripts/ui-blocker/jquery.blockUI.js"/>
		type="text/javascript"></script>
	<script>
		<c:url value="/workApprovals/work/${work.id}/aprove" var="workApprovalUrl" />
		var workApprovalUrl = "${workApprovalUrl}";
		<c:url value="/upload/updateAttachmentStatus" var="attachmentStatusUpdateUrl" />
		var attachmentStatusUpdateUrl = "${attachmentStatusUpdateUrl}";

		<c:url value="/workApprovals/pending" var="homeUrl" />
		var homeUrl = "${homeUrl}";
		var FILE_UPLOAD_STATUS = {
			APPROVED : '${approvedAttachment}',
			REJECTED : '${rejectedAttachment}',
			UNDO : '${pendingAttachment}'
		}
	</script>
	<script
		src=<c:url value="/resources/js/uploadDocuments/work-consultancy-approvals.js"/>
		type="text/javascript"></script>


	<jsp:include page="online-mis-footer.jsp" />
</body>
</html>