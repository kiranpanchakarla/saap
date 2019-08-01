<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page
	import="com.ap.mis.util.PhaseCompletionType, com.ap.mis.util.EnumFilter"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Full work status</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
<link
	href="${pageContext.request.contextPath}/resources/css/uploadDocuments/fileUploadDocuments.css"
	rel="stylesheet">

<style type="text/css">
label {
	color: #06213e !important;
	word-break: break-word;
	margin-left: 5px;
}

h2+div.row {
	margin-left: -5px !important;
}

h2.fs-title {
	margin-bottom: 15px;
	letter-spacing: unset;
}

#nav-tab {
	width: 100%;
}

.tab-content {
	box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
}

#nav-tab li a.disabled {
	pointer-events: none !important;
}

.click-not-allowed {
	cursor: not-allowed !important;
}

.overlap-row-col>[class*='col-'] {
	margin-bottom: 0.4pc;
}

.yet-to-start {
	text-align: center;
	padding-top: 15px;
	padding-bottom: 15px;
	background: #e2e2e2;
	font-size: 18px;
	color: #2C3E50;
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

			<div id="nav-tab">
				<ul class="nav nav-tabs nav-fill" role="tablist">

					<li class="nav-item"><a
						class="nav-item nav-link ${workPhasList.get(0).completionType ==  PhaseCompletionType.NONE ? 'disabled': '' } ${workPhasList.get(0).activePhase ? 'active':'' } "
						id="nav-work-tab" data-toggle="tab"
						href="<c:url value="/work/${work.id}/phase/1/status"/>" role="tab"
						aria-controls="nav-work" aria-selected="true">Work</a></li>

					<li class="nav-item"><a
						class="nav-item nav-link ${workPhasList.get(1).completionType ==  PhaseCompletionType.NONE ? 'disabled': '' } ${workPhasList.get(1).activePhase ? 'active':'' } "
						id="nav-admin-tab" data-toggle="tab"
						href="<c:url value="/work/${work.id}/phase/2/status"/>" role="tab"
						aria-controls="nav-admin" aria-selected="false">Consultant</a></li>
					<li class="nav-item"><a
						class="nav-item nav-link ${workPhasList.get(2).completionType ==  PhaseCompletionType.NONE ? 'disabled': '' } ${workPhasList.get(2).activePhase ? 'active':'' } "
						id="nav-department-tab" data-toggle="tab"
						href="<c:url value="/work/${work.id}/phase/3/status"/>" role="tab"
						aria-controls="nav-department" aria-selected="false">Department</a></li>

				</ul>
			</div>
			<div class="tab-content p-4" id="myTabContent">
				<div
					class="tab-pane fade ${activePhaseIndex == 1 ? 'show active' :''}"
					id="home" role="tabpanel" aria-labelledby="home-tab">

					<h2 class="fs-title">Works</h2>
					<c:choose>
						<c:when
							test="${workPhasList[0].subWorkPhase[0].completionType eq PhaseCompletionType.FULL}">
							<div class="row">


								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Types of Work</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${work.typeOfWork.name}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Nature of work</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${work.natureOfWork.name}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>District</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${work.district.name}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Constituency</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${work.constituency.name}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Mandal</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${work.mandal.name}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Village</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${work.village.name}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Location</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${work.district.name}</label>
										</div>
									</div>
								</div>
								<div class="col-6">

									<div class="row">
										<div class="col-5">
											<span>Work Number</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${work.workNo}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Work Detail</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${workLineItems.workDetails}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Estimated Cost(in lacks)</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${workLineItems.cost}</label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated Date</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <fmt:formatDate
													pattern="dd-MM-yyyy hh:mm a"
													value="${empty work.updatedAt ? work.createdAt : work.updatedAt}" /></label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated user</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <c:forEach items="${userList}"
													var="user">
													<c:if
														test="${user.id == (empty work.updatedBy ? work.createdBy : work.updatedBy)}">
														${user.name}
													</c:if>
												</c:forEach>

											</label>
										</div>
									</div>
								</div>


							</div>
						</c:when>
						<c:otherwise>
							<div class="row mr-0">
								<div class="col-12 yet-to-start">
									<span>Yet to start</span>
								</div>
							</div>

						</c:otherwise>
					</c:choose>
					<hr />
					<h2 class="fs-title">Administrative Sanction</h2>
					<c:choose>
						<c:when
							test="${workPhasList[0].subWorkPhase[1].completionType eq PhaseCompletionType.FULL}">
							<div class="row">
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Sanctioned Details</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${adminstrativeSanction.sanctionedDetails}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Grant</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${adminstrativeSanction.typeOfGrant.name}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Financial Year</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${adminstrativeSanction.financialYear.year}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Engagement of Department by</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${adminstrativeSanction.executiveDept.name}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Engagement of Consultant by</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${adminstrativeSanction.consultant.name}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated Date</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <fmt:formatDate
													pattern="dd-MM-yyyy hh:mm a"
													value="${empty adminstrativeSanction.updatedAt ? adminstrativeSanction.createdAt : adminstrativeSanction.updatedAt}" /></label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated user</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <c:forEach items="${userList}"
													var="user">
													<c:if
														test="${user.id == (empty adminstrativeSanction.updatedBy ? adminstrativeSanction.createdBy : adminstrativeSanction.updatedBy)}">
														${user.name}
													</c:if>
												</c:forEach>

											</label>
										</div>
									</div>
								</div>
								<div class="col-12 mt-3">
									<p>Upload Document</p>
									<div class="table-responsive">
										<table
											class="readOnlyTable table-bordered table-condensed text-left w-100">
											<thead>
												<tr>
													<th style="width: 5%">S.no</th>
													<th>File</th>
													<th>Size</th>
													<th>Upload date</th>
													<th>Upload by</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${administrativeAttachmentFiles}"
													var="file" varStatus="loop">
													<c:set var="filePathParts"
														value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
													<tr class="landSurveyDetailsUploadDocuments">
														<td>${loop.index + 1}</td>
														<td><a
															href="${pageContext.request.contextPath}${file.path}"
															target="_blank">${filePathParts[fn:length(filePathParts)-1]}</a>
														</td>
														<td>${file.convertFileSize}</td>
														<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm a"
																value="${empty file.updatedAt ? file.createdAt : file.updatedAt}" /></td>

														<td><c:forEach items="${userList}" var="user">
																<c:if
																	test="${user.id == (empty file.updatedBy ? file.createdBy : file.updatedBy)}">
														${user.name}
													</c:if>
															</c:forEach></td>
													</tr>

												</c:forEach>
												<c:if
													test="${fn:length(administrativeAttachmentFiles) == 0}">
													<tr class="landSurveyDetailsUploadDocuments">
														<td colspan="5">
															<p class="text-center p-4 mb-0">No attachments found</p>
														</td>
													</tr>
												</c:if>
											</tbody>
										</table>
									</div>

								</div>

							</div>
						</c:when>
						<c:otherwise>
							<div class="row  mr-0">
								<div class="col-12 yet-to-start">
									<span>Yet to start</span>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
					<hr />
					<h2 class="fs-title">Department</h2>
					<c:choose>
						<c:when
							test="${workPhasList[0].subWorkPhase[2].completionType eq PhaseCompletionType.FULL}">

							<div class="row">
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Department</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${departmentLinkingLine.departmentName}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Circle</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${departmentLinkingLine.circle}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Division</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${departmentLinkingLine.divisionName.name}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>SubDivision</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${departmentLinkingLine.subdivisionName.name}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Section</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${departmentLinkingLine.sectionName.name}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Section Officer</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${departmentLinkingLine.sectionOfficerName}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Mobile</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${departmentLinkingLine.mobileNo}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Email Id</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${departmentLinkingLine.email}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated Date</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <fmt:formatDate
													pattern="dd-MM-yyyy hh:mm a"
													value="${empty departmentLinkingLine.updatedAt ? departmentLinkingLine.createdAt : departmentLinkingLine.updatedAt}" /></label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated user</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <c:forEach items="${userList}"
													var="user">
													<c:if
														test="${user.id == (empty departmentLinkingLine.updatedBy ? departmentLinkingLine.createdBy : departmentLinkingLine.updatedBy)}">
														${user.name}
													</c:if>
												</c:forEach>

											</label>
										</div>
									</div>
								</div>

							</div>
						</c:when>
						<c:otherwise>
							<div class="row mr-0">
								<div class="col-12 yet-to-start">
									<span>Yet to start</span>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
					<hr />
					<h2 class="fs-title">Land Details</h2>
					<c:choose>
						<c:when
							test="${workPhasList[0].subWorkPhase[3].completionType eq PhaseCompletionType.FULL}">

							<div class="row">
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Land Extend</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${landDetails.landExtend}</label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Survey Number</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${landDetails.surveyNo}</label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Field Measurement Details</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${landDetails.bookDetails}</label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Type Of Land</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${landDetails.typeOfLand.name}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated Date</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <fmt:formatDate
													pattern="dd-MM-yyyy hh:mm a"
													value="${empty landDetails.updatedAt ? landDetails.createdAt : landDetails.updatedAt}" /></label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated user</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <c:forEach items="${userList}"
													var="user">
													<c:if
														test="${user.id == (empty landDetails.updatedBy ? landDetails.createdBy : landDetails.updatedBy)}">
														${user.name}
													</c:if>
												</c:forEach>

											</label>
										</div>
									</div>
								</div>

								<div class="col-12 mt-3">
									<p class="mb-2">
										<span>Uploaded Land Details Document</span>
									</p>
									<div class="table-responsive">
										<table
											class="readOnlyTable table-bordered table-condensed text-left w-100">
											<thead>
												<tr>
													<th>S.no</th>
													<th>File</th>
													<th>Size</th>
													<th>Upload date</th>
													<th>Upload by</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${landAttachmentFiles}" var="file"
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
														<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm a"
																value="${empty file.updatedAt ? file.createdAt : file.updatedAt}" /></td>
														<td><c:forEach items="${userList}" var="user">
																<c:if
																	test="${user.id == (empty file.updatedBy ? file.createdBy : file.updatedBy)}">
														${user.name}
													</c:if>
															</c:forEach></td>
													</tr>

												</c:forEach>
												<c:if test="${fn:length(landAttachmentFiles) == 0}">
													<tr class="landSurveyDetailsUploadDocuments">
														<td colspan="5">
															<p class="text-center p-4 mb-0">No attachments found</p>
														</td>
													</tr>
												</c:if>
											</tbody>
										</table>
									</div>


								</div>


							</div>
						</c:when>
						<c:otherwise>

							<div class="row mr-0">
								<div class="col-12 yet-to-start">
									<span>Yet to start</span>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>



				<div
					class="tab-pane fade ${activePhaseIndex == 2 ? 'show active' :''}">

					<h2 class="fs-title">Consultant Information</h2>
					<c:choose>
						<c:when
							test="${workPhasList[1].subWorkPhase[0].completionType eq PhaseCompletionType.FULL}">
							<div class="row">
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Name of Consultant Firm</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${consultant.consultant_firm}</label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>PAN Number</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${consultant.pan_number}</label>
										</div>
									</div>
								</div>


								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>TIN Number</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${consultant.tin_number}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Mobile Number</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${consultant.mobile_no}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Land line Number</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${consultant.landline_no}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Email Id</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${consultant.emailId}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Address</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${consultant.address}</label>
										</div>
									</div>
								</div>

								<!-- </div>


							<hr />
							<h2 class="fs-title">Bank Details of Firm</h2>

							<div class="row"> -->
								<div class="col-12">
									<h2 class="fs-title">Bank Details of Firm</h2>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Bank</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${consultant.bank_name}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Branch</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${consultant.branch}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Account Type</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${consultant.account_type}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>A/c Number</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${consultant.account_number}</label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>IFSC Code</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${consultant.ifsc_code}</label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated Date</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <fmt:formatDate
													pattern="dd-MM-yyyy hh:mm a"
													value="${empty consultant.updatedAt ? consultant.createdAt : consultant.updatedAt}" /></label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated user</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <c:forEach items="${userList}"
													var="user">
													<c:if
														test="${user.id == (empty consultant.updatedBy ? consultant.createdBy : consultant.updatedBy)}">
														${user.name}
													</c:if>
												</c:forEach>

											</label>
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="row mr-0">
								<div class="col-12 yet-to-start">
									<span>Yet to start</span>
								</div>
							</div>

						</c:otherwise>
					</c:choose>
					<hr />
					<h2 class="fs-title">Land survey details</h2>
					<c:choose>
						<c:when
							test="${workPhasList[1].subWorkPhase[1].completionType eq PhaseCompletionType.FULL}">
							<div class="row">

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>What is the Survey</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${landSurveyDetails.surveycontent}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Comments</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${landSurveyDetails.comments}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated Date</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <fmt:formatDate
													pattern="dd-MM-yyyy hh:mm a"
													value="${empty landSurveyDetails.updatedAt ? landSurveyDetails.createdAt : landSurveyDetails.updatedAt}" /></label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated user</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <c:forEach items="${userList}"
													var="user">
													<c:if
														test="${user.id == (empty landSurveyDetails.updatedBy ? landSurveyDetails.createdBy : landSurveyDetails.updatedBy)}">
														${user.name}
													</c:if>
												</c:forEach>

											</label>
										</div>
									</div>
								</div>
								<div class="col-12 mt-3">
									<p class="mb-2">
										<span>Uploaded Land Survey Details Document</span>
									</p>
									<div class="table-responsive">
										<table
											class="readOnlyTable table-bordered table-condensed text-left w-100">
											<thead>
												<tr>
													<th>S.no</th>
													<th>File</th>
													<th>Size</th>
													<th>Upload date</th>
													<th>Upload by</th>
													<th>Status</th>
												</tr>
											</thead>
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
														<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm a"
																value="${empty file.updatedAt ? file.createdAt : file.updatedAt}" /></td>
														<td><c:forEach items="${userList}" var="user">
																<c:if
																	test="${user.id == (empty file.updatedBy ? file.createdBy : file.updatedBy)}">
														${user.name}
													</c:if>
															</c:forEach></td>
														<td><c:choose>

																<c:when
																	test="${EnumFilter.ATTACHMENT_APPROVED.status == file.status}">
																	<span class="text-success"><i
																		class="fa fa-check"></i>&nbsp;Approved</span>
																</c:when>

																<c:when
																	test="${EnumFilter.ATTACHMENT_REJECTED.status == file.status}">
																	<span class="text-danger"><i class="fa fa-close"></i>&nbsp;Rejected</span>
																</c:when>

																<c:otherwise>
																	<span class="text-muted"><i
																		class="fa fa-hourglass"></i>&nbsp;Pending</span>
																</c:otherwise>
															</c:choose></td>
													</tr>

												</c:forEach>
												<c:if test="${fn:length(landSurveyAttachmentFiles) == 0}">
													<tr class="landSurveyDetailsUploadDocuments">
														<td colspan="6">
															<p class="text-center p-4 mb-0">No attachments found</p>
														</td>
													</tr>
												</c:if>
											</tbody>
										</table>
									</div>


								</div>


							</div>
						</c:when>
						<c:otherwise>
							<div class="row mr-0">
								<div class="col-12 yet-to-start">
									<span>Yet to start</span>
								</div>
							</div>

						</c:otherwise>
					</c:choose>
					<hr />
					<h2 class="fs-title">Preliminary preparation layout</h2>
					<c:choose>
						<c:when
							test="${workPhasList[1].subWorkPhase[2].completionType eq PhaseCompletionType.FULL}">
							<div class="row">
								<div class="col-12">
									<p>Uploaded preliminary preparation layout Document</p>
									<div class="table-responsive">
										<table
											class="readOnlyTable table-bordered table-condensed text-left w-100">
											<thead>
												<tr>
													<th>S.no</th>
													<th>File</th>
													<th>Size</th>
													<th>Upload date</th>
													<th>Upload by</th>
													<th>Status</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${PPLayoutAttachmentFiles}" var="file"
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
														<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm a"
																value="${empty file.updatedAt ? file.createdAt : file.updatedAt}" /></td>
														<td><c:forEach items="${userList}" var="user">
																<c:if
																	test="${user.id == (empty file.updatedBy ? file.createdBy : file.updatedBy)}">
														${user.name}
													</c:if>
															</c:forEach></td>
														<td><c:choose>

																<c:when
																	test="${EnumFilter.ATTACHMENT_APPROVED.status == file.status}">
																	<span class="text-success"><i
																		class="fa fa-check"></i>&nbsp;Approved</span>
																</c:when>

																<c:when
																	test="${EnumFilter.ATTACHMENT_REJECTED.status == file.status}">
																	<span class="text-danger"><i class="fa fa-close"></i>&nbsp;Rejected</span>
																</c:when>

																<c:otherwise>
																	<span class="text-muted"><i
																		class="fa fa-hourglass"></i>&nbsp;Pending</span>
																</c:otherwise>
															</c:choose></td>
													</tr>

												</c:forEach>
												<c:if test="${fn:length(PPLayoutAttachmentFiles) == 0}">
													<tr class="landSurveyDetailsUploadDocuments">
														<td colspan="6">
															<p class="text-center p-4 mb-0">No attachments found</p>
														</td>
													</tr>
												</c:if>
											</tbody>
										</table>
									</div>

								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="row mr-0">
								<div class="col-12 yet-to-start">
									<span>Yet to start</span>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
					<hr />
					<h2 class="fs-title">Geo technical investigation</h2>
					<c:choose>
						<c:when
							test="${workPhasList[1].subWorkPhase[3].completionType eq PhaseCompletionType.FULL}">
							<div class="row">

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Comments</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${geotechnicalInvestigation.comments}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated Date</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <fmt:formatDate
													pattern="dd-MM-yyyy hh:mm a"
													value="${empty geotechnicalInvestigation.updatedAt ? geotechnicalInvestigation.createdAt : geotechnicalInvestigation.updatedAt}" /></label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated user</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <c:forEach items="${userList}"
													var="user">
													<c:if
														test="${user.id == (empty geotechnicalInvestigation.updatedBy ? geotechnicalInvestigation.createdBy : geotechnicalInvestigation.updatedBy)}">
														${user.name}
													</c:if>
												</c:forEach>

											</label>
										</div>
									</div>
								</div>

								<div class="col-12 mt-3">
									<p>Uploaded geotechnical investigation Document</p>
									<div class="table-responsive">
										<table
											class="readOnlyTable table-bordered table-condensed text-left w-100">
											<thead>
												<tr>
													<th>S.no</th>
													<th>File</th>
													<th>Size</th>
													<th>Upload date</th>
													<th>Upload by</th>
													<th>Status</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${GIAttachmentFiles}" var="file"
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
														<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm a"
																value="${empty file.updatedAt ? file.createdAt : file.updatedAt}" /></td>
														<td><c:forEach items="${userList}" var="user">
																<c:if
																	test="${user.id == (empty file.updatedBy ? file.createdBy : file.updatedBy)}">
														${user.name}
													</c:if>
															</c:forEach></td>
														<td><c:choose>

																<c:when
																	test="${EnumFilter.ATTACHMENT_APPROVED.status == file.status}">
																	<span class="text-success"><i
																		class="fa fa-check"></i>&nbsp;Approved</span>
																</c:when>

																<c:when
																	test="${EnumFilter.ATTACHMENT_REJECTED.status == file.status}">
																	<span class="text-danger"><i class="fa fa-close"></i>&nbsp;Rejected</span>
																</c:when>

																<c:otherwise>
																	<span class="text-muted"><i
																		class="fa fa-hourglass"></i>&nbsp;Pending</span>
																</c:otherwise>
															</c:choose></td>
													</tr>

												</c:forEach>
												<c:if test="${fn:length(GIAttachmentFiles) == 0}">
													<tr class="landSurveyDetailsUploadDocuments">
														<td colspan="6">
															<p class="text-center p-4 mb-0">No attachments found</p>
														</td>
													</tr>
												</c:if>
											</tbody>
										</table>
									</div>

								</div>


							</div>
						</c:when>
						<c:otherwise>
							<div class="row mr-0">
								<div class="col-12 yet-to-start">
									<span>Yet to start</span>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
					<hr />
					<h2 class="fs-title">Technical Sanction</h2>
					<c:choose>
						<c:when
							test="${workPhasList[1].subWorkPhase[4].completionType eq PhaseCompletionType.FULL}">
							<div class="row">

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Technical Sanction No</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${technicalSanction.techSanction_no}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Sanction Date</span>
										</div>
										<div class="col-7">
											<span>:</span><label><fmt:formatDate
													pattern="dd-MM-yyyy" value="${technicalSanction.docDate}" /></label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Amount</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${technicalSanction.amount}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated Date</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <fmt:formatDate
													pattern="dd-MM-yyyy hh:mm a"
													value="${empty technicalSanction.updatedAt ? technicalSanction.createdAt : technicalSanction.updatedAt}" /></label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated user</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <c:forEach items="${userList}"
													var="user">
													<c:if
														test="${user.id == (empty technicalSanction.updatedBy ? technicalSanction.createdBy : technicalSanction.updatedBy)}">
														${user.name}
													</c:if>
												</c:forEach>

											</label>
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="row mr-0">
								<div class="col-12 yet-to-start">
									<span>Yet to start</span>
								</div>
							</div>
						</c:otherwise>
					</c:choose>


				</div>
				<div
					class="tab-pane fade ${activePhaseIndex == 3 ? 'show active' :''}">
					<h2 class="fs-title">Estimation</h2>
					<c:choose>
						<c:when
							test="${workPhasList[2].subWorkPhase[0].completionType eq PhaseCompletionType.FULL}">
							<div class="row">
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>cost</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${workEstimation.cost }</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated Date</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <fmt:formatDate
													pattern="dd-MM-yyyy hh:mm a"
													value="${empty workEstimation.updatedAt ? workEstimation.createdAt : workEstimation.updatedAt}" /></label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated user</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <c:forEach items="${userList}"
													var="user">
													<c:if
														test="${user.id == (empty workEstimation.updatedBy ? workEstimation.createdBy : workEstimation.updatedBy)}">
														${user.name}
													</c:if>
												</c:forEach>

											</label>
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="row mr-0">
								<div class="col-12 yet-to-start">
									<span>Yet to start</span>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
					<hr />
					<h2 class="fs-title">Tendering Process</h2>
					<c:choose>
						<c:when
							test="${workPhasList[2].subWorkPhase[1].completionType eq PhaseCompletionType.FULL}">
							<div class="row">
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Date of Preparation of IFB</span>
										</div>
										<div class="col-7">
											<span>:</span><label><fmt:formatDate
													pattern="dd-MM-yyyy"
													value="${tenderProcess.ifbPreperationDate}" /></label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Tender Notice Number</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${tenderProcess.tenderNoticeNumber }</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Tender Notice Issued date </span>
										</div>
										<div class="col-7">
											<span>:</span><label><fmt:formatDate
													pattern="dd-MM-yyyy"
													value="${tenderProcess.tenderNoticeIssuedDate}" /></label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Notice issuing authorities (SE/CE/ENC)</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${tenderProcess.noticeIssuingAuthorities.name }</label>
										</div>
									</div>
								</div>
								<div class="col-12 text-left">
									<h2 class="fs-title" style="font-size: 15px;">Publication
										in News Paper</h2>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>English Newspaper name</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${tenderProcess.englishNewspaperName }</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Published Date</span>
										</div>
										<div class="col-7">
											<span>:</span><label><fmt:formatDate
													pattern="dd-MM-yyyy"
													value="${tenderProcess.engNewsPaperDate}" /></label>
										</div>
									</div>
								</div>

								<div class="col-12 mb-3">
									<p>Upload Document</p>
									<div class="table-responsive">
										<table
											class="readOnlyTable table-bordered table-condensed text-left w-100">
											<thead>
												<tr>
													<th style="width: 5%">S.no</th>
													<th>File</th>
													<th>Size</th>
													<th>Upload date</th>
													<th>Upload by</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${engPublicationAttachements}" var="file"
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
														<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm a"
																value="${empty file.updatedAt ? file.createdAt : file.updatedAt}" /></td>
														<td><c:forEach items="${userList}" var="user">
																<c:if
																	test="${user.id == (empty file.updatedBy ? file.createdBy : file.updatedBy)}">
														${user.name}
													</c:if>
															</c:forEach></td>
													</tr>

												</c:forEach>
												<c:if test="${fn:length(engPublicationAttachements) == 0}">
													<tr class="landSurveyDetailsUploadDocuments">
														<td colspan="5">
															<p class="text-center p-4 mb-0">No attachments found</p>
														</td>
													</tr>
												</c:if>
											</tbody>
										</table>
									</div>

								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Telugu Newspaper name</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${tenderProcess.teluguNewspaperName }</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Publish date</span>
										</div>
										<div class="col-7">
											<span>:</span><label><fmt:formatDate
													pattern="dd-MM-yyyy"
													value="${tenderProcess.telNewspaperDate}" /></label>
										</div>
									</div>
								</div>
								<div class="col-12 mb-3">
									<p>Upload Document</p>
									<div class="table-responsive">
										<table
											class="readOnlyTable table-bordered table-condensed text-left w-100">
											<thead>
												<tr>
													<th style="width: 5%">S.no</th>
													<th>File</th>
													<th>Size</th>
													<th>Upload date</th>
													<th>Upload by</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${teluguPublicationAttachements}"
													var="file" varStatus="loop">
													<c:set var="filePathParts"
														value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
													<tr class="landSurveyDetailsUploadDocuments">
														<td>${loop.index + 1}</td>
														<td><a
															href="${pageContext.request.contextPath}${file.path}"
															target="_blank">${filePathParts[fn:length(filePathParts)-1]}</a>
														</td>
														<td>${file.convertFileSize}</td>
														<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm a"
																value="${empty file.updatedAt ? file.createdAt : file.updatedAt}" /></td>
														<td><c:forEach items="${userList}" var="user">
																<c:if
																	test="${user.id == (empty file.updatedBy ? file.createdBy : file.updatedBy)}">
														${user.name}
													</c:if>
															</c:forEach></td>
													</tr>

												</c:forEach>
												<c:if
													test="${fn:length(teluguPublicationAttachements) == 0}">
													<tr class="landSurveyDetailsUploadDocuments">
														<td colspan="5">
															<p class="text-center p-4 mb-0">No attachments found</p>
														</td>
													</tr>
												</c:if>
											</tbody>
										</table>
									</div>

								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Bid Start Date</span>
										</div>
										<div class="col-7">
											<span>:</span><label><fmt:formatDate
													pattern="dd-MM-yyyy" value="${tenderProcess.bidStrartDate}" /></label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Bid Closing Date</span>
										</div>
										<div class="col-7">
											<span>:</span><label><fmt:formatDate
													pattern="dd-MM-yyyy"
													value="${tenderProcess.bidClosingDate}" /></label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Bid Opening Date</span>
										</div>
										<div class="col-7">
											<span>:</span><label><fmt:formatDate
													pattern="dd-MM-yyyy"
													value="${tenderProcess.bidOpeningDate}" /></label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>No of Bids received through Online</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${tenderProcess.bidsReceived }</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>No of Bidders Submitted Hard Copy</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${tenderProcess.hardCopiesSubmitted }</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>No of Bids qualified for Opening of Price Bid</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${tenderProcess.bidsForPriceBid }</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Date of Evaluation Completed</span>
										</div>
										<div class="col-7">
											<span>:</span><label><fmt:formatDate
													pattern="dd-MM-yyyy"
													value="${tenderProcess.dateOfEvaluationCompleted}" /></label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Estimated Contract Value (in Rs.)</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${tenderProcess.contractValue }</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Contract Value quoted By L1 Bidder</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${tenderProcess.contractValueByL1Bidder }</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Percentage quoted Less / Excess</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${tenderProcess.percentageQuoted }</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Bid Status</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${tenderProcess.bidStatus }</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Date of LOA Issued to Contractor</span>
										</div>
										<div class="col-7">
											<span>:</span><label><fmt:formatDate
													pattern="dd-MM-yyyy"
													value="${tenderProcess.dateOfLoaIssued}" /></label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Name of the agency </span>
										</div>
										<div class="col-7 d-flex">
											<span>:</span><label>${tenderProcess.angencyName.name }</label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated Date</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <fmt:formatDate
													pattern="dd-MM-yyyy hh:mm a"
													value="${empty tenderProcess.updatedAt ? tenderProcess.createdAt : tenderProcess.updatedAt}" /></label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated user</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <c:forEach items="${userList}"
													var="user">
													<c:if
														test="${user.id == (empty tenderProcess.updatedBy ? tenderProcess.createdBy : tenderProcess.updatedBy)}">
														${user.name}
													</c:if>
												</c:forEach>

											</label>
										</div>
									</div>
								</div>

							</div>


						</c:when>
						<c:otherwise>
							<div class="row mr-0">
								<div class="col-12 yet-to-start">
									<span>Yet to start</span>
								</div>
							</div>
						</c:otherwise>
					</c:choose>

					<hr />
					<h2 class="fs-title">Tender Evaluation</h2>
					<c:choose>
						<c:when
							test="${workPhasList[2].subWorkPhase[2].completionType eq PhaseCompletionType.FULL}">

							<div class="row overlap-row-col" style="margin-right: 15px;">
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Estimate Contract Value</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${tenderEvaluation.estimateContractValue }</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Agreement Category</span>
										</div>
										<div class="col-7">
											<span>:</span><label></label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Name of Contractor / Vendor</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${tenderEvaluation.nameOfContractor }</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Agreement Number</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${tenderEvaluation.agreementNumber }</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Tender Premium</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${empty tenderEvaluation.tenderPremium ? '-' : tenderEvaluation.tenderPremium }%${empty tenderEvaluation.tenderPremiumPay ? '-' : tenderEvaluation.tenderPremiumPay}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Original Or Supplemental</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${empty tenderEvaluation.originalOrSupplemental ? '-' : tenderEvaluation.originalOrSupplemental }</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Approximate value of work to be done under
												Supplemental Agreement</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${tenderEvaluation.approximateValueOfWork }</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>If tenders have been called for is if not
												reasons recorded</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${empty tenderEvaluation.reasonsRecorded ? '-' : tenderEvaluation.reasonsRecorded}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>No. of tenders received</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${tenderEvaluation.noOfTendersReceived }</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Time allowed for this tender (in Months)</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${tenderEvaluation.timeAllowedForThisTender }</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Is the contractor signed the copy of APDSS and
												its Agenda value brought up to date</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${tenderEvaluation.contractorSigned }</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Is the date furnished for all items of work
												noted in the Scheme?</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${tenderEvaluation.dateFurnished }</label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Are the rates in the agreement within the
												estimate rates or schedule of rates whichever is less and
												are lump sum provision sufficient or likely to be executed</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${empty tenderEvaluation.estimateRatesComments ? '-' : tenderEvaluation.estimateRatesComments }</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Commencement Date</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <fmt:formatDate
													pattern="dd-MM-yyyy"
													value="${tenderEvaluation.commencementDate}" />
											</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Actual Completion Date as per Agreement</span>
										</div>
										<div class="col-7">
											<span>:</span><label><fmt:formatDate
													pattern="dd-MM-yyyy"
													value="${tenderEvaluation.actualCompletion}" /></label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Probable Completion Date</span>
										</div>
										<div class="col-7">
											<span>:</span><label><fmt:formatDate
													pattern="dd-MM-yyyy"
													value="${tenderEvaluation.probableCompletion}" /></label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Name of Contracting Agency by which Executed
												(Engineer/Zone/Division)</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${tenderEvaluation.contractingAgency}</label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated Date</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <fmt:formatDate
													pattern="dd-MM-yyyy hh:mm a"
													value="${empty tenderEvaluation.updatedAt ? tenderEvaluation.createdAt : tenderEvaluation.updatedAt}" /></label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated user</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <c:forEach items="${userList}"
													var="user">
													<c:if
														test="${user.id == (empty tenderEvaluation.updatedBy ? tenderEvaluation.createdBy : tenderEvaluation.updatedBy)}">
														${user.name}
													</c:if>
												</c:forEach>

											</label>
										</div>
									</div>
								</div>
							</div>

						</c:when>
						<c:otherwise>
							<div class="row  mr-0">
								<div class="col-12 yet-to-start">
									<span>Yet to start</span>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
					<hr />
					<h2 class="fs-title">LETTER OF ACCEPTANCE</h2>
					<c:choose>
						<c:when
							test="${workPhasList[2].subWorkPhase[3].completionType eq PhaseCompletionType.FULL}">
							<div class="row">
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Name</span>
										</div>
										<div class="col-7">
											<span>:</span><label>${letterofAcceptanceDetails.name}</label>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated Date</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <fmt:formatDate
													pattern="dd-MM-yyyy hh:mm a"
													value="${empty letterofAcceptanceDetails.updatedAt ? letterofAcceptanceDetails.createdAt : letterofAcceptanceDetails.updatedAt}" /></label>
										</div>
									</div>
								</div>

								<div class="col-6">
									<div class="row">
										<div class="col-5">
											<span>Last updated user</span>
										</div>
										<div class="col-7">
											<span>:</span><label> <c:forEach items="${userList}"
													var="user">
													<c:if
														test="${user.id == (empty letterofAcceptanceDetails.updatedBy ? letterofAcceptanceDetails.createdBy : letterofAcceptanceDetails.updatedBy)}">
														${user.name}
													</c:if>
												</c:forEach>

											</label>
										</div>
									</div>
								</div>
								<div class="col-12 mt-3">
									<p>Upload Document</p>
									<div class="table-responsive">
										<table
											class="readOnlyTable table-bordered table-condensed text-left w-100">
											<thead>
												<tr>
													<th style="width: 5%">S.no</th>
													<th>File</th>
													<th>Size</th>
													<th>Upload date</th>
													<th>Upload by</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${letterofAcceptanceAttachments}"
													var="file" varStatus="loop">
													<c:set var="filePathParts"
														value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
													<tr class="landSurveyDetailsUploadDocuments">
														<td>${loop.index + 1}</td>
														<td><a
															href="${pageContext.request.contextPath}${file.path}"
															target="_blank">${filePathParts[fn:length(filePathParts)-1]}</a>
														</td>
														<td>${file.convertFileSize}</td>
														<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm a"
																value="${empty file.updatedAt ? file.createdAt : file.updatedAt}" /></td>

														<td><c:forEach items="${userList}" var="user">
																<c:if
																	test="${user.id == (empty file.updatedBy ? file.createdBy : file.updatedBy)}">
														${user.name}
													</c:if>
															</c:forEach></td>
													</tr>

												</c:forEach>
												<c:if
													test="${fn:length(letterofAcceptanceAttachments) == 0}">
													<tr class="landSurveyDetailsUploadDocuments">
														<td colspan="5">
															<p class="text-center p-4 mb-0">No attachments found</p>
														</td>
													</tr>
												</c:if>
											</tbody>
										</table>
									</div>

								</div>

							</div>
						</c:when>
						<c:otherwise>
							<div class="row  mr-0">
								<div class="col-12 yet-to-start">
									<span>Yet to start</span>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="row">
				<div class="col-12 p-4">

					<button type="button" id="backToHomeBtn"
						class="btn btn-primary pull-left">
						<i class="fa fa-long-arrow-left"></i>&nbsp;Back
					</button>

					<button type="button" class="btn btn-info pull-right ml-5"
						id="next">Next</button>
					<button type="button" class="btn btn-info pull-right" id="previous">Previous</button>

				</div>
			</div>

		</div>
		<!-- /.MultiStep Form -->
	</section>



	<!--=== Footer ====--> <jsp:include page="online-mis-footer.jsp" /> <script>
		$(document)
				.ready(
						function() {

							$("#backToHomeBtn")
									.off()
									.on(
											'click',
											function() {
												window.location.href = "<c:url value='/adminloggedin'/>";
											});
							$("#nav-tab  li a.nav-link:not(.disabled)").on(
									'click',
									function() {
										window.location.href = $(this).attr(
												"href");
									});

							var index = $("#nav-tab li a.active").parent("li")
									.index();

							var lastActiveTab = $(
									"#nav-tab  li a.nav-link:not(.disabled)")
									.parent("li").last().index();

							var previousButtonRef = $("#previous").prop(
									"disabled", index == 0);
							var nextButtonRef = $("#next").prop("disabled",
									index == lastActiveTab);

							if (index == 0) {
								previousButtonRef.addClass("click-not-allowed")
							} else {
								previousButtonRef.removeClass(
										"click-not-allowed").on(
										'click',
										function() {
											$("#nav-tab li a.active").parent(
													"li").prev().find("a")
													.trigger("click");
										});

							}

							if (index == lastActiveTab) {
								nextButtonRef.addClass("click-not-allowed")
							} else {
								nextButtonRef.removeClass("click-not-allowed")
										.on(
												'click',
												function() {
													$("#nav-tab li a.active")
															.parent("li")
															.next().find("a")
															.trigger("click");
												});

							}

						});
	</script>
</body>
</html>