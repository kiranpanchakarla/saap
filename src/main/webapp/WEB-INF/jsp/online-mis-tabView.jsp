<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div  id="nav-tab" > 
	<ul class="nav nav-tabs nav-fill" role="tablist">
	<li class="nav-item"><a class="nav-item nav-link" id="nav-work-tab"
		data-toggle="tab" href="" role="tab"
		aria-controls="nav-work" aria-selected="true">Work Creation</a></li>
	 	
	<li class="nav-item"><a class="nav-item nav-link" disabled="disabled" id="nav-admin-tab" data-toggle="tab"
		href="" role="tab" aria-controls="nav-admin"
		aria-selected="false">Administration</a></li> 
		
	<li class="nav-item"><a class="nav-item nav-link"
	    id="nav-department-tab" data-toggle="tab"  href="" role="tab" 
	    aria-controls="nav-department" aria-selected="false">Department</a></li>
		 
	<li class="nav-item"><a class="nav-item nav-link" id="nav-land-tab" data-toggle="tab"
		href="" role="tab" aria-controls="nav-land"
		 aria-selected="false">Land Details</a></li>
   </ul>  
</div>
	 



</body>
<script>
$(document).ready(function() {

	<c:if test="${workObject.workStatus eq 'Work_Created'}">
	 
	    $("#nav-admin-tab").not('.active').addClass('disabled');
	    $("#nav-admin-tab").not('.active').find('a').removeAttr("data-toggle");
	    $("#nav-admin-tab").css({"pointer-events":"none"});
	     
	    $("#nav-department-tab").not('.active').addClass('disabled');
	    $("#nav-department-tab").not('.active').find('a').removeAttr("data-toggle");
	    $("#nav-department-tab").css({"pointer-events":"none"});
	    
	    $("#nav-land-tab").not('.active').addClass('disabled');
	    $("#nav-land-tab").not('.active').find('a').removeAttr("data-toggle");
	    $("#nav-land-tab").css({"pointer-events":"none"});
	 </c:if>
	 
	 <c:if test="${workObject.workStatus eq 'Admin_Sanction'}">
	 
	    $("#nav-department-tab").not('.active').addClass('disabled');
	    $("#nav-department-tab").not('.active').find('a').removeAttr("data-toggle");
	    $("#nav-department-tab").css({"pointer-events":"none"});
	    
	    $("#nav-land-tab").not('.active').addClass('disabled');
	    $("#nav-land-tab").not('.active').find('a').removeAttr("data-toggle");
	    $("#nav-land-tab").css({"pointer-events":"none"});
	 </c:if>
	 
	 <c:if test="${workObject.workStatus eq 'Line_Department'}">
	 
	    $("#nav-land-tab").not('.active').addClass('disabled');
	    $("#nav-land-tab").not('.active').find('a').removeAttr("data-toggle");
	    $("#nav-land-tab").css({"pointer-events":"none"});
	 </c:if>
	 
	$("#nav-work-tab").click(function() {
		<c:url value="/worksCreation/edit?workId=${workObject.id}" var="homeUrl" />
        window.location.href = "${homeUrl}";
    });
	
    $("#nav-admin-tab").click(function() {
        <c:url value="/administrativeSection/edit/${workObject.id}" var="homeUrl" />
        window.location.href = "${homeUrl}";
    });
    
    $("#nav-department-tab").click(function() {
        <c:url value="/lineDepartment/edit/${workObject.id}" var="homeUrl" />
        window.location.href = "${homeUrl}";
    });
    
    $("#nav-land-tab").click(function() {
        <c:url value="/landDetails/edit/${workObject.id}" var="homeUrl" />
        window.location.href = "${homeUrl}";
    });
    
    <c:if test="${empty workObject.status}">
	 
    $("#nav-work-tab").not('.active').addClass('disabled');
    $("#nav-work-tab").not('.active').find('a').removeAttr("data-toggle");
    $("#nav-work-tab").css({"pointer-events":"none"});
    
    $("#nav-admin-tab").not('.active').addClass('disabled');
    $("#nav-admin-tab").not('.active').find('a').removeAttr("data-toggle");
    $("#nav-admin-tab").css({"pointer-events":"none"});
     
    $("#nav-department-tab").not('.active').addClass('disabled');
    $("#nav-department-tab").not('.active').find('a').removeAttr("data-toggle");
    $("#nav-department-tab").css({"pointer-events":"none"});
    
    $("#nav-land-tab").not('.active').addClass('disabled');
    $("#nav-land-tab").not('.active').find('a').removeAttr("data-toggle");
    $("#nav-land-tab").css({"pointer-events":"none"});
 </c:if>
});
</script>
</html>