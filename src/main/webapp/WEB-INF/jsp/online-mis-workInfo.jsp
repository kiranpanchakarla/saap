<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Online MIS</title>
<link
	href="<c:url value="/resources/css/dataTables/buttons.dataTables.min.css"/>"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value="/resources/css/dataTables/jquery.dataTables.min.css"/>"
	rel="stylesheet" type="text/css" />

<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
<jsp:include page="online-mis-header.jsp" />
<script src="<c:url value="/resources/lib/jquery/jquery.min.js"/>"
	type="text/javascript"></script>

<style>
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
</style>

</head>

<body>

	<c:choose>
		<c:when test="${userRole eq 'ROLE_CONSULTANT'}">
			<c:choose>
				<c:when
					test="${consultantInfoObject != null && (workInfo.workStatus eq 'Land_Details' or  workInfo.workStatus eq 'PEND_SAAP_APRVL')}">
					<c:url value="/ConsultantInfo/edit/${consultantInfoObject.work.id}"
						var="createUrl" />
				</c:when>
				
				<c:when
					test="${consultantInfoObject == null && (workInfo.workStatus eq 'Land_Details' or  workInfo.workStatus eq 'PEND_SAAP_APRVL')}">
					<c:url value="/ConsultantInfo/create/${workInfo.id}"
						var="createUrl" />
				</c:when>

				<c:when
					test="${workInfo.workStatus eq 'WORK_ESTMASN_CMPLTD' or workInfo.workStatus eq 'TECHNICL_SANKSN_CMPLTD'}">
					<c:url
						value="/work/${workInfo.id}/estimation/${workInfo.workStatus eq 'WORK_ESTMASN_CMPLTD' ? 'create' : 'edit' }"
						var="createUrl" />
				</c:when>

				<c:when test="${workInfo.workStatus eq 'SAAP_APRVD'}">
					<c:url value="/preliminaryDrawings/view" var="createUrl" />
				</c:when>

				<c:otherwise>
					<c:url value="/ConsultantInfo/create" var="createUrl" />
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
					<c:url value="/consultant/consultantInfo" var="createUrl" />
		</c:otherwise>
	</c:choose>
	<section id="contact" class="section-bg-con">
		<div class="container">
			<c:choose>
				<c:when test="${userRole eq 'ROLE_CONSULTANT'}">
					<c:import url="/WEB-INF/jsp/online-mis-consultantTabView.jsp" />
				</c:when>
				<c:otherwise>
					<c:import url="/WEB-INF/jsp/online-mis-departmentTabView.jsp" />
				</c:otherwise>
			</c:choose>

			<div class="tab-content">

					<div class="row">
						<div class="col-md-12">
							<form id="msform" method="get" action="${createUrl}">
								<br>
								<h2 class="fs-title">Work</h2>
								<div class="row">
									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Work Type</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${workInfo.typeOfWork.name}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Work Nature</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${workInfo.natureOfWork.name}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>District</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${workInfo.district.name}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Constituency</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${workInfo.constituency.name}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Mandal</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${workInfo.mandal.name}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Village</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${workInfo.village.name}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Location</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${workInfo.location}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Work Number</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${workInfo.workNo}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Work Detail</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${workLineItems.workDetails}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Estimated Cost</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${workLineItems.cost}</label>
											</div>
										</div>
									</div>

								</div>
								<hr />
								<br>
								<h2 class="fs-title">Administrative Sanction</h2>
								<div class="row">

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Sanctioned Details</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${adminInfo.sanctionedDetails}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Grant</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${adminInfo.typeOfGrant.name}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Financial Year</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${adminInfo.financialYear.year}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Engagement of Department by</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${adminInfo.executiveDept.name}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Engagement of Consultant by</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${adminInfo.consultant.name}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Document Details</span>
											</div>
											<div class="col-7">
												<c:forEach items="${adminFile}" var="file">
													<a href="${file.value}" target="_blank" id="docView"
														name="image" style="float: left;">${file.key}</a>
													<br>
												</c:forEach>
											</div>
										</div>
									</div>

								</div>
								<hr />
								<br>
								<h2 class="fs-title">Department</h2>
								<div class="row">
									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Department</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${deptInfo.departmentName}</label>
											</div>
										</div>
									</div>


									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Circle</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${deptInfo.circle}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Division</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${deptInfo.divisionName.name}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>SubDivision</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${deptInfo.subdivisionName.name}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Section</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${deptInfo.sectionName.name}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Section Officer</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${deptInfo.sectionOfficerName}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Mobile</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${deptInfo.mobileNo}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Email Id</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${deptInfo.email}</label>
											</div>
										</div>
									</div>

								</div>
								<hr />
								<br>
								<h2 class="fs-title">Land Details</h2>
								<div class="row">

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Land Extend</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${landInfo.landExtend}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Survey Number</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${landInfo.surveyNo}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Field Measurement</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${landInfo.bookDetails}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Type Of Land</span>
											</div>
											<div class="col-7">
												<span>:</span><label>${landInfo.typeOfLand.name}</label>
											</div>
										</div>
									</div>

									<div class="col-4">
										<div class="row">
											<div class="col-5">
												<span>Document Details</span>
											</div>
											<div class="col-7">
												<c:forEach items="${landFile}" var="landfile">
													<a href="${landfile.value}" target="_blank" id="docView"
														name="image" style="float: left;">${landfile.key}</a>
													<br>
												</c:forEach>
											</div>
										</div>
									</div>

								</div>

								<c:if test="${userRole eq 'ROLE_DEPARTMENT'}">
									<div class="col-md-12" align="right">
										<button type="submit" class="btn btn-info">Next</button>
									</div>
								</c:if>

								<c:if test="${userRole eq 'ROLE_CONSULTANT'}">
									<div class="col-md-12" align="right">
										<c:choose>
											<c:when test="${workInfo.workStatus eq 'Land_Details'}">
												<button type="submit" class="btn btn-info">Consultant
													Info</button>
											</c:when>

											<c:otherwise>
												<button type="submit" class="btn btn-info">Next</button>
											</c:otherwise>
										</c:choose>
									</div>
								</c:if>
								<br>
							</form>
						</div>
					 
				</div>
			</div>
		</div>
	</section>
	<br>

	<br>
	<br>

	<script>
		var onChange = false;
		$(document).ready(function() {
			/* 	 alert( $.fn.jquery ) */
			$('#viewTable').DataTable({
				"scrollX" : false,
				"searching" : false,
				"bPaginate" : false,
				"info" : false,
				"dom" : '<"top"i>rt<"bottom"flp><"clear">'
			});

			$('#nav-work-tab').addClass('active');
			$('#nav-work').addClass('active');
		});
	</script>

	<!-- <script  src=<c:url value="/resources/js/scripts/dataTables/buttons.html5.min.js"/>
        type="text/javascript"></script> 
   <script src=<c:url value="/resources/js/scripts/dataTables/dataTables.buttons.min.js"/>
        type="text/javascript"></script>  -->
	<script
		src=<c:url value="/resources/js/scripts/dataTables/jquery.dataTables.min.js"/>
		type="text/javascript"></script>
	<script
		src=<c:url value="/resources/js/scripts/ui-blocker/jquery.blockUI.js"/>
		type="text/javascript"></script>


	<jsp:include page="online-mis-footer.jsp" />
</body>
</html>