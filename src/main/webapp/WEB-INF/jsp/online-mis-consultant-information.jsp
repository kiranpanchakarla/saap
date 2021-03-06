<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Consultant Information</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />

</head>

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
              <h2 class="section-title">Consultant Information</h2>
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
    ============================--> <section id="contact"
		class="section-bg-con">
	<div class="container">
		<c:import url="/WEB-INF/jsp/online-mis-consultantTabView.jsp" />

		<div class="tab-content">

			<div class="tab-pane fade show" id="nav-admin" role="tabpanel"
				aria-labelledby="nav-admin-tab">
				<div class="row">
					<div class="col-md-12">
						<c:url value="/ConsultantInfo/save" var="createUrl" />
						<%--   <form id="msform" method="post" action="${createUrl}" modelAttribute="consultantInfoObject"> --%>
						<form:form id="msform" method="POST" action="${createUrl}"
							modelAttribute="consultantInfoObject">
							<c:choose>
								<c:when test="${!empty consultantInfoObject.id}">
									<form:input type="hidden" path="id" class="form-control"
										id="id"></form:input>
								</c:when>
							</c:choose>

							<!-- fieldsets -->
							<fieldset>
								<h2 class="fs-title">Consultant Information</h2>
								<!--<h3 class="fs-subtitle">Tell us something about you</h3>-->

								<ul class="fs-list-details">
									<li><p>
											Name of Consultant Firm<span class="red">*</span>
										</p></li>
									<li><form:input type="text" title="consultant-firm"
											id="consultant_firm" path="consultant_firm"
											class="form-control mb-md alpha-and-spaces"
											placeholder="Name of Consultant Firm" maxlength="30" /> <span
										id="consultant_firmErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											PAN Number <span class="red">*</span>
										</p></li>
									<li><form:input type="text" title="pan-number"
											id="pan_number" path="pan_number" maxlength='10'
											class="form-control mb-md" placeholder="PAN Number" /> <span
										id="pan_numberErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											TIN Number <span class="red">*</span>
										</p></li>
									<li><form:input type="text" title="tin-number"
											id="tin_number" maxlength='10' path="tin_number"
											class="form-control mb-md" placeholder="TIN Number" /> <span
										id="tin_numberErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Mobile Number<span class="red">*</span>
										</p></li>
									<li><form:input type="text" title="mobile-number"
											id="mobile_no" path="mobile_no" maxlength="10"
											class="form-control mb-md" placeholder="Mobile Number" /> <span
										id="mobile_noErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Landline Number <span class="red">*</span>
										</p></li>
									<li><form:input type="text" title="landline-number"
											id="landline_no" path="landline_no" maxlength="10"
											class="form-control mb-md" placeholder="landline Number" />
										<span id="landline_noErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Email Id<span class="red">*</span>
										</p></li>
									<li><form:input type="text" title="email-id" id="emailId"
											path="emailId" class="form-control mb-md emailValidation"
											placeholder="Email Number" /> <span id="emailIdErr"
										class="errors" style="color: red; float: right;"></span></li>
								</ul>

								<ul class="fs-list-details">
									<li><p>
											Address<span class="red">*</span>
										</p></li>
									<li><form:textarea title="address" id="address"
											path="address"
											class="form-control mb-md alphanumeric-and-spaces"
											placeholder="Address" maxlength="255" /> <span
										id="addressErr" class="errors"
										style="color: red; float: right;"></span></li>
								</ul>

							</fieldset>

							<fieldset>
								<div class="fs-list-full">
									<h2 class="fs-title">Bank Details of Firm</h2>

									<ul class="fs-list-details">
										<li><p>
												Bank <span class="red">*</span>
											</p></li>
										<li><form:input type="text" title="bank" id="bank"
												path="bank_name" class="form-control mb-md alpha-and-spaces"
												placeholder="Bank" /> <span id="bankErr" class="errors"
											style="color: red; float: right;"></span></li>
									</ul>

									<ul class="fs-list-details">
										<li><p>
												Branch <span class="red">*</span>
											</p></li>
										<li><form:input type="text" title="branch" id="branch"
												path="branch" class="form-control mb-md alpha-and-spaces"
												placeholder="Branch" /> <span id="branchErr" class="errors"
											style="color: red; float: right;"></span></li>
									</ul>

									<ul class="fs-list-details">
										<li><p>
												Account Type<span class="red">*</span>
											</p></li>
										<li><form:input type="text" title="account-type"
												id="account_type" path="account_type"
												class="form-control mb-md alpha-and-spaces"
												placeholder="Account Type" /> <span id="account_typeErr"
											class="errors" style="color: red; float: right;"></span></li>
									</ul>

									<ul class="fs-list-details">
										<li><p>
												A/c Number<span class="red">*</span>
											</p></li>
										<li><form:input type="text" title="account-number"
												id="account_number" path="account_number"
												class="form-control mb-md" maxlength='18'
												placeholder="Account Number" /> <span id="account_numberErr"
											class="errors" style="color: red; float: right;"></span></li>
									</ul>

									<ul class="fs-list-details">
										<li><p>
												IFSC Code<span class="red">*</span>
											</p></li>
										<li><form:input type="text" title="ifsc-code"
												id="ifsc_code" path="ifsc_code" class="form-control mb-md"
												pattern="[a-zA-Z]{4}[0-9]{7}" placeholder="IFSC Code" /> <span
											id="ifsc_codeErr" class="errors"
											style="color: red; float: right;"></span></li>
									</ul>

								</div>
								<!-- <input type="submit" id="submit" name="next" class="next action-button" value="Save and Continue"> -->
								<c:if test="${consultantInfoObject.id==null}">
									<input type="submit" id="submit" name="next"
										class="next action-button" value="Save and Continue">
								</c:if>
								<c:if test="${consultantInfoObject.id!=null}">
									<input type="submit" id="submit" name="next"
										class="next action-button" value="update and Continue">
								</c:if>


							</fieldset>
							<input type="hidden" id="work.id" name="work.id"
								value="${workIdSession}">
							<%-- </form> --%>
						</form:form>


					</div>
				</div>
			</div>
		</div>

		<!-- /.MultiStep Form -->


	</div>
	</section> <!-- #contact --> </main>
	<!--=== Footer ====-->
	<jsp:include page="online-mis-footer.jsp" />
	<!-- Contact Form JavaScript File -->
	<script src="contactform/contactform.js"></script>

	<script type="text/javascript">
	    var onChange = false;
	
	    <c:if test="${consultantInfoObject.id == null}">
	    var form = document.querySelector('#msform');
	    form.addEventListener('change', function() {
	    	onChange = true;
	    });
	    </c:if>
	    
		$(document).ready(function() {
			$('#nav-consultant-tab').addClass('active');
			$('#nav-consultant').addClass('active');
			
		});

		$("#mobile_no,#landline_no,#account_number").on('input', function() {
			this.value = this.value.match(/^\d+/);
		});
		$("#ifsc_code,#pan_number,#tin_number").on('input', function() {
			$(this).val($(this).val().replace(/[^a-z0-9]/gi, ''));
		})

		/*  $("#consultant_firm,#bank,#branch,#account_type").on('input', function() {
		 $(this).val($(this).val().replace(/[^a-z ]/gi, ''));
		 })
		 function isEmail(email) {
		 var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		 return regex.test(email);	
		 } */
		$("#submit")
				.click(
						function() {

							var consultant_firm = $("#consultant_firm").val();
							if (consultant_firm == ""
									|| consultant_firm == null) {
								$("#consultant_firmErr")
										.html(
												"Please Enter Name of Consultant Firm ");
								$("#consultant_firm").focus();
								return false;
							} else {
								$("#consultant_firmErr").html("");
							}

							var pan_number = $("#pan_number").val();
							if (pan_number == "" || pan_number == null) {
								$("#pan_numberErr").html(
										"Please Enter PAN Number");
								$("#pan_number").focus();
								return false;
							} else {
								$("#pan_numberErr").html("");
							}

							var tin_number = $("#tin_number").val();
							if (tin_number == "" || tin_number == null) {
								$("#tin_numberErr").html(
										"Please Enter TIN Number");
								$("#tin_number").focus();
								return false;
							} else {
								$("#tin_numberErr").html("");
							}

							var mobile_no = $("#mobile_no").val();
							if (mobile_no == "" || mobile_no == null) {
								$("#mobile_noErr").html(
										"Please Enter Mobile Number");
								$("#mobile_no").focus();
								return false;
							} else {
								$("#mobile_noErr").html("");
							}

							var landline_no = $("#landline_no").val();
							if (landline_no == "" || landline_no == null) {
								$("#landline_noErr").html(
										"Please Enter Landline Number");
								$("#landline_no").focus();
								return false;
							} else {
								$("#landline_noErr").html("");
							}

							var emailId = $("#emailId").val();
							if (emailId == "" || emailId == null) {
								$("#emailIdErr").html("Please Enter Email Id");
								$("#emailId").focus();
								return false;
							} else {
								$("#emailIdErr").html("");
							}

							if (!isEmail(emailId)) {
								$("#emailIdErr").html(
										"Please Enter Valid Email Id");
								$("#emailId").focus();
								return false;
							} else {
								$("#emailIdErr").html("");
							}

							var address = $("#address").val();
							if ($('#address').val().trim().length < 1) {
								$("#addressErr").html("Please Enter Address");
								$("#address").focus();
								return false;
							} else {
								$("#addressErr").html("");
							}

							var bank = $("#bank").val();
							if (bank == "" || bank == null) {
								$("#bankErr").html("Please Enter Bank ");
								$("#bank").focus();
								return false;
							} else {
								$("#bankErr").html("");
							}

							var branch = $("#branch").val();
							if (branch == "" || branch == null) {
								$("#branchErr").html("Please Enter Branch");
								$("#branch").focus();
								return false;
							} else {
								$("#branchErr").html("");
							}

							var account_type = $("#account_type").val();
							if (account_type == "" || account_type == null) {
								$("#account_typeErr").html(
										"Please Enter Account Type");
								$("#account_type").focus();
								return false;
							} else {
								$("#account_typeErr").html("");
							}

							var account_number = $("#account_number").val();
							if (account_number == "" || account_number == null) {
								$("#account_numberErr").html(
										"Please Enter Account Number");
								$("#account_number").focus();
								return false;
							} else {
								$("#account_numberErr").html("");
							}

							var ifsc_code = $("#ifsc_code").val();
							if (ifsc_code == "" || ifsc_code == null) {
								$("#ifsc_codeErr").html(
										"Please Enter IFSC Code");
								$("#ifsc_code").focus();
								return false;
							} else {
								$("#ifsc_codeErr").html("");
							}
							
							
						})
	</script>
</body>
</html>