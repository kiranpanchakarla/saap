<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<section id="intro-inner">
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
</section>
<!-- #intro -->

<main id="main"> 
  
   <!--==========================
      Contact Us Section
    ============================-->
  
  <section id="contact" class="section-bg-con">
    <div class="container">
    
    <div class="row">
    <div class="col-md-12">
    <c:url value="/administrativeSection/save" var="createUrl" />
        <form id="msform" method="post" action="${createUrl}"  modelAttribute="adminSecObject" enctype="multipart/form-data">
           
           <input type="hidden" name="${_csrf.parameterName}"
            value="${_csrf.token}" />

            <!-- fieldsets -->  
            <fieldset>
             <div class="fs-list-full"> 
                <h2 class="fs-title">Administrative Section</h2>
                <ul class="fs-list-details">
                <li><p>Name of Work <span class="red">*</span></p></li>
                <li><input type="text" id="workName" name="workName"  class="form-control mb-md" readonly value="${workInfo.workDetails}">
                <span id="workNameErr" class="errors" style="color:red;float:right;"></span> </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Work Number <span class="red">*</span></p></li>
                <li><input type="text" id="workNumber" name="workNumber"  class="form-control mb-md" readonly value="${workInfo.workNo}">                
                <span id="workNumberErr" class="errors" style="color:red;float:right;"></span> 
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>AS Sanctioned Details <span class="red">*</span></p></li>
                <li><input type="text" name="sanctionedDetails" id="sanctionedDetails" placeholder="AS Sanctioned Details "/>
                	<br><span id="sanctionedDetailsErr" class="errors" style="color:red;float:right;"></span> </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Grant<span class="red">*</span></p></li>
                <li>
                <select id="typeOfGrant" name="typeOfGrant">
					<option value="" selected="" disabled="">--Select Grant --</option>
					<c:forEach  var="grant" items="${grantTypeList}">
					<option value="${grant.id}">${grant.name}</option>
					</c:forEach>
				</select>
                
                	<br><span id="typeOfGrantErr" class="errors" style="color:red;float:right;"></span> 
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Financial Year <span class="red">*</span></p></li>
                <li>
                <select id="financialYear" name="financialYear">
					<option value="" selected="" disabled="">--Select Year --</option>
					<c:forEach  var="fyear" items="${finYearList}">
					<option value="${fyear.id}">${fyear.year}</option>
					</c:forEach>
				</select>
                	<br><span id="financialYearErr" class="errors" style="color:red;float:right;"></span> 
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Engagement of executive dept by <span class="red">*</span></p></li>
                <li>
               <select id="executiveDept" name="executiveDept">
					<option value="" selected="" disabled="">--Select Executive Dept --</option>
					<c:forEach  var="dpt" items="${executiveDeptList}">
					<option value="${dpt.id}">${dpt.name}</option>
					</c:forEach>
				</select>
                
                	<br><span id="executiveDeptErr" class="errors" style="color:red;float:right;"></span> 
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Engagement of consultant by <span class="red">*</span></p></li>
                <li>
                <select id="consultant" name="consultant">
					<option value="" selected="" disabled="">--Select Executive Consultant --</option>
					<c:forEach  var="cons" items="${executiveConsultantList}">
					<option value="${cons.id}">${cons.name}</option>
					</c:forEach>
				</select>
                
                
                <br><span id="consultantErr" class="errors" style="color:red;float:right;"></span>
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Upload Adminstrative Details Document(pdf/jpg/png)  <span class="red">*</span></p></li>
                <li><input type="file" name="file" id="file"  placeholder="Adminstrative Details"></li>
                 <br><span id="file_error" class="errors" style="color:red;float:right;"></span>
              
                </ul>
                
                
                </div>
                
                <input type="submit" id="submit" name="next" class="next action-button" value="Save and Continue"/>
               
            </fieldset>
        </form>
        
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

$('input').on('input', function() {
	  $(this).val($(this).val().replace(/[^a-z0-9]/gi, ''));
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
	
	var file=$("#file").val();
    if(file=="" || file==null){
        $("#file_error").html("Please Upload a file ");
        $("#file").focus();
        return false;
    }else{
        $("#file_error").html("");
    }
})

</script>
</body>
</html>
