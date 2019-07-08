<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Online MIS Details</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
</head>
<link href="<c:url value="/resources/css/dataTables/buttons.dataTables.min.css"/>"
    rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/dataTables/jquery.dataTables.min.css"/>"
    rel="stylesheet" type="text/css" />
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
              <h2 class="section-title">Online MIS Details</h2>
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
    <div class="container-full">
    <div class="row">
     <div class="col-md-12">
    <table id="viewTable" class="display table-hover table-striped table-bordered " >
    <thead>
  <!-- <tr>
    <th colspan="12"><h6 class="highlight text-center">SPORTS AUTHORITY OF ANDHRA PRADESH</h6></th>
  </tr>
  <tr>
    <td colspan="12"><p class="text-center"><strong>Abstract of status of SAAP infra work entrusted to various Executing Departments in AP State</strong></p></td>
  </tr> -->
  
  <tr>
    <td rowspan="2">S.No.</td>
    <td rowspan="2">Name of the Department</td>
    <td rowspan="2">No. of works entrusted</td>
    <td rowspan="2">Estimate cost in Lakhs</td>
    <td colspan="2">No. of works for which</td>
    <td rowspan="2">No. of works to be Tendered</td>
    <td rowspan="2">No. of works in Tender stage</td>
    <td rowspan="2">No. Agreement entered</td>
    <td rowspan="2">No. of works in progress</td>
    <td rowspan="2">No.of works Completed</td>
    <td rowspan="2">Remarks</td>
  </tr>
  <!-- <tr>
    <td>Sites identified</td>
    <td>DPRs completed</td> 
  </tr> -->
 <!--  <tr>
    <td colspan="12"><strong>KVK Works</strong></td> 
  </tr> -->
  </thead>
  <tbody>
  <c:forEach items="${reportList}" var="product">
  <tr>
    <td><c:set var="count" value="${count + 1}"
	scope="page" /> <c:out value="${count}" /></td>
    <td>${product.departmentName}</td>
    <td>${product.noOfWorks}</td>
    <td>${product.estimatedCost}</td>
   <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td> 
  </tr>
  </c:forEach>
  </tbody>
</table>

 <!-- <table width="100%" border="1" class="table">
 <tr>
    <td>Entrusted</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>&nbsp;</td>
    <td></td>
    <td>&nbsp;</td>
    <td></td>
    <td></td>
 </tr>
 <tr>
    <td>Agency not known</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
 </tr>
 <tr>
    <td><strong>Total</strong></td>
    <td><strong></strong></td>
    <td><strong></strong></td>
    <td><strong></strong></td>
    <td><strong></strong></td>
    <td><strong></strong></td>
    <td><strong></strong></td>
    <td><strong></strong></td>
    <td><strong></strong></td>
    <td><strong></strong></td>
 </tr>
</table>  -->
    
    </div>
    </div>
    </div>
  </section>

 
  
    
  <!-- #contact --> 
  
</main>

<!--=== Footer ====-->
<jsp:include page="online-mis-footer.jsp" />

</body>
<script type="text/javascript">
$(document).ready(function() {
	 
    $('#viewTable').DataTable({
        "scrollX" : false,
        "searching": false,
			"info": false,
			"responsive": true,
			"dom": '<"top"i>rt<"bottom"flp><"clear">'
    });
});
</script>
<script src=<c:url value="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"/>
        type="text/javascript"></script>
</html>
