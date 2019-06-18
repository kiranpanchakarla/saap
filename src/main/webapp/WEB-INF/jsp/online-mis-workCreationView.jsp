<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Work Creation</title>
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
              <h2 class="section-title">Work Creation</h2>
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
      <form id="msform" method="GET" >
      <fieldset>
                <h2 class="fs-title">Work Creation</h2>
                <ul class="fs-list-details">
                <li><p>Types of Work <span class="red">*</span></p></li>
                <li> <input type="text" title="New" id="typeworkid" name="typeOfWork" class="form-control mb-md" readonly value="${workInfo.typeOfWork.name}">
                 </li> 
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Nature of work <span class="red">*</span></p></li>
                <li><input type="text" title="NTR KVK (Constituency KVKs)" id="worknatureid" name="natureOfWork" class="form-control mb-md" readonly value="${workInfo.natureOfWork.name}"> 
               </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>District <span class="red">*</span></p></li>
                <li><input type="text" title="Ananthapuramu" id="districtid" name="districtid" class="form-control mb-md" readonly value="${workInfo.district.name}">
               </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Constituency <span class="red">*</span></p></li>
                <li><input type="text" title="Ichchapuram" id="constituancyId" name="constituancyId" class="form-control mb-md" readonly value="${workInfo.constituency.name}">
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Mandal <span class="red">*</span></p></li>
                <li><input type="text" title="Amadalavalasa" id="mandalId" name="mandalId" class="form-control mb-md" readonly value="${workInfo.mandal.name}">
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Village <span class="red">*</span></p></li>
                <li><input type="text" title="Alikam" id="villagesId" name="villagesId" class="form-control mb-md" readonly value="${workInfo.village.name}"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Location <span class="red">*</span></p></li>
                <li><input type="text" title="1" name="location" class="form-control mb-md" readonly value="${workInfo.district.name}">
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Work Number <span class="red">*</span></p></li>
                <li><input type="text" title="1" name="work-number" class="form-control mb-md" readonly value="${workInfo.workNo}"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>No. of Works <span class="red">*</span></p></li>
                <li><input type="text" title="1" name="no-of-work" class="form-control mb-md" readonly  value="${workInfo.noOfWorks}"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Work Detail <span class="red">*</span></p></li>
                <li><input type="text" title="SAAP" name="s.no" class="form-control mb-md" readonly value="${workLineItems.workDetails}"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Estimated Cost <span class="red">*</span></p></li>
                <li><input type="text" title="SAAP" name="work-details-new" class="form-control mb-md" readonly value="${workLineItems.cost}"></li>
                </ul>
            </fieldset>
            
          <div class="row">
          <div class="col-sm-6 form-group"><a href="#" onclick="goBack()" class="btn btn-info ">Back</a></div>
           <c:if test="${adminInfo != null}">
          <div class="col-sm-6 form-group"><a href="<c:url value="/administrativeSection/view?workId=${workInfo.id}"/>" class="btn btn-info ">Administrative Page</a></div>
         </c:if>
         </div>
        </form>
    </div>
 </div>
 </div>
  </section>
</main>

<jsp:include page="online-mis-footer.jsp" />
   <script type="text/javascript">
	function goBack() {
			window.history.back();
		}
	</script>
</body>
</html>
