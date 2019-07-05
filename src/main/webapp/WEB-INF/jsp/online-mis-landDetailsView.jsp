<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Linking with Line Department</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
<jsp:include page="online-mis-header.jsp" />
</head>
<body>
<!-- <section id="intro-inner">
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
</section> -->
<main id="main"> 
  <section id="contact" class="section-bg-con">
    <div class="container">
    <div class="row">
    <div class="col-md-12">
      <form method="GET" id="msform">
       <fieldset>
            <div class="fs-list-full"> 
                <h2 class="fs-title">Land details</h2>
                
                <ul class="fs-list-details">
                <li><p>Work <span class="red">*</span></p></li>
                <li><input type="text"  name="activityName" class="form-control mb-md" readonly value="${landInfo.work.natureOfWork.name}"></li> 
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Work Number <span class="red">*</span></p></li>
                <li><input type="text" name="packageNumber" title="1" class="form-control mb-md" readonly value="${landInfo.work.workNo}"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Name of the Work <span class="red">*</span></p></li>
                <li><input type="text" title="Land work" name="fullLand" class="form-control mb-md" readonly value="${workLineItems.workDetails}"></li> 
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Land Extend <span class="red">*</span></p></li>
                <li><input type="text" title="Land" name="fullRapFile" class="form-control mb-md" readonly value="${landInfo.landExtend}"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Survey Number <span class="red">*</span></p></li>
                <li><input type="text" title="survey" name="SurveyFile" class="form-control mb-md" readonly 
                value="${landInfo.surveyNo}"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Field Mesurment Book Details <span class="red">*</span></p></li>
                <li><input type="text" title="book" name="bookDetails" class="form-control mb-md" readonly 
                value="${landInfo.bookDetails}"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Type Of Land  <span class="red">*</span></p></li>
                <li><input type="text" title="Government" name="activityId" class="form-control mb-md" readonly 
                value="${landInfo.typeOfLand.name}">
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Upload Land Details Document(pdf/jpg/png) <span class="red">*</span></p></li>
               <c:forEach items="${filePath}" var="entry">
			      <li><a href="${entry.key}" target="_self" id="docView" name="image" >${entry.value}</a></li>
		       </c:forEach>
                </ul>
                
                </div>
            </fieldset>
         <div class="row">
          <div class="col-sm-6 form-group"><a href="#" onclick="goBack()" class="btn btn-info ">Back</a></div>
          <c:if test="${consultInfo!=null}">
          <div class="col-sm-6 form-group"><a href="<c:url value="/ConsultantInfo/view?workId=${landInfo.work.id}"/>" class="btn btn-info ">Consultant Information Page</a></div>
         </c:if>
        </div> 
        </form>
    </div>
</div>
 </div>
  </section>

</main>

<!--=== Footer ====-->
<jsp:include page="online-mis-footer.jsp" />
   <script type="text/javascript">
	function goBack() {
			window.history.back();
		}
	</script>
</body>
</html>
