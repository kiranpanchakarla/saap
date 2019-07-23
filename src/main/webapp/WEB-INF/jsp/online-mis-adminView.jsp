<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Administrative Section</title>
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
              <h2 class="section-title">Administrative Section</h2>
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
      <form id="msform" method="GET"  >
      <fieldset>
             <div class="fs-list-full"> 
                <h2 class="fs-title">Administrative Section</h2>
                <ul class="fs-list-details">
                <li><p>Name of Work <span class="red">*</span></p></li>
                <li><input type="text" title="SAAP" name="work-name" class="form-control mb-md" readonly 
                value="${adminInfo.workName}">
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Work Number <span class="red">*</span></p></li>
                <li><input type="text" title="1" name="word-number" class="form-control mb-md" readonly 
                value="${adminInfo.workNumber}"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>AS Sanctioned Details <span class="red">*</span></p></li>
                <li><input type="text" title="1" name="detail-sanctioned" class="form-control mb-md" readonly 
                value="${adminInfo.sanctionedDetails}"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Grant<span class="red">*</span></p></li>
                <li><input type="text"  title="1" name="grantid" class="form-control mb-md" readonly value="${adminInfo.typeOfGrant.name}"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Financial Year <span class="red">*</span></p></li>
                <li><input type="text" title="2017-2018" name="grantid" class="form-control mb-md" readonly value="${adminInfo.financialYear.year}">
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Engagement of executive dept by <span class="red">*</span></p></li>
                <li><input type="text" title="Govt" name="grantid" class="form-control mb-md" readonly value="${adminInfo.executiveDept.name}">
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Engagement of consultant by <span class="red">*</span></p></li>
                <li><input type="text" title="SAAP" name="grantid" class="form-control mb-md" readonly value="${adminInfo.consultant.name}">
                </li>
                </ul>
             
                
                <ul class="fs-list-details">
                <li><div id="page-title1"></div>
                <p>Upload Adminstrative Details Document(pdf/jpg/png) <span class="red">*</span></p></li>
                <c:forEach items="${filePath}" var="entry">
			      <li><a href="${entry.key}" target="_self" id="docView" name="image" style="float: left;">${entry.value}</a></li><br>
		       </c:forEach>
              </ul>
              
             
              <ul class="fs-list-details">
              <li><a href="#" onclick="goBack()" class="btn btn-info ">Back</a></li>
              </ul>
              
               <ul class="fs-list-details">
               <c:if test="${deptInfo!=null}">
               <li><a href="<c:url value="/lineDepartment/view?workId=${adminInfo.work.id}"/>" class="btn btn-info ">Linking with Line Department Page</a></li>
               </c:if>
              </ul>
               
            </div>
           </fieldset>
            
        
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
