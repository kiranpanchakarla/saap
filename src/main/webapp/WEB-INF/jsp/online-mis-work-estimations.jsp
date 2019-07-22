<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



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



	<section id="contact" class="section-bg-con">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<c:url value="/work/${workInfo.id}/estimation/save" var="createUrl" />
					<form:form id="msform" method="post" action="${createUrl}"
						modelAttribute="workEstimation">


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
												<td>${workInfo.workDetails}</td>

											</tr>
											<tr>
												<th>Estimated Cost</th>
												<td>${workInfo.cost}</td>
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
												<th>Name of Department</th>
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

								<div class="fs-list-full">


									<ul class="fs-list-details">
										<li><p>
												Estimation cost <span class="red">*</span>
											</p></li>
										<li><form:input type="text" id="estimation" path="cost"
												placeholder="Enter estimation" class="form-control mb-md" />
											<span id="estimation_empty_Err" class="errors d-none"
											style="color: red; float: right;">Estimation should
												not be empty</span></li>
									</ul>
								</div>

								<button type="submit" class="btn btn-info">${workEstimation.id != null ? 'Update' : 'Save'}
									estimation</button>
								<form:input type="hidden" path="id" />


								<form:input type="hidden" path="work.id" />





							</div>
							<%--  </c:if> --%>

						</fieldset>



					</form:form>
				</div>
			</div>
		</div>
	</section>
	<br>

	<br>
	<br>

	<script>
		$(document).ready(function() {

			$("#msform").on('submit', function(e) {
				$("#estimation_empty_Err").addClass("d-none");
				if ($("#estimation").val() === "") {
					$("#estimation_empty_Err").removeClass("d-none");
					$("#estimation").focus();
					return false;
				}
			});

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