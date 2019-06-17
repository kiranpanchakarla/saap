<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Technical Sanction</title>
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
              <h2 class="section-title">Technical Sanction</h2>
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
                <h2 class="fs-title">Technical Sanction</h2>
                
                <ul class="fs-list-details">
                <li><p>Nature of Work <span class="red">*</span></p></li>
                <li><input type="text" id="natureOfWork" name="natureOfWork" placeholder="Nature of Work" class="form-control mb-md" readonly value="${techInfo.work.natureOfWork.name}">
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Work Number <span class="red">*</span></p></li>
                <li><input type="text" id="workNumber" name="workNumber" class="form-control mb-md" readonly value="${techInfo.work.workNo}">
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Name of the Work<span class="red">*</span></p></li>
                <li><input type="text" id="workName" name="workName" class="form-control mb-md" readonly value="${workLineItems.workDetails}">
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Technical Sanction No <span class="red">*</span></p></li>
                <li><input type="text" id="techSanction_no"name="techSanction_no" class="form-control mb-md" readonly value="${techInfo.techSanction_no}">
               </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Date <span class="red">*</span></p></li>
				<li><fmt:formatDate pattern = "dd/MM/yyyy" var="fmtDate" value="${techInfo.date}" />  
				   <input type="text" id="date"name="date" readonly class="form-control mb-md" value="${fmtDate}">          	
 				</li>
               	</ul>
                
                
                <ul class="fs-list-details">
                <li><p>Amount<span class="red">*</span></p></li>
                <li><input type="text" id="amount" name="amount" class="form-control mb-md"  readonly value="${techInfo.amount}">
                </li>
                </ul>
                </div>
            </fieldset>
         <div class="row">
          <div class="col-sm-6 form-group"><a href="#" onclick="goBack()" class="btn btn-info ">Back</a></div>
          <div class="col-sm-6 form-group"><a href="<c:url value="/tenderProcess/view?workId=${techInfo.work.id}"/>" class="btn btn-info ">Technical Sanction Page</a></div>
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
