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

<link href="<c:url value="/resources/lib/animate/animate.css"/>"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/lib/timelify/css/timelify.css"/>"
	rel="stylesheet" type="text/css" />

<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
<jsp:include page="online-mis-header.jsp" />

<style type="text/css">
.no-history-found-container {
	min-height: calc(100vh - 154px);
}

.no-lr-margin {
	margin-left: 0px !important;
	margin-right: 0px !important;
}

.no-history-found-container>.row {
	padding: 8px 0px;
	border-bottom: 1px solid #dfdfdf;
	margin-bottom: 4px;
}

.no-history-found-container>.row:last-child {
	border-bottom: none;
}

.work-history-header {
	margin: 4px 0px 6px;
	padding: 4px;
	text-align: center;
	background: #00438b;
}

.work-history-header label {
	margin: 0px;
	color: #ff8800;
	padding-bottom: 3px;
}

.no-history-found {
	position: absolute;
	top: 50%;
	left: 50%;
	font-size: 25px;
	color: #989898;
	transform: translate(-50%, -50%);
}
/*
.work-details label {
	word-break: break-word;
}

.timeline h2.work-action-title {
	width: 200px;
	word-break: break-word;
}

.timeline .timeline-items .timeline-item.inverted {
	text-align: left !important;
}

.history-icon-holder {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 30px;
	height: 30px;
	transform: translate(-50%, -50%);
	padding: 2px;
	margin-left: 0px;
	text-align: center;
	color: #ffffff;
	background: transparent;
	transition: transform .02S ease-out;
}

.cd-timeline-img {
	background-color: #00438b !important;
}

.history-icon-holder .fa {
	font-size: 25px
}

.work-details label {
	color: #212529;
}

.work-histoyr-event-container {
	background-color: #e9f0f5;
}

.cd-date {
	font-size: 1.2rem !important;
}

.no-history-found-container {
	min-height: calc(100vh - 217px);
}


*/
</style>

</head>

<body>

	<!-- dummy content start -->
	<div class="container work-histoyr-event-container">

		<div class="no-history-found-container">
			<h2 class="work-history-header">
				<label>Work History</label>
			</h2>

			


			<c:choose>
				<c:when test="${fn:length(workHistoryRecentToOld) > 0}">
					<c:forEach items="${workHistoryRecentToOld}" var="workHistory"
						varStatus="loop">
						<!-- <li class="list-group-item"> -->
						<div class="row no-lr-margin">
							<div class="col-lg-2 col-md-4 col-sm-4 col-xs-5">
								<span class="cd-date"> <fmt:formatDate
										pattern="dd MMM yyyy hh:mm a" value="${workHistory.date}" />
								</span>
							</div>
							<div class="col-lg-10 col-md-8 col-sm-8 col-xs-7 d-flex">
								<span>&nbsp;:&nbsp;</span> <span>${workHistory.message}</span>
							</div>
						</div>
						<!-- </li> -->
					</c:forEach>
					<!-- </ul> -->


				</c:when>
				<c:otherwise>
					<div class="row no-lr-margin">
						<div class="col-12">
							<div class="w-100 position-relative">
								<h4 class="p-5 text-center m-5">No History found</h4>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>


			<div class="row no-lr-margin">
				<div class="col-12 pl-0">

					<button type="button" id="backToHomeBtn"
						class="btn btn-primary pull-left">
						<i class="fa fa-long-arrow-left"></i>&nbsp;Back
					</button>

				</div>
			</div>
		</div>
	</div>

	<jsp:include page="online-mis-footer.jsp" />
	<!-- <script
		src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"
		type="text/javascript"></script> -->
	<script>
		jQuery(document).ready(function($) {

			$("#backToHomeBtn").off().on('click', function() {
				window.location.href = "<c:url value='/work'/>";
			});
			/*var $timeline_block = $('.cd-timeline-block');

			//hide timeline blocks which are outside the viewport
			$timeline_block
					.each(function() {
						if ($(this).offset().top > $(window)
								.scrollTop()
								+ $(window).height() * 0.75) {
							$(this)
									.find(
											'.cd-timeline-img, .cd-timeline-content')
									.addClass('is-hidden');
						}
					});

			//on scolling, show/animate timeline blocks when enter the viewport
			$(window)
					.on(
							'scroll',
							function() {
								$timeline_block
										.each(function() {
											if ($(this)
													.offset().top <= $(
													window)
													.scrollTop()
													+ $(window)
															.height()
			 * 0.75
													&& $(this)
															.find(
																	'.cd-timeline-img')
															.hasClass(
																	'is-hidden')) {
												$(this)
														.find(
																'.cd-timeline-img, .cd-timeline-content')
														.removeClass(
																'is-hidden')
														.addClass(
																'bounce-in');
											}
										});
							});
			 */
		});
	</script>
</body>
</html>