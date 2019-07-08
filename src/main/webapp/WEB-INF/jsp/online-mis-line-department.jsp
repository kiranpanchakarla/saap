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
<title>SAAP : Line Department</title>
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
              <h2 class="section-title">Linking with Line Department</h2>
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
  
  <section id="contact" class="section-bg-con">
    <div class="container">
    <c:if test="${lineDeptObj.id != null}">
     <jsp:include page="online-mis-tabView.jsp" />
     </c:if>
      <div class="tab-content">
	 <div class="tab-pane fade show" id="nav-department" role="tabpanel" aria-labelledby="nav-department-tab">
    <div class="row">
    <div class="col-md-12">
        <c:url value="/lineDepartment/save" var="createUrl" />
       <form:form id="msform" method="POST" action="${createUrl}" modelAttribute="lineDeptObj">
       <input type="hidden" name="${_csrf.parameterName}"
           value="${_csrf.token}" />
          
          <c:choose>
			<c:when test="${!empty lineDeptObj.id}">
				<form:input type="hidden" path="id" class="form-control" id="id" ></form:input>
			</c:when>
		</c:choose> 
            <!-- fieldsets -->
            <fieldset>
            <div class="fs-list-full"> 
                <h2 class="fs-title">Linking with Line Department</h2>
                
                <ul class="fs-list-details">
                <li><p>Name of Department <span class="red">*</span></p></li>
                <li><form:input type="text" id="departmentName" path="departmentName" placeholder="Name of Department"/>
                <br><span id="departmentNameErr" class="errors" style="color:red;float:right;"></span>
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Nature of work <span class="red">*</span></p></li>
                <li><form:input type="text" id="workNature" path="workNature"  class="form-control mb-md" readonly="true" value="${workInfo.natureOfWork.name}" />
                <span id="workNatureErr" class="errors" style="color:red;float:right;"></span>
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Circle <span class="red">*</span></p></li>
                <li><form:input type="text" id="circle"  path="circle" placeholder="Circle"/>
                <br><span id="circleErr" class="errors" style="color:red;float:right;"></span>
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Name of the Division <span class="red">*</span></p></li>
                <li>
      			<form:select id="divisionName" path="divisionName.id">
					<form:option value="" selected="" disabled="">--Select division --</form:option>
					<c:forEach  var="divi" items="${divisionList}">
					<form:option value="${divi.id}">${divi.name}</form:option>
					</c:forEach>
				</form:select>	
      			<br><span id="divisionNameErr" class="errors" style="color:red;float:right;"></span>
      			</li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Name of the SubDivision <span class="red">*</span></p></li>
                <li>
	            <form:select id="subdivisionName" path="subdivisionName.id">
					<form:option value="" selected="" disabled="">--Select subdivision --</form:option>
					<c:forEach  var="subdiv" items="${subdivisionList}">
					<form:option value="${subdiv.id}">${subdiv.name}</form:option>
					</c:forEach>
				</form:select>
                <span id="subdivisionNameErr" class="errors" style="color:red;float:right;"></span> 
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Name of the Section <span class="red">*</span></p></li>
                <li>	                
	           <form:select id="sectionName" path="sectionName.id">
					<form:option value="" selected="" disabled="">--Select section --</form:option>
					<c:forEach  var="sect" items="${sectionList}">
					<form:option value="${sect.id}">${sect.name}</form:option>
					</c:forEach>
				</form:select>
				<span id="sectionNameErr" class="errors" style="color:red;float:right;"></span>
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Name of the Section officer <span class="red">*</span></p></li>
                <li>
                <form:input type="text" id="sectionOfficerName" path="sectionOfficerName" placeholder="Name of the Section officer"/>
                <span id="sectionOfficerNameErr" class="errors" style="color:red;float:right;"></span> 
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Mobile No <span class="red">*</span></p></li>
                <li>
                <form:input type="text" id="mobileNo" path="mobileNo" maxlength="10" class="numberId form-control mb-md" />
                <span id="mobileNoErr" class="errors" style="color:red;float:right;"></span>
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Email Id <span class="red">*</span></p></li>
                <li>
                <form:input type="text" id="email" path="email" class="form-control mb-md" />
                <br><span id="emailErr" class="errors" style="color:red;float:right;"></span>
                </li>
                </ul>
                
                </div>
                
                  <c:if test="${lineDeptObj.id==null}">
                <input type="submit" id="submit" name="next" class="next action-button" value="Save and Continue">
                </c:if>
                <c:if test="${lineDeptObj.id!=null}">
                <input type="submit" id="submit" name="next" class="next action-button" value="Update and Continue">
                </c:if>
                
            </fieldset>
            <form:input type="hidden" id="workid" path="work.id" value="${workInfo.id}"/>
        </form:form>
    </div>
</div>
    </div>
    </div>
    </div>
    
  </section>

  <!-- #contact -->   
</main>

<!--=== Footer ====-->
<jsp:include page="online-mis-footer.jsp" />


<script type="text/javascript">

$("#departmentName,#circle,#sectionOfficerName").on('input', function() {
	  $(this).val($(this).val().replace(/[^a-z ]/gi, ''));
})
$("#mobileNo").on('input', function () {
    this.value = this.value.match(/^\d+/);
});
	
 function isEmail(email) {
	  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	  return regex.test(email);
	}

$("#submit").click(function(){
	
	var departmentName=$("#departmentName").val();
    if(departmentName=="" || departmentName==null){
        $("#departmentNameErr").html("Please Enter Name of Department ");
        $("#departmentName").focus();
        return false;
    }else{
        $("#departmentNameErr").html("");
    }
    
    var workNature=$("#workNature").val();
    if(workNature=="" || workNature==null){
        $("#workNatureErr").html("Please Enter Nature of work");
        $("#workNature").focus();
        return false;
    }else{
        $("#workNatureErr").html("");
    }
    
    var circle=$("#circle").val();
    if(circle=="" || circle==null){
        $("#circleErr").html("Please Enter Circle ");
        $("#circle").focus();
        return false;
    }else{
        $("#circleErr").html("");
    }
    
	if( $("#divisionName option:selected").val()==""){
		  $("#divisionNameErr").text("Please Select Division");
		  $("#divisionName").focus();
		  return false;
	}else{
		$("#divisionNameErr").text("");
	}
    
	if( $("#subdivisionName option:selected").val()==""){
		  $("#subdivisionNameErr").text("Please Select SubDivision ");
		  $("#subdivisionName").focus();
		  return false;
	}else{
		$("#subdivisionNameErr").text("");
	}
	
	if( $("#sectionName option:selected").val()==""){
		  $("#sectionNameErr").text("Please Select Section ");
		  $("#sectionName").focus();
		  return false;
	}else{
		$("#sectionNameErr").text("");
	}
	
    var sectionOfficerName=$("#sectionOfficerName").val();
    if(sectionOfficerName=="" || sectionOfficerName==null){
        $("#sectionOfficerNameErr").html("Please Enter Name of the Section officer ");
        $("#sectionOfficerName").focus();
        return false;
    }else{
        $("#sectionOfficerNameErr").html("");
    }
    
    var mobileNo=$("#mobileNo").val();
    if(mobileNo=="" || mobileNo==null){
        $("#mobileNoErr").html("Please Enter MobileNo");
        $("#mobileNo").focus();
        return false;
    }else{
        $("#mobileNoErr").html("");
    }
    
    var email=$("#email").val();
    if(email=="" || email==null){
        $("#emailErr").html("Please Enter Email");
        $("#email").focus();
        return false;
    }else{
        $("#emailErr").html("");
    }    
     if( !isEmail(email)) { 
    	 $("#emailErr").html("Please Enter Valid Email");
    	 $("#email").focus();
        return false;
    } else{
        $("#emailErr").html("");
    } 
    
}) 

$(document).ready(function(){
	$('#nav-department-tab').addClass('active');
	 $('#nav-department').addClass('active');
	});
</script>
</body>
</html>
