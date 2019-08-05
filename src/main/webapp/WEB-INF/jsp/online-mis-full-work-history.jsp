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

.no-history-found {
	position: absolute;
	top: 50%;
	left: 50%;
	font-size: 25px;
	color: #989898;
	transform: translate(-50%, -50%);
}
</style>
</head>

<body>

	<!-- dummy content start -->
	<div class="container work-histoyr-event-container">



		<%-- <c:forEach items="${workHistoryRecentToOld}"
				var="workHistoryRecentToOldEntry">
				<h2 class="work-action-title">
					<fmt:formatDate pattern="dd-MM-yyyy"
						value="${workHistoryRecentToOldEntry.key}" />
				</h2>
				
				
				<ul class="timeline-items">
					<c:forEach items="${workHistoryRecentToOldEntry.value}"
						var="workHistory" varStatus="loop">											

						<li
							class="is-hidden timeline-item ${loop.count%2 == 0 ? 'inverted' : ''}">
							<h3>${workHistory.actionPerform}</h3>
							<hr>

							<div class="row work-details text-left">
								<div class="col-6">Module</div>
								<div class="col-6 d-flex">
									<span>:</span>&nbsp;<label>${workHistory.module}</label>
								</div>
								<div class="col-6">Sub Module</div>
								<div class="col-6 d-flex">
									<span>:</span>&nbsp;<label>${workHistory.subModule}</label>
								</div>
								<div class="col-6">User</div>
								<div class="col-6 d-flex">
									<span>:</span>&nbsp;<label>${workHistory.user.name}</label>
								</div>

							</div>

							<hr> <time>
								<fmt:formatDate pattern="hh:mm a"
									value="${workHistory.createdDate}" />
							</time>
						</li>
					</c:forEach>
				</ul>


			</c:forEach> --%>
		<c:choose>
			<c:when test="${fn:length(workHistoryRecentToOld) > 0}">
				<section id="cd-timeline" class="cd-container">
					<c:forEach items="${workHistoryRecentToOld}" var="workHistory"
						varStatus="loop">


						<div class="cd-timeline-block">
							<div class="cd-timeline-img cd-movie">
								<div class="history-icon-holder">
									<i class="fa fa-history"></i>
								</div>
							</div>
							<!-- cd-timeline-img -->

							<div class="cd-timeline-content">
								<h2>${workHistory.actionPerform}</h2>
								<hr />

								<div class="row work-details text-left">
									<div class="col-6">Module</div>
									<div class="col-6 d-flex">
										<span>:</span>&nbsp;<label>${workHistory.module}</label>
									</div>
									<div class="col-6">Sub Module</div>
									<div class="col-6 d-flex">
										<span>:</span>&nbsp;<label>${workHistory.subModule}</label>
									</div>
									<div class="col-6">User</div>
									<div class="col-6 d-flex">
										<span>:</span>&nbsp;<label>${workHistory.user.name}</label>
									</div>

								</div>

								<span class="cd-date"> <fmt:formatDate
										pattern="dd MMM yyyy hh:mm a"
										value="${workHistory.createdDate}" /></span>
							</div>
							<!-- cd-timeline-content -->
						</div>
					</c:forEach>

				</section>



			</c:when>
			<c:otherwise>
				<div class="row">
					<div class="col-12">
						<div class="no-history-found-container">
							<p class="p-5 text-center m-5 no-history-found">No History
								found</p>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>


		<div class="row">
			<div class="col-12 p-4">

				<button type="button" id="backToHomeBtn"
					class="btn btn-primary pull-left">
					<i class="fa fa-long-arrow-left"></i>&nbsp;Back
				</button>

			</div>
		</div>

	</div>

	<jsp:include page="online-mis-footer.jsp" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"
		type="text/javascript"></script>
	<script>
		jQuery(document)
				.ready(
						function($) {

							$("#backToHomeBtn")
									.off()
									.on(
											'click',
											function() {
												window.location.href = "<c:url value='/work'/>";
											});
							var $timeline_block = $('.cd-timeline-block');

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
						});
	</script>
</body>
</html>