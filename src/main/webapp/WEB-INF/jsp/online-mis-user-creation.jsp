<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : User Creation</title>
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
              <h2 class="section-title">User Creation</h2>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</section> -->
<!-- #intro -->

<main id="main"> 
  
  <!--==========================
      Contact Us Section
    ============================-->
  
  <section id="contact" class="section-bg-con wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
    <div class="container">
      <div class="row">
        <div class="col-md-6 offset-3" id="msform">
        <c:url value="/userCreation/save" var="createUrl" />
          <form role="form" method="post" action="${createUrl}" modelAttribute="userObj">
<%--           <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 --%>            <fieldset>
              <h2 class="fs-title">Register</h2>
              <div class="form-group">
                <input type="text" name="name" id="name" class="form-control input-lg" placeholder="Name">
                <span id="nameErr" class="errors" style="color:red;float:right;"></span>
              </div>             
              <div class="form-group">
                <input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password">
                <span id="passwordErr" class="errors" style="color:red;float:right;"></span>
              </div>
  			  <div class="form-group">
	              <select  id = "userRole" name="userRole" class="form-control"   placeholder="Role">
					<option value="" selected="" disabled="">--select Role--</option>
					<c:forEach  var="roleList" items="${roleList}">
					<option value="${roleList.id}">${roleList.roleName}</option>
					</c:forEach>
				</select>	
				<span id="userRoleErr" class="errors" style="color:red;float:right;"></span>              
              </div> 
              <div class="form-group">
                <input type="email" name="email" id="email" class="form-control input-lg" placeholder="Email">
                <span id="emailErr" class="errors" style="color:red;float:right;"></span>
              </div>
              <div class="form-group">
                <input type="text" name="mobile" id="mobile" class="form-control input-lg" maxlength="10" placeholder="Number">
                <span id="mobileErr" class="errors" style="color:red;float:right;"></span>
              </div>
              <div class="form-group">
                <textarea rows="4" name="address" id="address" class="form-control input-lg" placeholder="Enter address here" cols="50"></textarea>
              	<span id="addressErr" class="errors" style="color:red;float:right;"></span>
              </div>
              <div>
                <input type="submit" id="submit" name="submit" class="next action-button"   value="Register">
              </div>
            
            <c:if test="${not empty usernameErr}">
  			<span style="color:red;">User Name Existed</span>
			</c:if>
			</fieldset>
          </form>

        </div>
      </div>
    </div>
  </section>
  
  <!-- #contact --> 
  
</main>

<!--=== Footer ====-->
<jsp:include page="online-mis-footer.jsp" />
<script type="text/javascript">
$('#name,#address').on('input', function() {
	  $(this).val($(this).val().replace(/[^a-z0-9 ]/gi, ''));
});
$("#mobile").on('input', function () {
    this.value = this.value.match(/^\d+/);
});
function isEmail(email) {
	 var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	 return regex.test(email);	
}
$("#submit").click(function(){
	var name=$("#name").val();
    if(name=="" || name==null){
        $("#nameErr").html("Please Enter Name");
        $("#name").focus();
        return false;
    }else{
        $("#nameErr").html("");
    }
    
	var password=$("#password").val();
    if(password=="" || password==null){
        $("#passwordErr").html("Please Enter Password");
        $("#password").focus();
        return false;
    }else{
        $("#passwordErr").html("");
    }
    
	if( $("#userRole option:selected").val()==""){
		  $("#userRoleErr").text("Select Role");
		  $("#userRole").focus();
		  return false;
	}else{
		$("#userRoleErr").text("");
	}
    
	var email=$("#email").val();
    if(email=="" || email==null){
        $("#emailErr").html("Please Enter Email Id");
        $("#email").focus();
        return false;
    }else{
        $("#emailErr").html("");
    }
    
    if( !isEmail(email)) { 
      	 $("#emailErr").html("Please Enter Valid Email Id");
      	 $("#email").focus();
          return false;
      } else{
          $("#emailErr").html("");
      } 
    
	var mobile=$("#mobile").val();
    if(mobile =="" || mobile == null){
        $("#mobileErr").html("Please Enter Mobile Number");
        $("#mobile").focus();
        return false;
    }else{
        $("#mobileErr").html("");
    }
    
	var address=$("#address").val();
    if($('#address').val().trim().length < 1){
        $("#addressErr").html("Please Enter Address");
        $("#address").focus();
        return false;
    }else{
        $("#addressErr").html("");
    }
});

</script>

</body>
</html>
