<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Online MIS</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
</head>
<body>
<jsp:include page="online-mis-header.jsp" />

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
 <c:url value="/workCreationView/view" var="createUrl" />
        <form id="msform"  method="post" action="${createUrl}" modelAttribute="workObject">
         

<div class="container">
    <div class="row">
                                 <table id="viewTable"  class="display nowrap table table_padding_custom table-hover table-striped table-bordered" style="width: 100%">
                                                        <thead>
                                                            <tr>
                                                                <th>S.No</th>
                                                                <th>Type of Work</th>
                                                                <th>Nature Of Work</th>
                                                                <th>Name Of Work</th>
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
                                                          
                                                      <%--   <c:forEach items="${viewList}" var="viewDetails">
														  <tr>
														    <td><c:set var="count" value="${count + 1}"
															scope="page" /> <c:out value="${count}" /></td>
														    <td>${viewDetails.TypeOfWork}</td>
														    <td>${viewDetails.NatureOfWork}</td>
														    <td>${viewDetails.NameOfWork}</td>
														    <td>${viewDetails.WorkNo}</td>
														    <td>${viewDetails.SurveyNo}</td>
														    <td>${viewDetails.WorkDetails}</td>
														    <td>${viewDetails.DepartmentName}</td>
														    <td>${viewDetails.Consultantfirm}</td>
														    <td>${viewDetails.AgencyName}</td>
														   <td></td>
														    
														  </tr>
														  </c:forEach> --%>
														   <tr>
														    <td></td>
														    <td></td>
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
                                                        </tbody>
                                                        
                                   </table>
     </div>                              
                                <div class="margTop10 col-md-12" align="center">
                                 <button type="submit" class="btn btn-info">Next Page</button>
                                </div>    
</div>

</form>

 <script>
 
 
 
 $(document).ready(function() {
     $('#viewTable').DataTable({
         "scrollX" : true,
         "searching": false,
			"info": false,
			"dom": '<"top"i>rt<"bottom"flp><"clear">'
     });
 });
</script>
<script  src=<c:url value="/resources/js/scripts/dataTables/buttons.html5.min.js"/>
        type="text/javascript"></script>
    <script src=<c:url value="/resources/js/scripts/dataTables/dataTables.buttons.min.js"/>
        type="text/javascript"></script>
    <script src=<c:url value="/resources/js/scripts/dataTables/jquery.dataTables.min.js"/>
        type="text/javascript"></script>
  
<jsp:include page="online-mis-footer.jsp" />
</body>
</html>