<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Survey Of Land Details</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
</head>
<body>
	<!--=== Header ====-->
	<jsp:include page="online-mis-header.jsp" />
	<main id="main"> <!--==========================
      Contact Us Section
    ============================-->

	<section id="contact" class="section-bg-con">

		<div class="row">
			<div class="col-md-12">
				<c:url value="save" var="createUrl" />
				<form:form id="msform" method="POST" action="#"
					modelAttribute="landSurveyDetails" enctype="multipart/form-data">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

					<!-- fieldsets -->
					<fieldset>
						<div class="fs-list-full">
							<h2 class="fs-title">Land details</h2>

							<form:input type="hidden" id="landId" path="landDetails.id" />

							<form:input type="hidden" id="workid" path="work.id" />


							<ul class="fs-list-details">
								<li><p>
										Nature of Work <span class="red">*</span>
									</p></li>
								<li><input type="text" id="natureofwork"
									class="form-control mb-md" readonly="true"
									value="${landSurveyDetails.work.natureOfWork.name}" /></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>
										Work Number <span class="red">*</span>
									</p></li>
								<li><input type="text" id="worknum" title="1"
									class="form-control mb-md" readonly="true"
									value="${landSurveyDetails.work.workNo}" /></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>
										Name of the Work <span class="red">*</span>
									</p></li>
								<li><input type="text" id="nameofwork"
									class="form-control mb-md" readonly="true"
									value="${workLineItems.workDetails}" /></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>
										Land Extend <span class="red">*</span>
									</p></li>
								<li><input type="text" id="LandExtended"
									class="form-control mb-md" readonly="true"
									value="${landSurveyDetails.landDetails.landExtend}" /></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>
										Survey Number <span class="red">*</span>
									</p></li>
								<li><input type="text" id="SurveyNumber"
									class="form-control mb-md" readonly="true"
									value="${landSurveyDetails.landDetails.surveyNo}" /></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>
										Field Mesurment Book Details <span class="red">*</span>
									</p></li>
								<li><input type="text" id="bookDetailsErr"
									class="form-control mb-md" readonly="true"
									value="${landSurveyDetails.landDetails.bookDetails}" /></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>
										Type Of Land <span class="red">*</span>
									</p></li>
								<li><input type="text" id="typeOfLand"
									class="form-control mb-md" readonly="true"
									value="${landSurveyDetails.landDetails.typeOfLand.name}" /></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>
										Uploaded Land Details Document <span class="red">*</span>
									</p></li>
								<c:forEach items="${landAttachmentFiles}" var="file">
									<li><a href="${file}" target="_self" id="docView"
										name="image">View Document</a></li>
								</c:forEach>
							</ul>


							<ul class="fs-list-details">
								<li><p>What is the Survey</p></li>
								<li><textarea id="surveycontent"
										placeholder="What is the survey!" class="form-control mb-md" readonly="true">${landSurveyDetails.surveycontent}</textarea>
									<span id="surveycontentErr" class="errors"
									style="color: red; float: right;"></span></li>
							</ul>

							<ul class="fs-list-details">
								<li><p>Upload Land Details Document(pdf/jpg/png)</p></li>
								<li><input type="file" name="file" id="files" multiple
									class="form-control mb-md"></li>
								<%-- <c:if test="${landDetails.id!=null}">
									<li><a href="${filePath}" target="_self" id="docView"
										name="image">View Document</a></li>
								</c:if> --%>
								<span id="file_error" class="errors"
									style="color: red; float: right;"></span>
							</ul>

							<ul class="fs-list-details">
								<li><p>Comments/Remarks</p></li>
								<li><textarea id="comments" readonly="true" placeholder="Comments"
										class="form-control mb-md">${landSurveyDetails.comments}</textarea>
									<span id="commentsErr" class="errors"
									style="color: red; float: right;"></span></li>
							</ul>
						</div>
						<input type="submit" id="submit" name="next"
							class="next action-button"
							value="${empty landSurveyDetails.id ? 'Save' : 'Update'} and Continue">
					</fieldset>

				</form:form>


			</div>
		</div>
		<!-- /.MultiStep Form -->


	</section>



	<!-- #contact --> </main>
	<!--=== Footer ====-->
	<jsp:include page="online-mis-footer.jsp" />
</body>
</html>