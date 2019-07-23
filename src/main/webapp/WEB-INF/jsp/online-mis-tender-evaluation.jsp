<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Tender Evaluation</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<script type="text/javascript">
	$(document).ready(
			function() {
				$('#commencementDate').datepicker({
					altField : "#commencementDateMask",
					altFormat : "yy-mm-dd",
					dateFormat : 'dd-mm-yy'
				});

				$('#actualCompletion').datepicker({
					altField : "#actualCompletionMask",
					altFormat : "yy-mm-dd",
					dateFormat : 'dd-mm-yy'
				});

				$('#probableCompletion').datepicker({
					altField : "#probableCompletionMask",
					altFormat : "yy-mm-dd",
					dateFormat : 'dd-mm-yy'
				/*
				onSelect : function(selectedDate) {
					//$('#commencementDateMask').val(selectedDate); 
					console.log($('#probableCompletionMask').val());
				}*/
				});

				$('#commencementDate').datepicker(
						'setDate',
						new moment($('#commencementDateMask').val(),
								"YYYY-MM-DD").format("DD-MM-YYYY"));

				$('#actualCompletion').datepicker(
						'setDate',
						new moment($('#actualCompletionMask').val(),
								"YYYY-MM-DD").format("DD-MM-YYYY"));

				$('#probableCompletion').datepicker(
						'setDate',
						new moment($('#probableCompletionMask').val(),
								"YYYY-MM-DD").format("DD-MM-YYYY"));

			});
</script>
<body>

	<!--=== Header ====-->
	<jsp:include page="online-mis-header.jsp" />

	<main id="main"> <!--==========================
      Contact Us Section
    ============================-->

	<section id="contact" class="section-bg-con">
		<div class="container">

			<div class="row">
				<div class="col-md-12">

					<c:url value="/tenderEvaluation/save" var="createUrl" />
					<%-- <form id="msform" method="POST" action="${createUrl}"  modelAttribute="techsanc" > --%>
					<form:form id="msform" method="POST" action="${createUrl}"
						modelAttribute="tenderEvaluation">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />

						<form:input type="hidden" id="id" path="id" />
						<form:input type="hidden" id="probableCompletionMask"
							path="probableCompletion" />
						<form:input type="hidden" id="actualCompletionMask"
							path="actualCompletion" />
						<form:input type="hidden" id="commencementDateMask"
							path="commencementDate" />
						<c:choose>
							<c:when test="${!empty techsanc.id}">
								<form:input type="hidden" path="id" class="form-control" id="id"></form:input>
							</c:when>
						</c:choose>


						<!-- fieldsets -->
						<fieldset>
							<div class="fs-list-full">
								<h2 class="fs-title">Tender Evaluation</h2>

								<ul class="fs-list-details">
									<li><p>Nature of Work</p></li>
									<li><input type="text" id="natureOfWork"
										placeholder="Nature of Work" class="form-control mb-md"
										readOnly="true" value="${workInfo.natureOfWork.name}" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Work Number</p></li>
									<li><input type="text" id="workNumber"
										class="form-control mb-md" readOnly="true"
										value="${workInfo.workNo}" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Name of the Work</p></li>
									<li><input type="text" id="workName"
										class="form-control mb-md" readOnly="true"
										value="${workLineItems.workDetails}" /></li>
								</ul>


								<ul class="fs-list-details">
									<li><p>Estimate amount</p></li>
									<li><input type="number" id="estimationAmount"
										value="${workEstimation.cost}" class="form-control mb-md"
										readOnly="true" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Administrative sanctioned date</p></li>

									<fmt:formatDate pattern="dd-MM-yyyy" type="date"
										value="${empty administrativeSection.updatedAt ? administrativeSection.createdAt : administrativeSection.updatedAt}"
										var="theFormattedDate" />
									<li><input type="text" id="sanction_date"
										value="${theFormattedDate}" class="form-control mb-md"
										readOnly="true" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Technical sanctioned number</p></li>
									<li><input type="text" id="Technical_sanctioned_number"
										value="${technicalSanction.techSanction_no}"
										class="form-control mb-md" readOnly="true" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Technical sanctioned amount</p></li>
									<li><input type="number" id="Technical_sanctioned_amount"
										value="${technicalSanction.amount}" class="form-control mb-md"
										readOnly="true" /></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Technical sanctioned Date</p></li>
									<li><fmt:formatDate pattern="dd-MM-yyyy" type="date"
											value="${empty technicalSanction.updatedAt ? technicalSanction.createdAt : technicalSanction.updatedAt}"
											var="technicalSanctionedFormattedDate" />
									<li><input type="text" id="Technical_sanctioned_date"
										value="${technicalSanctionedFormattedDate}"
										class="form-control mb-md" readOnly="true" /></li>

								</ul>
								<ul class="fs-list-details">
									<li><p>
											Estimate Contract Value <span class="red">*</span>
										</p></li>
									<li><form:input type="number"
											id="estimate_contract_amount" path="estimateContractValue" />
										<span id="estimate_contract_amountErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Agreement Category <span class="red">*</span>
										</p></li>
									<li><form:select id="AgreementCategoryOptions"
											path="agreementCategory">
											<form:option value="">--Select--</form:option>
											<form:option value="1">LS</form:option>
										</form:select> <span id="AgreementCategoryOptionsErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Name of Contractor / Vendor <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="NameOfContractor"
											placeholder="Enter name of contractor/ vendor"
											path="nameOfContractor" /> <span id="NameOfContractorErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Agreement Number <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="Agreement_number"
											path="agreementNumber" placeholder="Enter agreement number" />
										<span id="Agreement_numberErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>Tender Premium</p></li>
									<li><form:input type="text" id="Tender_premium"
											style="width:280px;" path="tenderPremium" /><span
										style="width: 5px; display: inline-block; margin: auto 5px;"
										class="text-center">%</span> <form:select
											id="Tender_premium_type" path="tenderPremiumPay"
											style="width:150px;">
											<form:option value="">--Select--</form:option>
											<form:option value="Excess">Excess</form:option>
											<form:option value="Less">Less</form:option>
										</form:select><span id="amountErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>Original Or Supplemental</p></li>
									<li><form:select id="Original_Or_Supplemental "
											path="originalOrSupplemental">
											<form:option value="">--Select--</form:option>
											<form:option value="original">Original</form:option>
											<form:option value="supplemental">Supplemental</form:option>
										</form:select> <span id="amountErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Approximate value of work to be done under Supplemental
											Agreement <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="approximateValueOfWork"
											path="approximateValueOfWork" /> <span
										id="approximateValueOfWorkErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>If tenders have been called for is if not
											reasons recorded</p></li>
									<li><form:textarea id="reasonsRecorded"
											path="reasonsRecorded" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											No. of tenders received <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="noOfTendersReceived"
											path="noOfTendersReceived" /> <span
										id="noOfTendersReceivedErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Time allowed for this tender (in Months) <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="timeAllowedForThisTender"
											path="timeAllowedForThisTender" /> <span
										id="timeAllowedForThisTenderErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Is the contractor signed the copy of APDSS and its Agenda
											value brought up to date <span class="red">*</span>
										</p></li>
									<li><form:select id="contractorSigned"
											path="contractorSigned">
											<form:option value="">--Select--</form:option>
											<form:option value="yes">Yes</form:option>
											<form:option value="no">No</form:option>
										</form:select> <span id="contractorSignedErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Is the date furnished for all items of work noted in the
											Scheme? <span class="red">*</span>
										</p></li>
									<li><form:select id="dateFurnished" path="dateFurnished">
											<form:option value="">--Select--</form:option>
											<form:option value="yes">Yes</form:option>
											<form:option value="no">No</form:option>
										</form:select> <span id="dateFurnishedErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>Are the rates in the agreement within the
											estimate rates or schedule of rates whichever is less and are
											lump sum provision sufficient or likely to be executed</p></li>
									<li><form:textarea path="estimateRatesComments"></form:textarea>
									</li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Commencement Date <span class="red">*</span>
										</p></li>
									<li><input type="text" id="commencementDate"
										placeholder="dd-mm-yyyy" autocomplete="off" /> <span
										id="commencementDateErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Actual Completion Date as per Agreement <span class="red">*</span>
										</p></li>
									<li><input type="text" id="actualCompletion"
										placeholder="dd-mm-yyyy" autocomplete="off" /> <span
										id="actualCompletionErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>Probable Completion Date</p></li>
									<li><input type="text" id="probableCompletion"
										placeholder="dd-mm-yyyy" autocomplete="off" /></span></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Name of Contracting Agency by which Executed
											(Engineer/Zone/Division) <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="contractingAgency"
											path="contractingAgency"
											placeholder="Enter name of contracting agency" /> <span
										id="contractingAgencyErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>


								<!-- 		<ul class="fs-list-details">
									<li><p>
											Parliamentary Constituency <span class="red">*</span>
										</p></li>
									<li><input type="text" id="amount" 
											 /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Assembly Constituency <span class="red">*</span>
										</p></li>
									<li><input type="text" id="amount" 
											 /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul> -->

							</div>


							<input type="submit" id="submit" name="next"
								class="next action-button" value="Save">
						</fieldset>
						<form:input type="hidden" id="workid" path="work.id" />
					</form:form>


				</div>
			</div>
			<!-- /.MultiStep Form -->


		</div>
	</section>




	<!-- #contact --> </main>

	<!--=== Footer ====-->
	<jsp:include page="online-mis-footer.jsp" />

	<script type="text/javascript">
		$("#amount").on('input', function() {
			this.value = this.value.match(/^\d+\.?\d{0,2}/);
		});

		function isInvalidInput(input) {
			return (typeof input === "undefined" || input == null || input == "")
		}

		$("#submit")
				.click(
						function() {

							try {

								if (isInvalidInput($(
										"#estimate_contract_amount").val())) {

									$("#estimate_contract_amountErr")
											.html(
													"Please Enter estimate contract amount");
									$("#estimate_contract_amount").focus();
									return false;
								} else {

									if (parseInt($("#estimate_contract_amount")
											.val()) <= 0) {
										$("#estimate_contract_amount").focus();
										$("#estimate_contract_amountErr")
												.html(
														"Estimate contract amount should be positive integer");
										return false;
									} else {
										$("#estimate_contract_amountErr").html(
												"");
									}

								}

								if (isInvalidInput($(
										"#AgreementCategoryOptions").val())) {

									$("#AgreementCategoryOptionsErr")
											.html(
													"Please select Agreement Category Options");
									$("#AgreementCategoryOptions").focus();
									return false;
								} else {
									$("#AgreementCategoryOptionsErr").html("");
								}

								if (isInvalidInput($("#NameOfContractor").val())) {

									$("#NameOfContractorErr").html(
											"Please enter name of contractor");
									$("#NameOfContractor").focus();
									return false;
								} else {
									$("#NameOfContractorErr").html("");
								}

								if (isInvalidInput($("#Agreement_number").val())) {

									$("#Agreement_numberErr").html(
											"Please enter agreement number");
									$("#Agreement_number").focus();
									return false;
								} else {
									$("#Agreement_numberErr").html("");
								}

								if (isInvalidInput($("#approximateValueOfWork")
										.val())) {

									$("#approximateValueOfWorkErr")
											.html(
													"Please enter approximate value of work");
									$("#approximateValueOfWork").focus();
									return false;
								} else {
									if (parseInt($("#approximateValueOfWork")
											.val()) <= 0) {
										$("#approximateValueOfWorkErr")
												.html(
														"Approximate value of work should be positive integer");
										$("#approximateValueOfWork").focus();
										return false;
									} else {
										$("#approximateValueOfWorkErr")
												.html("");
									}

									$("#").html("");
								}

								if (isInvalidInput($("#noOfTendersReceived")
										.val())) {

									$("#noOfTendersReceivedErr")
											.html(
													"Please enter number Of tenders received");
									$("#noOfTendersReceived").focus();
									return false;
								} else {
									if (parseInt($("#noOfTendersReceived")
											.val()) <= 0) {
										$("#noOfTendersReceivedErr")
												.html(
														"number Of tenders received should be positive integer");
										$("#noOfTendersReceived").focus();
										return false;
									} else {
										$("#noOfTendersReceivedErr").html("");
									}

								}

								if (isInvalidInput($(
										"#timeAllowedForThisTender").val())) {

									$("#timeAllowedForThisTenderErr")
											.html(
													"Please enter time allowed for this tenders ");
									$("#timeAllowedForThisTender").focus();
									return false;
								} else {
									if (parseInt($("#timeAllowedForThisTender")
											.val()) <= 0) {
										$("#timeAllowedForThisTenderErr")
												.html(
														"Time allowed for this tenders should be positive integer");
										$("#timeAllowedForThisTender").focus();
										return false;
									} else {
										$("#timeAllowedForThisTenderErr").html(
												"");
									}

								}

								if (isInvalidInput($("#contractorSigned").val())) {
									$("#contractorSigned").focus();
									$("#contractorSignedErr").html(
											"Please select Yes or no");
									return false;
								} else {
									$("#contractorSignedErr").html("");
								}

								if (isInvalidInput($("#dateFurnished").val())) {
									$("#dateFurnished").focus();
									$("#dateFurnishedErr").html(
											"Please select Yes or no");
									return false;
								} else {
									$("#dateFurnishedErr").html("");
								}

								if (isInvalidInput($("#commencementDate").val())) {

									$("#commencementDateErr").html(
											"Please enter commencement date");
									$("#commencementDate").focus();
									return false;
								} else {
									$("#commencementDateErr").html("");
								}

								if (isInvalidInput($("#actualCompletion").val())) {

									$("#actualCompletionErr").html(
											"Please enter commencement date");
									$("#actualCompletion").focus();
									return false;
								} else {
									$("#actualCompletionErr").html("");
								}

								if (isInvalidInput($("#contractingAgency")
										.val())) {

									$("#contractingAgencyErr").html(
											"Please enter contract agency");
									$("#contractingAgency").focus();
									return false;
								} else {
									$("#contractingAgencyErr").html("");
								}

							} catch (exception) {
								console.error("exception " + exception);
								return false;

							}

						})
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/js/libraries/moment.js"
		type="text/javascript"></script>
</body>
</html>