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
<title>SAAP : Administrative Section</title>
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
              <h2 class="section-title">Administrative Section</h2>
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
    
   <jsp:include page="online-mis-tabView.jsp" />
    
   <div class="tab-content">
	
	 <div class="tab-pane fade show" id="nav-admin" role="tabpanel" aria-labelledby="nav-admin-tab">
     <div class="row">
    <div class="col-md-12">
    <c:url value="/administrativeSection/save" var="createUrl" />
        <form:form id="msform" method="POST" action="${createUrl}"  modelAttribute="adminSecObject" enctype="multipart/form-data">
           <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
         <c:choose>
			<c:when test="${!empty adminSecObject.id}">
				<form:input type="hidden" path="id" class="form-control" id="id" ></form:input>
			</c:when>
		</c:choose> 

            <!-- fieldsets -->  
            <fieldset>
             <div class="fs-list-full"> 
                <h2 class="fs-title">Administrative Section</h2>
                <ul class="fs-list-details">
                <li><p>Name of Work <span class="red">*</span></p></li>
                <li>
                <form:input type="text" id="workName" path="workName"  class="form-control mb-md" readonly="true" value="${workLineItems.workDetails}"/>
                <span id="workNameErr" class="errors" style="color:red;float:right;"></span> </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Work Number <span class="red">*</span></p></li>
                <li><form:input type="text" id="workNumber" path="workNumber"  class="form-control mb-md" readonly="true" value="${workInfo.workNo}"/>                
                <span id="workNumberErr" class="errors" style="color:red;float:right;"></span> 
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>AS Sanctioned Details <span class="red">*</span></p></li>
                <li><form:input type="text" path="sanctionedDetails" id="sanctionedDetails" placeholder="AS Sanctioned Details "/>
                	<br><span id="sanctionedDetailsErr" class="errors" style="color:red;float:right;"></span> </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Grant<span class="red">*</span></p></li>
                <li>
                <form:select id="typeOfGrant" path="typeOfGrant.id">
					<form:option value="" >--Select Grant --</form:option>
					<c:forEach  var="grant" items="${grantTypeList}">
					<form:option value="${grant.id}">${grant.name}</form:option>
					</c:forEach>
				</form:select>
                <br><span id="typeOfGrantErr" class="errors" style="color:red;float:right;"></span> 
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Financial Year <span class="red">*</span></p></li>
                <li>
                <form:select id="financialYear" path="financialYear.id">
					<form:option value="" selected="" disabled="">--Select Year --</form:option>
					<c:forEach  var="fyear" items="${finYearList}">
					<form:option value="${fyear.id}">${fyear.year}</form:option>
					</c:forEach>
				</form:select>
                	<br><span id="financialYearErr" class="errors" style="color:red;float:right;"></span> 
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Engagement of executive dept by <span class="red">*</span></p></li>
                <li>
                <form:select id="executiveDept" path="executiveDept.id">
					<form:option value="" selected="" disabled="">--Select Executive Dept --</form:option>
					<c:forEach  var="dpt" items="${executiveDeptList}">
					<form:option value="${dpt.id}">${dpt.name}</form:option>
					</c:forEach>
				</form:select>
                <br><span id="executiveDeptErr" class="errors" style="color:red;float:right;"></span> 
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Engagement of consultant by <span class="red">*</span></p></li>
                <li>
                <form:select id="consultant" path="consultant.id">
					<form:option value="" selected="" disabled="">--Select Executive Consultant --</form:option>
					<c:forEach  var="cons" items="${executiveConsultantList}">
					<form:option value="${cons.id}">${cons.name}</form:option>
					</c:forEach>
				</form:select>
                <br><span id="consultantErr" class="errors" style="color:red;float:right;"></span>
                </li>
                </ul>
                
                 
                 <ul class="fs-list-details">
                <li><p>Upload Adminstrative Details Document(pdf/jpg/png)<span class="red">*</span></p>
                <input type="file" name="file" id="file" value="${filePath}" onchange="document.getElementById('image').src = window.URL.createObjectURL(this.files[0])"></li>
                <li> <img id="image" src="${filePath}"   width="100" height="70"/> </li>
                <form:input type="hidden" path="path" class="form-control" id="fileName" value="${adminSecObject.path}"></form:input>
                 <span id="file_error" class="errors" style="color:red;float:right;"></span>
                </ul>
                
               </div>
               <c:if test="${adminSecObject.id==null}">
                <input type="submit" id="submit" name="next" class="next action-button" value="Save and Continue"/>
               </c:if>
                <c:if test="${adminSecObject.id!=null}">
                <input type="submit" id="submit" name="next" class="next action-button" value="Update and Continue"/>
               </c:if>
            </fieldset>
            <form:input type="hidden" id="workid" path="work.id" value="${workInfo.id}"/>
        </form:form>
        
    </div>
</div>
</div>
</div>

<!-- /.MultiStep Form -->
    

    </div>
  </section>

 
  
    
  <!-- #contact --> 
  
</main>

<!--=== Footer ====-->
<jsp:include page="online-mis-footer.jsp" />

<script type="text/javascript">
$(document).ready(function(){
$("input[type='file']").on("change", function () {
		  $("#file_error").html("");
	     if(this.files[0].size > 2000000) {
	    	 $("#file_error").html("File size is greater than 2MB");
	        alert("Please upload file less than 2MB. Thanks!!"); 
	       $(this).val('');
	     }
	    }); 
	
});

$('input').on('input', function() {
	  $(this).val($(this).val().replace(/[^a-z0-9 ]/gi, ''));
	});

$("#submit").click(function(){
	
/*     var workName=$("#workName").val();
    if(workName=="" || workName==null){
        $("#workNameErr").html("Please Enter Name of Work ");
        $("#workName").focus();
        return false;
    }else{
        $("#workNameErr").html("");
    }
    
    var workNumber=$("#workNumber").val();
    if(workNumber=="" || workNumber==null){
        $("#workNumberErr").html("Please Enter Work Number ");
        $("#workNumber").focus();
        return false;
    }else{
        $("#workNumberErr").html("");
    } */
    
    var sanctionedDetails=$("#sanctionedDetails").val();
    if(sanctionedDetails=="" || sanctionedDetails==null){
        $("#sanctionedDetailsErr").html("Please Enter Sanctioned Details ");
        $("#sanctionedDetails").focus();
        return false;
    }else{
        $("#sanctionedDetailsErr").html("");
    }
    
	if( $("#typeOfGrant option:selected").val()==""){
		  $("#typeOfGrantErr").text("Please Select Grant");
		  $("#typeOfGrant").focus();
		  return false;
	}else{
		$("#typeOfGrantErr").text("");
	}
	
	if( $("#financialYear option:selected").val()==""){
		  $("#financialYearErr").text("Please Select Financial Year");
		  $("#financialYear").focus();
		  return false;
	}else{
		$("#financialYearErr").text("");
	}
	
	if( $("#executiveDept option:selected").val()==""){
		  $("#executiveDeptErr").text("Please Select Engagement of executive");
		  $("#executiveDept").focus();
		  return false;
	}else{
		$("#executiveDeptErr").text("");
	}
	
	if( $("#consultant option:selected").val()==""){
		  $("#consultantErr").text("Please Select Engagement of consultant");
		  $("#consultant").focus();
		  return false;
	}else{
		$("#consultantErr").text("");
	}
	
	
    var fileName=$('#fileName').val();
	if(fileName==""){
		fileName=$('#file').val();
	}
	if(fileName=="" || fileName==null){
        $("#file_error").html("Please Upload a file ");
        $("#file").focus();
        return false;
    }else{
    	 $("#file_error").html("");
    	return true;
    }
	
});

$(document).ready(function(){
	$('#nav-admin-tab').addClass('active');
	 $('#nav-admin').addClass('active');
	});
	
</script>
</body>
</html>
