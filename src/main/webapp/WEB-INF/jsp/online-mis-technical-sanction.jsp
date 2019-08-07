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
<title>SAAP : Technical Sanction</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
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
<script type="text/javascript">
	$(document).ready(
			function() {
				$('#sanctionDate').datepicker({
					altField : "#sanctionDateMask",
					altFormat : "yy-mm-dd",
					dateFormat : 'dd-mm-yy'
				});
				var dateValue = $('#sanctionDateMask').val();
				if (typeof dateValue !== "undefined" && dateValue !== null
						&& dateValue !== "")
					$('#sanctionDate').datepicker('setDate', dateValue);
			});
</script>
<body>

	<!--=== Header ====-->
	<jsp:include page="online-mis-header.jsp" />

	<!--==========================
    Intro Section
  ============================-->
	<!-- <section id="intro-inner">
  <div class="page-header">
    <section id="page-title" class="parralax">
      <div class="container rel">
        <div class="row">
          <div class="col-md-12">
            <div class="text-center">
              <h2 class="section-title">Technical Sanction</h2>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</section> -->
	<!-- #intro -->

	<main id="main"> <!--==========================
      Contact Us Section
    ============================-->

	<section id="contact" class="section-bg-con">
		<div class="container">

			<div class="row">
				<div class="col-md-12">

					<div id="nav-tab">
						<ul class="nav nav-fill nav-tabs border-bottom-0 mb-3"
							id="pills-tab" role="tablist">
							<li class="nav-item"><a class="nav-item nav-link"
								id="pills-work-info-tab" data-toggle="pill"
								href="#pills-work-info" role="tab" aria-controls="pills-home"
								aria-selected="false">Work info</a></li>
							<li class="nav-item"><a class="nav-item nav-link"
								id="pills-consultant-info-tab" data-toggle="pill"
								href="#pills-consultant-info" role="tab" aria-controls="pills-home"
								aria-selected="false">Consultant info</a></li>
							<li class="nav-item"><a class="nav-item nav-link active"
								id="pills-sanction-tab" data-toggle="pill"
								href="#pills-sanction" role="tab"
								aria-controls="pills-profile" aria-selected="true">Technical Sanction</a></li>
						</ul>
					</div>
					<c:url value="/technicalSanction/save" var="createUrl" />
					<%-- <form id="msform" method="POST" action="${createUrl}"  modelAttribute="techsanc" > --%>
					<div class="tab-content" id="pills-tabContent">

                       <!-- General work info details -->
						<div class="tab-pane fade" id="pills-work-info"
							role="tabpanel" aria-labelledby="pills-home-tab">
							<form id="msform" method="get" action="#">
								
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

							</form>


						</div>
						
						<div class="tab-pane fade" id="pills-consultant-info"
							role="tabpanel" aria-labelledby="pills-home-tab">
							<form id="msform" method="get" action="#">
							<br>
 					<h2 class="fs-title">Consultant Information</h2>
                    <div class="row">
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Consultant Firm</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.consultant_firm}</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>PAN</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.pan_number}</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>TIN </span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.tin_number}</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Mobile </span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.mobile_no}</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Landline </span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.landline_no}</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Email</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.emailId}</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Address</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.address}</label>
                                </div>
                            </div>
                        </div>
                        
                        </div>
                         
                         <br>
 					<h2 class="fs-title">BANK DETAILS OF FIRM</h2>
                    <div class="row">
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Bank</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.bank_name}</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Branch</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.branch}</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Account Type</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.account_type}</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>A/c Number</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.account_number}</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>IFSC Code</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.ifsc_code}</label>
                                </div>
                            </div>
                        </div>
                        </div>
                        <hr />
                        <br>
                        
 					<h2 class="fs-title">LAND SURVEY DETAILS</h2>
                    <div class="row">
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Survey</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${landSurveyDetails.surveycontent}</label>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Comments</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${landSurveyDetails.comments}</label>
                                </div>
                            </div>
                        </div>
                        
                         <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Land Details Document</span>
                                </div>
                                <div class="col-7">
                                   <span>:</span><c:forEach items="${landAttachmentFiles}" var="file" varStatus="loop">
									<c:set var="filePathParts" value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
									<a href="${pageContext.request.contextPath}${file.path}"
									target="_blank">${filePathParts[fn:length(filePathParts)-1]}</a>
									</c:forEach>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Land Survey Details Document</span>
                                </div>
                                <div class="col-7">
                                   <span>:</span><c:forEach items="${landSurveyAttachmentFiles}" var="file" varStatus="loop">
									<c:set var="filePathParts" value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
									<a href="${pageContext.request.contextPath}${file.path}"
									target="_blank">${filePathParts[fn:length(filePathParts)-1]}</a>
									</c:forEach>
                                </div>
                            </div>
                        </div>
                         
                        
                        </div>
                        <hr />
                        <br>
 					<h2 class="fs-title">PRELIMINARY PREPARATION LAYOUT</h2>
                    <div class="row">
                        
                        
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Document Details</span>
                                </div>
                                <div class="col-7">
                                <span>:</span><c:forEach items="${PPLayoutAttachmentFiles}" var="file" varStatus="loop">
									<c:set var="filePathParts" value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
									<a href="${pageContext.request.contextPath}${file.path}"
									target="_blank">${filePathParts[fn:length(filePathParts)-1]}</a>
									</c:forEach>
                                </div>
                            </div>
                        </div>
                        
                        </div>
                        
                         <h2 class="fs-title">GEOTECHNICAL INVESTIGATION</h2>
                    <div class="row">
                        
                         <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Comments</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${investigation.comments}</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Document Details</span>
                                </div>
                                <div class="col-7">
                                <span>:</span><c:forEach items="${GIAttachmentFiles}" var="file" varStatus="loop">
									<c:set var="filePathParts" value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
									<a href="${pageContext.request.contextPath}${file.path}"
									target="_blank">${filePathParts[fn:length(filePathParts)-1]}</a>
									</c:forEach>
                                </div>
                            </div>
                        </div>
                        
                        </div>
							
							</form>
							</div>
                       
                       <div class="tab-pane fade show active" id="pills-sanction" role="tabpanel"
							aria-labelledby="pills-profile-tab">
							<form:form id="msform" method="POST" action="${createUrl}"
						modelAttribute="techsanc">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

						<c:choose>
							<c:when test="${!empty techsanc.id}">
								<form:input type="hidden" path="id" class="form-control" id="id"></form:input>
								<form:input type="hidden" path="docDate" id="sanctionDateMask"></form:input>
							</c:when>
						</c:choose>
						<!-- fieldsets -->
						 
							<div class="col-12">
							<br></br>
								<h2 class="fs-title">Technical Sanction</h2>

								<ul class="fs-list-details">
									<li><p>
											Nature of Work <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="natureOfWork"
											path="natureOfWork" placeholder="Nature of Work"
											class="form-control mb-md" readOnly="true"
											value="${workInfo.natureOfWork.name}" /> <span id="workErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Work Number <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="workNumber"
											path="workNumber" class="form-control mb-md" readOnly="true"
											value="${workInfo.workNo}" /> <span id="workNumberErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Name of the Work<span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="workName" path="workName"
											class="form-control mb-md" readOnly="true"
											value="${workLineItems.workDetails}" /> <span
										id="workNameErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Technical Sanction No <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="techSanction_no"
											path="techSanction_no" placeholder="Transaction Number"
											maxlength="9" /> <span id="techSanction_noErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Date <span class="red">*</span>
										</p></li>
									<li><input type="text" id="sanctionDate"
										placeholder="DD/MM/YYYY" readonly="true"/> <span id="dateErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Amount<span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>

							</div>

							<%--  <c:if test="${techsanc.id==null}">
                <input type="submit" id="submit" name="next" class="next action-button" value="Save and Continue">
                </c:if>
                <c:if test="${techsanc.id!=null}">
                <input type="submit" id="submit" name="next" class="next action-button" value="update and Continue">
                </c:if> --%>
							<input type="submit" id="submit" name="next"
								class="next action-button" value="Save">
						 
						<form:input type="hidden" id="workid" path="work.id" />
						</form:form>
						</div>
						
					 

                  </div>
				</div>
			</div>
			<!-- /.MultiStep Form -->


		</div>
	</section>




	<!-- #contact --> </main>

	<!--=== Footer ====-->
	<jsp:include page="online-mis-footer.jsp" />

	<script type="text/javascript">
		/*   $(document).ready(function () {
		 $( "#date" ).datepicker({dateFormat: 'dd/mm/yy'})
		 });  
		 */

		$("#techSanction_no").on('input', function() {
			this.value = this.value.match(/^\d+/);
		});

		$("#amount").on('input', function() {
			this.value = this.value.match(/^\d+\.?\d{0,2}/);
		});

		$("#submit").click(
				function() {

					var natureOfWork = $("#natureOfWork").val();
					if (natureOfWork == "" || natureOfWork == null) {
						$("#workErr").html("Please Enter Nature of Work");
						return false;
					} else {
						$("#workErr").html("");
					}

					var workNumber = $("#workNumber").val();
					if (workNumber == "" || workNumber == null) {
						$("#workNumberErr").html("Please Enter Work Number");
						return false;
					} else {
						$("#workNumberErr").html("");
					}

					/* 	var workName=$("#workName").val();
					 if(workName=="" || workName==null){
					 $("#workNameErr").html("Please Enter Name of the Work");
					 return false;
					 }else{
					 $("#workNameErr").html("");
					 } */

					var techSanction_no = $("#techSanction_no").val();
					if (techSanction_no == "" || techSanction_no == null) {
						$("#techSanction_noErr").html(
								"Please Enter Technical Sanction No");
						$("#techSanction_no").focus();
						return false;
					} else {
						$("#techSanction_noErr").html("");
					}

					var date = $("#sanctionDate").datepicker( "getDate" );
					if (date == "" || date == null) {
						$("#dateErr").html("Please Enter Date");
						$("#date").focus();
						return false;
					} else {
						$("#dateErr").html("");
					}

					var amount = $("#amount").val();
					if (amount == "" || amount == null) {
						$("#amountErr").html("Please Enter Amount");
						$("#amount").focus();
						return false;
					} else {
						$("#amountErr").html("");
					}

				})
	</script>
</body>
</html>