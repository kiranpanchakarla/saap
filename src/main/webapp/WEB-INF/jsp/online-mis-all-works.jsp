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
<title>SAAP : All works</title>

<link
	href="<c:url value="/resources/css/dataTables/buttons.dataTables.min.css"/>"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value="/resources/css/dataTables/jquery.dataTables.min.css"/>"
	rel="stylesheet" type="text/css" />

<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
<jsp:include page="online-mis-header.jsp" />
</head>

<body>


	<section id="contact" class="signIn-contact section-bg-con">
		<div class="container-full">
			<div class="row">
				<form id="msform" class="col-md-12" method="get"
					action="${createUrl}" modelAttribute="workObject">



					<div class="">
						<table id="viewTable"
							class="display table-hover table-striped table-bordered ">
							<thead>
								<tr>
									<th>S.No</th>
									<th>Work No</th>
									<th>Type of Work</th>
									<th>Nature Of Work</th>
									<th>Department Name</th>
									<th>Consultant firm</th>
									<th>Agency Name</th>
									<th>Status</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${viewList}" var="viewDetails">
									<tr>
										<td><c:set var="count" value="${count + 1}" scope="page" />
											<c:out value="${count}" /></td>
										<%-- 	<td>${viewDetails.id}</td> --%>
										<td>${viewDetails.workNo}</td>
										<td>${viewDetails.typeOfWork}</td>
										<td>${viewDetails.natureOfWork}</td>
										<td>${viewDetails.departmentName}</td>
										<td>${viewDetails.consultantfirm}</td>
										<td>${viewDetails.agencyName}</td>
										<td>${viewDetails.status}</td>
										<td><a class="btn btn-history"
											href="<c:url value="/work/${viewDetails.id}/phase/1/status"/>"
											onclick="" data-toggle="tooltip" data-placement="top"
											title="View work status till now"><i class="fa fa-eye left"></i></a> <a
											class="btn btn-delete"
											href="<c:url value="/work/${viewDetails.id}/history"/>"
											onclick="" data-toggle="tooltip" data-placement="top"
											title="Work history"><i class="fa fa-history left"></i></a></td>

									</tr>
								</c:forEach>

							</tbody>

						</table>
					</div>


				</form>
			</div>
		</div>
	</section>

	<script type="text/javascript">
		$(document).ready(function() {

			$('#viewTable').DataTable({
				"scrollX" : false,
				"searching" : false,
				"info" : false,
				"responsive" : true,
				"dom" : '<"top"i>rt<"bottom"flp><"clear">'
			});
		});
	</script>

	<script
		src=<c:url value="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"/>
		type="text/javascript"></script>
	<jsp:include page="online-mis-footer.jsp" />

</body>
</html>