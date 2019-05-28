<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Technical Sanction</title>
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
              <h2 class="section-title">Technical Sanction</h2>
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
    
     <c:url value="/technicalSanction/save" var="createUrl" />
      <form id="msform" method="POST" action="${createUrl}"  modelAttribute="techsanc" >
      <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />   
            
            <!-- fieldsets -->
            <fieldset>
            <div class="fs-list-full"> 
                <h2 class="fs-title">Technical Sanction</h2>
                
                <ul class="fs-list-details">
                <li><p>Nature of Work <span class="red">*</span></p></li>
                <li><input type="text" id="work" name="work" placeholder="Nature of Work" class="form-control mb-md" readonly value="${workInfo.natureOfWork}">
                <span id="workErr" class="errors" style="color:red;float:right;"></span>
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Work Number <span class="red">*</span></p></li>
                <li><input type="text" id="workNumber" name="workNumber" class="form-control mb-md" readonly value="${workInfo.workNo}">
                <span id="workNumberErr" class="errors" style="color:red;float:right;"></span>
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Name of the Work<span class="red">*</span></p></li>
                <li><input type="text" id="workName" name="workName" class="form-control mb-md" readonly value="${workInfo.workDetails}">
                <span id="workNameErr" class="errors" style="color:red;float:right;"></span>
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Technical Sanction No <span class="red">*</span></p></li>
                <li><input type="text" id="techSanction_no"name="techSanction_no" placeholder="Transaction Number" maxlength="9">
                <span id="techSanction_noErr" class="errors" style="color:red;float:right;"></span>
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Date <span class="red">*</span></p></li>
				<li><input  type="date" name="date" id="date" placeholder="DD/MM/YYYY" >               	
 				<span id="dateErr" class="errors" style="color:red;float:right;"></span>
               	</li>
               	</ul>
                
                
                <ul class="fs-list-details">
                <li><p>Amount<span class="red">*</span></p></li>
                <li><input type="text" id="amount" name="amount"  placeholder="Amount" maxlength="9">
                <span id="amountErr" class="errors" style="color:red;float:right;"></span>
                </li>
                </ul>
                
            
                </div>
                <input type="submit" id="submit" name="next" class="next action-button" value="Save and Continue">
                
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

  $(document).ready(function () {
    $( "#date" ).datepicker({dateFormat: 'dd/mm/yy'})
  });  
  
 
$("#techSanction_no").on('input', function () {
    this.value = this.value.match(/^\d+/);
});

$("#amount").on('input', function () {
      this.value = this.value.match(/^\d+\.?\d{0,2}/);
  });

$("#submit").click(function(){
	
	var work=$("#work").val();
    if(work=="" || work==null){
        $("#workErr").html("Please Enter Nature of Work");
        return false;
    }else{
        $("#workErr").html("");
    }
	
    var workNumber=$("#workNumber").val();
    if(workNumber=="" || workNumber==null){
        $("#workNumberErr").html("Please Enter Work Number");
        return false;
    }else{
        $("#workNumberErr").html("");
    }  

/* 	var workName=$("#workName").val();
    if(workName=="" || workName==null){
        $("#workNameErr").html("Please Enter Name of the Work");
        return false;
    }else{
        $("#workNameErr").html("");
    } */

	var techSanction_no=$("#techSanction_no").val();
    if(techSanction_no=="" || techSanction_no==null){
        $("#techSanction_noErr").html("Please Enter Technical Sanction No");
        $("#techSanction_no").focus();
        return false;
    }else{
        $("#techSanction_noErr").html("");
    }

	var date=$("#date").val();
    if(date=="" || date==null){
        $("#dateErr").html("Please Enter Date");
        $("#date").focus();
        return false;
    }else{
        $("#dateErr").html("");
    }

	var amount=$("#amount").val();
    if(amount=="" || amount==null){
        $("#amountErr").html("Please Enter Amount");
        $("#amount").focus();
        return false;
    }else{
        $("#amountErr").html("");
    }
  
})

</script>
</body>
</html>