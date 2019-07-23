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
<title>SAAP : Technical Evaluation</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />

</head>

<script type="text/javascript">
	$(document).ready(function() {
		$('#date').datepicker({
			dateFormat : 'yy-mm-dd'
		});
		var dateValue = $('#dateid').val();
		$('#date').datepicker('setDate', dateValue);
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

					<c:url value="/technicalSanction/save" var="createUrl" />
					<%-- <form id="msform" method="POST" action="${createUrl}"  modelAttribute="techsanc" > --%>
					<form:form id="msform" method="POST" action="${createUrl}"
						modelAttribute="techsanc">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />

						<c:choose>
							<c:when test="${!empty techsanc.id}">
								<form:input type="hidden" path="id" class="form-control" id="id"></form:input>								
							</c:when>
						</c:choose>


						<!-- fieldsets -->
						<fieldset>
							<div class="fs-list-full">
								<h2 class="fs-title">Technical Evaluation</h2>

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
											Estimate amount <span class="red">*</span>
										</p></li>
									<li><form:input type="number" path="docDate" id="date" /> <span
										id="dateErr" class="errors" style="color: red; float: right;"></span>
									</li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Administrative sanctioned date<span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>
							
								<ul class="fs-list-details">
									<li><p>
											Technical sanctioned number<span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Technical sanctioned amount<span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Technical sanctioned Date<span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Estimate Contract Value <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Agreement Category <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Name of Contractor / Vendor <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Agreement Number <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Tender Premium <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Original Or Supplemental <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Approximate value of work to be done under Supplemental
											Agreement <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											If tenders have been called for is if not reasons recorded <span
												class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											No. of tenders received <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Time allowed for this tender <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Is the contractor signed the copy of APDSS and its Agenda
											value brought up to date <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Is the date furnished for all items of work noted in the
											Scheme? <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Are the rates in the agreement within the estimate rates or
											schedule of rates whichever is less and are lump sum
											provision sufficient or likely to be executed <span
												class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Commencement Date <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Actual Completion Date as per Agreement <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Probable Completion Date <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Name of Contracting Agency by which Executed
											(Engineer/Zone/Division) <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>


								<ul class="fs-list-details">
									<li><p>
											Parliamentary Constituency <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>
								<ul class="fs-list-details">
									<li><p>
											Assembly Constituency <span class="red">*</span>
										</p></li>
									<li><form:input type="text" id="amount" path="amount"
											placeholder="Amount" maxlength="9" /> <span id="amountErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>

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

					var date = $("#date").val();
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