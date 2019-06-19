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
              <h2 class="section-title">Linking with Line Department</h2>
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
                <h2 class="fs-title">Linking with Line Department</h2>
                
                <ul class="fs-list-details">
                <li><p>Name of Department <span class="red">*</span></p></li>
                <li><input type="text" title="department" name="department-name" class="form-control mb-md" readonly value="${deptInfo.departmentName}">
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Nature of work <span class="red">*</span></p></li>
                <li><input type="text" title="work" name="dept-work-nature" class="form-control mb-md" readonly value="${deptInfo.workNature}">
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Circle <span class="red">*</span></p></li>
                <li><input type="text" title="circle" name="circle-name" class="form-control mb-md" readonly value="${deptInfo.circle}">
                 </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Name of the Division <span class="red">*</span></p></li>
                <li><input type="text" title="PIU DIVISION SRIKAKULAM" name="divisionId" class="form-control mb-md" readonly value="${deptInfo.divisionName.name}"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Name of the SubDivision <span class="red">*</span></p></li>
                <li><input type="text" title="SRIKAKULAM" name="subdivisionId" class="form-control mb-md" readonly value="${deptInfo.subdivisionName.name}"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Name of the Section <span class="red">*</span></p></li>
                <li><input type="text" title="SRIKAKULAM" name="sectionId" class="form-control mb-md" readonly value="${deptInfo.sectionName.name}"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Name of the Section officer <span class="red">*</span></p></li>
                <li><input type="text" title="Section officer" name="sectionId" class="form-control mb-md" readonly value="${deptInfo.sectionOfficerName}">
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Mobile No <span class="red">*</span></p></li>
                <li><input type="text" title="7689765432" name="mobileNo" class="form-control mb-md" readonly value="${deptInfo.mobileNo}">
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Email Id <span class="red">*</span></p></li>
                <li><input type="text" title="a@gmail.com" name="emailId" class="form-control mb-md" readonly value="${deptInfo.email}"></li>
                </ul>
              </div>
            </fieldset>
            
          <div class="row">
          <div class="col-sm-6 form-group"><a href="#" onclick="goBack()" class="btn btn-info ">Back</a></div>
          <c:if test="${landInfo!=null}">
          <div class="col-sm-6 form-group"><a href="<c:url value="/landDetails/view?workId=${deptInfo.work.id}"/>" class="btn btn-info ">Land details Page</a></div>
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
