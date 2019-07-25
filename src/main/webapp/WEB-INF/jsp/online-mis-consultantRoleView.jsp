<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



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



</head>

<body>


	<c:choose>
		<c:when
			test="${consultantInfoObject != null && (workInfo.workStatus eq 'Land_Details' or  workInfo.workStatus eq 'PEND_SAAP_APRVL')}">
			<c:url value="/ConsultantInfo/edit/${consultantInfoObject.work.id}"
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

	<section id="contact" class="section-bg-con">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form id="msform" method="get" action="${createUrl}">

						<fieldset>
							<div class="col-md-6">
								<div class="text-center">
									<h4 class="section-title">Work</h4>
								</div>
								<div class="table-responsive">

									<table class="table table-bordered" style="width: 100%">
										<thead>
											<tr>
												<th>Types of Work</th>
												<td>${workInfo.typeOfWork.name}</td>
											</tr>
											<tr>
												<th>Nature of work</th>
												<td>${workInfo.natureOfWork.name}</td>
											</tr>
											<tr>
												<th>District</th>
												<td>${workInfo.district.name}</td>
											</tr>
											<tr>
												<th>Constituency</th>
												<td>${workInfo.constituency.name}</td>

											</tr>
											<tr>
												<th>Mandal</th>
												<td>${workInfo.mandal.name}</td>

											</tr>
											<tr>
												<th>Village</th>
												<td>${workInfo.village.name}</td>

											</tr>
											<tr>
												<th>Location</th>
												<td>${workInfo.district.name}</td>

											</tr>
											<tr>
												<th>Work Number</th>
												<td>${workInfo.workNo}</td>

											</tr>
											<tr>
												<th>Work Detail</th>
												<td>${workLineItems.workDetails}</td>

											</tr>
											<tr>
												<th>Estimated Cost</th>
												<td>${workLineItems.cost}</td>
											</tr>

										</thead>
										<tbody style="display: none;"></tbody>

									</table>

								</div>
							</div>

							<div class="col-md-6">
								<div class="text-center">
									<h4 class="section-title">Administrative Sanction</h4>
								</div>
								<div class="table-responsive">
									<table class="table table-bordered" style="width: 100%">
										<thead>

											<tr>
												<th>Name of Work</th>
												<td>${adminInfo.workName}</td>
											</tr>
											<tr>
												<th>Work Number</th>
												<td>${adminInfo.workNumber}</td>
											</tr>
											<tr>
												<th>Sanctioned Details</th>
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
														<a href="${file.value}" target="_blank" id="docView"
															name="image" style="float: left;">${file.key}</a>
														<br>
													</c:forEach></td>

											</tr>
										</thead>
										<tbody style="display: none;"></tbody>

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

									<table class="table table-bordered" style="width: 100%">
										<thead>
											<tr>
												<th>Department</th>
												<td>${deptInfo.departmentName}</td>
											</tr>
											<tr>
												<th>Nature of work</th>
												<td>${workInfo.natureOfWork.name}</td>
											</tr>
											<tr>
												<th>Circle</th>
												<td>${deptInfo.circle}</td>
											</tr>
											<tr>
												<th>Division</th>
												<td>${deptInfo.divisionName.name}</td>

											</tr>
											<tr>
												<th>SubDivision</th>
												<td>${deptInfo.subdivisionName.name}</td>

											</tr>
											<tr>
												<th>Section</th>
												<td>${deptInfo.sectionName.name}</td>

											</tr>
											<tr>
												<th>Section Officer</th>
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

										</thead>
										<tbody style="display: none;"></tbody>

									</table>

								</div>
							</div>

							<div class="col-md-6">
								<div class="text-center">
									<h4 class="section-title">Land Details</h4>
								</div>
								<div class="table-responsive">
									<table class="table table-bordered" style="width: 100%">
										<thead>
											<tr>
												<th>Work</th>
												<td>${landInfo.work.natureOfWork.name}</td>
											</tr>
											<tr>
												<th>Work Number</th>
												<td>${landInfo.work.workNo}</td>
											</tr>
											<tr>
												<th>Name of Work</th>
												<td>${adminInfo.workName}</td>
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
														<a href="${landfile.value}" target="_blank" id="docView"
															name="image" style="float: left;">${landfile.key}</a>
														<br>
													</c:forEach></td>

											</tr>

										</thead>
										<tbody style="display: none;"></tbody>

									</table>
								</div>
							</div>
							<br>
							<%-- <c:if test="${userRole eq 'ROLE_DEPARTMENT'}">
		<div class="col-md-12" align="right">
          <button type="submit" class="btn btn-info">Executive Department</button>
         </div>
         </c:if> --%>

							<%--  <c:if test="${userRole eq 'ROLE_CONSULTANT'}"> --%>
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
							<%--  </c:if> --%>

						</fieldset>



					</form>
				</div>
			</div>
		</div>
	</section>
	<br>

	<br>
	<br>

	<script>
		$(document).ready(function() {
			/* 	 alert( $.fn.jquery ) */
			$('#viewTable').DataTable({
				"scrollX" : false,
				"searching" : false,
				"bPaginate" : false,
				"info" : false,
				"dom" : '<"top"i>rt<"bottom"flp><"clear">'
			});
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