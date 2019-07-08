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
<title>SAAP : Administrative Sanction Details</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />

</head>

<body>
<!--=== Header ====-->
<%-- <jsp:include page="online-mis-header.jsp" /> --%>
<c:import url="/WEB-INF/jsp/online-mis-header.jsp" />
<c:import url="/WEB-INF/jsp/online-mis-fileUpload.jsp" />

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
    
   <%-- <jsp:include page="online-mis-tabView.jsp" /> --%>
   <c:import url="/WEB-INF/jsp/online-mis-tabView.jsp" /> 
   <div class="tab-content">
	
	 <div class="tab-pane fade show" id="nav-admin" role="tabpanel" aria-labelledby="nav-admin-tab">
     <div class="row">
    <div class="col-md-12">
    <c:url value="/administrativeSection/save" var="createUrl" />
        <form:form id="msform" method="POST" action="${createUrl}"  modelAttribute="adminSecObject" enctype="multipart/form-data">
           <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="hidden" id="moduleName" value="ADMINISTRATIVE"/>
            <form:input type="hidden" id="workid" path="work.id" value="${workInfo.id}"/>
           
         <c:choose>
			<c:when test="${!empty adminSecObject.id}">
				<form:input type="hidden" path="id" class="form-control" id="id" ></form:input>
			</c:when>
		</c:choose> 

            <!-- fieldsets -->  
            <fieldset>
             <div class="fs-list-full"> 
                <h2 class="fs-title">Administrative Sanction</h2>
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
                <li><p>Sanctioned Details <span class="red">*</span></p></li>
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
                
                <form method="POST"  id="fileUploadForm"> 
                 <ul class="fs-list-details">
                <li><p>Upload Adminstrative Details Document(pdf/jpg/png)<span class="red">*</span></p>
                <label for="files"  class="fileuploadLabel">Upload Image</label>
                <input type="file" name="file" id="files" style="display: none" accept=".png, .jpg, .jpeg, .pdf" value="${filePath}" multiple="multiple"> 
                <table id="filedetails"></table>
	            </li>
	            <span id="file_error" class="errors" style="color:red;float:right;"></span>
                </ul>
                </form>
                
                
                
               </div>
               <c:if test="${adminSecObject.id==null}">
                <input type="submit" id="submit" name="next" class="next action-button" value="Save and Continue"/>
               </c:if>
                <c:if test="${adminSecObject.id!=null}">
                <input type="submit" id="submit" name="next" class="next action-button" value="Update and Continue"/>
               </c:if>
            </fieldset>
            
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
<%-- <jsp:include page="online-mis-footer.jsp" /> --%>
<c:import url="/WEB-INF/jsp/online-mis-footer.jsp" />
<script type="text/javascript">
var contextPath = "${pageContext.request.contextPath}";
$("#submit").click(function(){
	

    
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
	var fileName
	if($("#filedetails tr").length>0){
		 fileName=$("#filedetails tr:first").data("fileid");
	}
	if(fileName==""){
			fileName=$("#file").val();
		}
	if(fileName=="" || fileName==null){
        $("#file_error").html("Please Upload a file ");
        $("#files").focus();
        return false;
    }
	
  
	
});

$(document).ready(function(){
	$('#nav-admin-tab').addClass('active');
	 $('#nav-admin').addClass('active');
	 
	 
	 
	 
	 
	 
	 
	});
	
</script>
<!-- <script src=<c:url value="/resources/js/fileUpload.js"/> type="text/javascript"></script> -->
<!-- <script src=<c:url value="/resources/js/fileinput.js"/> type="text/javascript"></script> -->
</body>
</html>