<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">


<!--  For jQuery Autocomplete  -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="<c:url value="/resources/lib/jquery/jquery.min.js"/>" type="text/javascript"></script>
<!-- <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>  -->
<script src=<c:url value="/resources/js/jquery-ui.js"/> type="text/javascript"></script>
<!-- Favicons -->
<link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon"> 

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Raleway:400,500i,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Oswald:400,500,600" rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css" rel="stylesheet"> 

<link href="${pageContext.request.contextPath}/resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Libraries CSS Files -->
<link href="${pageContext.request.contextPath}/resources/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/lib/animate/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/ionicons/css/ionicons.min.css">
<link href="${pageContext.request.contextPath}/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Main Stylesheet File fromheadFiles-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css"/>

<!-- alertifyjs -->

  
<link href="<c:url value="/resources/alertifyjs/css/themes/default.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/alertifyjs/css/alertify.css"/>" rel="stylesheet" type="text/css" />
<script src=<c:url value="/resources/alertifyjs/alertify.min.js"/> type="text/javascript"></script>
<script src=<c:url value="/resources/js/scripts/ui-blocker/jquery.blockUI.js"/> type="text/javascript"></script>

    
<!-- alertfy-->

<!-- file upload -->
<script src=<c:url value="/resources/js/fileinput.js"/> type="text/javascript"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/fileinput.css"/>
</head>
<body>

</body>
</html>