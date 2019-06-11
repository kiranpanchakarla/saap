<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Online MIS</title>
<link href="<c:url value="/resources/css/dataTables/buttons.dataTables.min.css"/>"
    rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/dataTables/jquery.dataTables.min.css"/>"
    rel="stylesheet" type="text/css" />

 <c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" /> 
<jsp:include page="online-mis-header.jsp" />
<script src="<c:url value="/resources/lib/jquery/jquery.min.js"/>" type="text/javascript"></script>



</head>

<body>


<section id="intro-inner">
  <div class="page-header">
    <section id="page-title" class="parralax">
      <div class="container rel">
        <div class="row">
          <div class="col-md-12">
            <div class="text-center">
              <h2 class="section-title">View Details</h2>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</section>
 <c:url value="/worksCreation/create" var="createUrl" />
        <form id="msform"  method="get" action="${createUrl}" modelAttribute="workObject">
         

<div >

                                <div class=" col-md-12" align="right">
                                 <button type="submit" class="btn btn-info">Work Creation Screen</button>
                                </div>  
  
                                 <table id="viewTable"  class="display nowrap table table_padding_custom table-hover table-striped table-bordered" >
                                                        <thead>
                                                            <tr>
                                                                <th>S.No</th>
                                                                <th>ID</th>
                                                                <th>Type of Work</th>
                                                                <th>Nature Of Work</th>
                                                                <th>Work No</th>
                                                                <th>Survey No</th>
                                                                <th>Work Details</th>
                                                                <th>Department Name</th>
                                                                <th>Consultant firm</th>
                                                                <th>Agency Name</th>
                                                                <th>Actions</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                         
                                              <c:forEach items="${viewList}" var="viewDetails">
														  <tr>
														    <td><c:set var="count" value="${count + 1}"
															scope="page" /> <c:out value="${count}" /></td>
															<td>${viewDetails.id}</td>
														    <td>${viewDetails.typeOfWork}</td>
														    <td>${viewDetails.natureOfWork}</td>
														    <td>${viewDetails.workNo}</td>
														    <td>${viewDetails.surveyNo}</td>
														    <td>${viewDetails.workDetails}</td>
														    <td>${viewDetails.departmentName}</td>
														    <td>${viewDetails.consultantfirm}</td>
														    <td>${viewDetails.agencyName}</td>
														   <td> <a class="btn btn-edit"  href="<c:url value="/worksCreation/edit?workId=${viewDetails.id}"/>" data-toggle="tooltip" data-placement="top" title="Edit"><i
                                                                                class="glyphicon glyphicon-pencil left"></i></a>
                                                                 <a class="btn btn-delete" href="<c:url value="/worksCreation/delete?workId=${viewDetails.id}"/>"
                                                                        onclick="" data-toggle="tooltip" data-placement="top" title="Delete"><i
                                                                            class="glyphicon glyphicon-trash left"></i></a> 
                                                                  <a class="btn btn-view"
                                                                        href="<c:url value="/worksCreation/view?workId=${viewDetails.id}"/>" data-toggle="tooltip" data-placement="top" title="View"><i
                                                                            class="fa fa-eye left"></i></a>
                                                                                           
                                                                                </td>
														    
														  </tr>
														  </c:forEach> 
														
                                                        </tbody>
                                                        
                                   </table>
                     
                                 
</div>

</form>

 <script>
 
 
 
 $(document).ready(function() {
/* 	 alert( $.fn.jquery ) */
     $('#viewTable').DataTable({
         "scrollX" : false,
         "searching": false,
			"info": false,
			"dom": '<"top"i>rt<"bottom"flp><"clear">'
     });
 });
</script>

<!-- <script  src=<c:url value="/resources/js/scripts/dataTables/buttons.html5.min.js"/>
        type="text/javascript"></script> 
   <script src=<c:url value="/resources/js/scripts/dataTables/dataTables.buttons.min.js"/>
        type="text/javascript"></script>  -->
    <script src=<c:url value="/resources/js/scripts/dataTables/jquery.dataTables.min.js"/>
        type="text/javascript"></script>
            <script src=<c:url value="/resources/js/scripts/ui-blocker/jquery.blockUI.js"/> type="text/javascript"></script>
        
  
  <jsp:include page="online-mis-footer.jsp" />  
</body>
</html>