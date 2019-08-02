<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Online MIS</title>
<link
	href="<c:url value="/resources/css/dataTables/buttons.dataTables.min.css"/>"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value="/resources/css/dataTables/jquery.dataTables.min.css"/>"
	rel="stylesheet" type="text/css" />

<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
<jsp:include page="online-mis-header.jsp" />
<script src="<c:url value="/resources/lib/jquery/jquery.min.js"/>"
	type="text/javascript"></script>

<style>
label {
    color: #06213e !important;
    word-break: break-word;
    margin-left: 5px;
}
h2+div.row {
    margin-left: -5px !important;
}
h2.fs-title {
    margin-bottom: 15px;
    letter-spacing: unset;
}
#nav-tab {
    width: 100%;
}
.tab-content {
    box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
}
#nav-tab li a.disabled {
    pointer-events: none !important;
}
.click-not-allowed {
    cursor: not-allowed !important;
}
</style>

</head>

<body>


    
    <c:choose>
		<c:when test="${tenderInfo.id != null}">
		<c:url value="/tenderProcess/edit/${workObject.id}" var="createUrl"></c:url>
		</c:when>
		<c:otherwise>
		 <c:url value="/tenderProcess/create" var="createUrl"></c:url>
		</c:otherwise>
		</c:choose>
    
	<section id="contact" class="section-bg-con">
		<div class="container">
		<c:choose>
		<c:when test="${userRole eq 'ROLE_CONSULTANT'}">
		<c:import url="/WEB-INF/jsp/online-mis-consultantTabView.jsp" />
		</c:when>
		<c:otherwise>
		 <c:import url="/WEB-INF/jsp/online-mis-departmentTabView.jsp" />
		</c:otherwise>
		</c:choose>

		<div class="tab-content">
		
			<div class="row">
				<div class="col-md-12">
					<form id="msform" method="get" action="${createUrl}">
					<br>
 					<h2 class="fs-title">Consultant Information</h2>
                    <div class="row">
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Consultant Firm</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.consultant_firm}</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>PAN</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.pan_number}</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>TIN </span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.tin_number}</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Mobile </span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.mobile_no}</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Landline </span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.landline_no}</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Email</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.emailId}</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Address</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.address}</label>
                                </div>
                            </div>
                        </div>
                        
                        </div>
                         
                         <br>
 					<h2 class="fs-title">BANK DETAILS OF FIRM</h2>
                    <div class="row">
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Bank</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.bank_name}</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Branch</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.branch}</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Account Type</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.account_type}</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>A/c Number</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.account_number}</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>IFSC Code</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${consltInfo.ifsc_code}</label>
                                </div>
                            </div>
                        </div>
                        </div>
                        <hr />
                        <br>
                        
 					<h2 class="fs-title">LAND SURVEY DETAILS</h2>
                    <div class="row">
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Survey</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${landSurveyDetails.surveycontent}</label>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Comments</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${landSurveyDetails.comments}</label>
                                </div>
                            </div>
                        </div>
                        
                         <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Land Details Document</span>
                                </div>
                                <div class="col-7">
                                   <span>:</span><c:forEach items="${landAttachmentFiles}" var="file" varStatus="loop">
									<c:set var="filePathParts" value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
									<a href="${pageContext.request.contextPath}${file.path}"
									target="_blank">${filePathParts[fn:length(filePathParts)-1]}</a>
									</c:forEach>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Land Survey Details Document</span>
                                </div>
                                <div class="col-7">
                                   <span>:</span><c:forEach items="${landSurveyAttachmentFiles}" var="file" varStatus="loop">
									<c:set var="filePathParts" value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
									<a href="${pageContext.request.contextPath}${file.path}"
									target="_blank">${filePathParts[fn:length(filePathParts)-1]}</a>
									</c:forEach>
                                </div>
                            </div>
                        </div>
                         
                        
                        </div>
                        <hr />
                        <br>
 					<h2 class="fs-title">PRELIMINARY PREPARATION LAYOUT</h2>
                    <div class="row">
                        
                        
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Document Details</span>
                                </div>
                                <div class="col-7">
                                <span>:</span><c:forEach items="${PPLayoutAttachmentFiles}" var="file" varStatus="loop">
									<c:set var="filePathParts" value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
									<a href="${pageContext.request.contextPath}${file.path}"
									target="_blank">${filePathParts[fn:length(filePathParts)-1]}</a>
									</c:forEach>
                                </div>
                            </div>
                        </div>
                        
                        </div>
                        
                        <h2 class="fs-title">GEOTECHNICAL INVESTIGATION</h2>
                    <div class="row">
                        
                         <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Comments</span>
                                </div>
                                <div class="col-7">
                                    <span>:</span><label>${investigation.comments}</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-4">
                            <div class="row">
                                <div class="col-5">
                                    <span>Document Details</span>
                                </div>
                                <div class="col-7">
                                <span>:</span><c:forEach items="${GIAttachmentFiles}" var="file" varStatus="loop">
									<c:set var="filePathParts" value="${fn:split(fn:replace(file.path, '\\\\','@'), '@')}" />
									<a href="${pageContext.request.contextPath}${file.path}"
									target="_blank">${filePathParts[fn:length(filePathParts)-1]}</a>
									</c:forEach>
                                </div>
                            </div>
                        </div>
                        
                        </div>
                        
                        <c:if test="${userRole eq 'ROLE_DEPARTMENT'}">
		<div class="col-md-12" align="right">
           <button type="submit" class="btn btn-info">Tender Process</button>  
         </div>
         </c:if>

							 <c:if test="${userRole eq 'ROLE_CONSULTANT'}">
							<div class="col-md-12" align="right">
								<c:choose>
									<c:when test="${workInfo.workStatus eq 'Land_Details'}">
										<button type="submit" class="btn btn-info">Consultant
											Info</button>
									</c:when>
									
									<c:otherwise>
										<button type="submit" class="btn btn-info">Next</button>
									</c:otherwise>
								</c:choose>
							</div>
							 </c:if>
                        <br>
					</form>
				</div>
			</div>
		</div>
		</div>
		</div>
	</section>
	<br>

	<br>
	<br>

	<script>
	var onChange = false;
		$(document).ready(function() {
			/* 	 alert( $.fn.jquery ) */
			$('#viewTable').DataTable({
				"scrollX" : false,
				"searching" : false,
				"bPaginate" : false,
				"info" : false,
				"dom" : '<"top"i>rt<"bottom"flp><"clear">'
			});
			
			$('#nav-consultant-tab').addClass('active');
			$('#nav-consultant').addClass('active');
		});
		
	</script>

	<!-- <script  src=<c:url value="/resources/js/scripts/dataTables/buttons.html5.min.js"/>
        type="text/javascript"></script> 
   <script src=<c:url value="/resources/js/scripts/dataTables/dataTables.buttons.min.js"/>
        type="text/javascript"></script>  -->
	<script
		src=<c:url value="/resources/js/scripts/dataTables/jquery.dataTables.min.js"/>
		type="text/javascript"></script>
	<script
		src=<c:url value="/resources/js/scripts/ui-blocker/jquery.blockUI.js"/>
		type="text/javascript"></script>


	<jsp:include page="online-mis-footer.jsp" />
</body>
</html>