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
<title>SAAP : Land details</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />

</head>

<body>

<!--=== Header ====-->
<jsp:include page="online-mis-header.jsp" />

<!--==========================
    Intro Section
  ============================-->
<section id="intro-inner">
  <div class="page-header">
    <section id="page-title" class="parralax">
      <div class="container rel">
        <div class="row">
          <div class="col-md-12">
            <div class="text-center">
              <h2 class="section-title">Land details</h2>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</section>
<!-- #intro -->

<main id="main"> 
  
   <!--==========================
      Contact Us Section
    ============================-->
  
  <section id="contact" class="section-bg-con">
    <div class="container">
    <jsp:include page="online-mis-tabView.jsp" />
      <div class="tab-content">
	 <div class="tab-pane fade show" id="nav-land" role="tabpanel" aria-labelledby="nav-land-tab">
    <div class="row">
    <div class="col-md-12">
       <c:url value="/landDetails/save" var="createUrl" />
       <form:form id="msform" method="POST" action="${createUrl}" modelAttribute="landDetails" enctype="multipart/form-data">
            <input type="hidden" name="${_csrf.parameterName}"
           value="${_csrf.token}" />
            
            <!-- fieldsets -->
            <fieldset>
            <div class="fs-list-full"> 
                <h2 class="fs-title">Land details</h2>
                
                <ul class="fs-list-details">
                <li><p>Nature of Work <span class="red">*</span></p></li>
                <li><form:input type="text" id="natureofwork" path="natureofwork"  class="form-control mb-md" readonly="true" value="${workInfo.natureOfWork.name}"/>
                <span id="natureofworkErr" class="errors" style="color:red;float:right;"></span>
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Work Number <span class="red">*</span></p></li>
                <li><form:input type="text" id="worknum" path="worknum" title="1" class="form-control mb-md" readonly="true" value="${workInfo.workNo}" />
                <span id="worknumErr" class="errors" style="color:red;float:right;"></span>
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Name of the Work <span class="red">*</span></p></li>
                <li><form:input type="text" id="nameofwork" path="nameofwork" title="Land work" class="form-control mb-md" readonly="true" value="${workInfo.workDetails}" />
                <span id="nameofworkErr" class="errors" style="color:red;float:right;"></span>
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Land Extend <span class="red">*</span></p></li>
                <li><form:input type="text" id="landExtend" path="landExtend" placeholder="Land Extend" class="form-control mb-md" />
                <span id="landExtendErr" class="errors" style="color:red;float:right;"></span>
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Survey Number <span class="red">*</span></p></li>
                <li><form:input type="text" id="surveyNo" path="surveyNo" placeholder="Survey Number" class="form-control mb-md"/>
                <span id="surveyNoErr" class="errors" style="color:red;float:right;"></span>
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Field Mesurment Book Details <span class="red">*</span></p></li>
                <li><form:input type="text" id="bookDetails" path="bookDetails" placeholder="Mesurment Book Details" class="form-control mb-md" />
                <span id="bookDetailsErr" class="errors" style="color:red;float:right;"></span>
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Type Of Land  <span class="red">*</span></p></li>
                <li>                           		            		
            	<form:select id="typeOfLand" path="typeOfLand.id">
					<form:option value="" selected="" disabled="">--Select Land Type --</form:option>
					<c:forEach  var="land" items="${LandTypeList}">
					<form:option value="${land.id}">${land.name}</form:option>
					</c:forEach>
				</form:select>
				<br><span id="typeOfLandErr" class="errors" style="color:red;float:right;"></span>
            	</li>
                </ul>
                
               <ul class="fs-list-details">
                <li><p>Upload Land Details Document(pdf/jpg/png) <span class="red">*</span></p></li>
                <li><input type="file" name="file" id="file" class="form-control mb-md"></li>
                <span id="file_error" class="errors" style="color:red;float:right;"></span>
                 
                </ul>
                
                </div>
                <input type="submit" id="submit" name="next" class="next action-button" value="Save and Continue">
                
            </fieldset>
            <form:input type="hidden" id="workid" path="work.id" value="${workInfo.id}" />
       </form:form>
        
        
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
		      /*  alert("Please upload file less than 2MB. Thanks!!"); */
		       $(this).val('');
		     }
		    });
	});

$("#landExtend,#bookDetails,#surveyNo").on('input', function() {
	  $(this).val($(this).val().replace(/[^a-z0-9 ]/gi, ''));
	})
$("#submit").click(function(){
	
	var natureofwork=$("#natureofwork").val();
    if(natureofwork=="" || natureofwork==null){
        $("#natureofworkErr").html("Please Enter Nature of Work ");
        $("#natureofwork").focus();
        return false;
    }else{
        $("#natureofworkErr").html("");
    }
    
	var worknum=$("#worknum").val();
    if(worknum=="" || worknum==null){
        $("#worknumErr").html("Please Enter Work Number");
        $("#worknum").focus();
        return false;
    }else{
        $("#worknumErr").html("");
    }
    
/*    var nameofwork=$("#nameofwork").val();
    if(nameofwork=="" || nameofwork==null){
        $("#nameofworkErr").html("Please Enter Name of the Work ");
        return false;
    }else{
        $("#nameofworkErr").html("");
    }  */
    
	var landExtend=$("#landExtend").val();
    if(landExtend=="" || landExtend==null){
        $("#landExtendErr").html("Please Enter Land Extend");
        $("#landExtend").focus();
        return false;
    }else{
        $("#landExtendErr").html("");
    }
    
	var surveyNo=$("#surveyNo").val();
    if(surveyNo=="" || surveyNo==null){
        $("#surveyNoErr").html("Please Enter Survey Number ");
        $("#surveyNo").focus();
        return false;
    }else{
        $("#surveyNoErr").html("");
    }
    
	var bookDetails=$("#bookDetails").val();
    if(bookDetails=="" || bookDetails==null){
        $("#bookDetailsErr").html("Please Enter Book Details");
        $("#bookDetails").focus();
        return false;
    }else{
        $("#bookDetailsErr").html("");
    }
    
	if( $("#typeOfLand option:selected").val()==""){
		  $("#typeOfLandErr").text("Please Select Type Of Land ");
		  $("#typeOfLand").focus();
		  return false;
	}else{
		$("#typeOfLandErr").text("");
	}
	var file=$("#file").val();
    if(file=="" || file==null){
        $("#file_error").html("Please Upload a file ");
        $("#file").focus();
        return false;
    }else{
        $("#file_error").html("");
    }
	
})
$(document).ready(function(){
	$('#nav-land-tab').addClass('active');
	 $('#nav-land').addClass('active');
	});
</script>
</body>
</html>
