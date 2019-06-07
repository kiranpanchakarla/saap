<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Consultant Information</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
</head>
<body>
<section id="intro-inner">
  <div class="page-header">
    <section id="page-title" class="parralax">
      <div class="container rel">
        <div class="row">
          <div class="col-md-12">
            <div class="text-center">
              <h2 class="section-title">Consultant Information</h2>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</section>
<main id="main"> 
  <section id="contact" class="section-bg-con">
    <div class="container">
    <div class="row">
    <div class="col-md-12">
      <form method="GET" id="msform">
      <fieldset>
                <h2 class="fs-title">Consultant Information</h2>
                <ul class="fs-list-details">
                <li><p>Name of Consultant Firm<span class="red">*</span></p></li>
                <li><input type="text" title="consultant-firm" id="consultant_firm" name="consultant_firm" class="form-control mb-md" readonly value="${consultInfo.consultant_firm}">  
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>PAN Number <span class="red">*</span></p></li>
                <li><input type="text" title="pan-number" id="pan_number" name="pan_number" class="form-control mb-md" readonly value="${consultInfo.pan_number}"> 
                 </li>
               </ul>
                
                <ul class="fs-list-details">
                <li><p>TIN Number <span class="red">*</span></p></li>
                <li><input type="text" title="tin-number" id="tin_number" name="tin_number" class="form-control mb-md" readonly value="${consultInfo.tin_number}"> 
                </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Mobile Number<span class="red">*</span></p></li>
                <li><input type="text" title="mobile-number" id="mobile_no" name="mobile_no"  class="form-control mb-md"  readonly value="${consultInfo.mobile_no}"> 
                </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Landline Number <span class="red">*</span></p></li>
                <li><input type="text" title="landline-number" id="landline_no" name="landline_no" class="form-control mb-md" readonly value="${consultInfo.landline_no}"> 
              </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Email Id<span class="red">*</span></p></li>
                <li><input type="text" title="email-id" id="emailId" name="emailId" class="form-control mb-md" readonly value="${consultInfo.emailId}"> 
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Address<span class="red">*</span></p></li>
                <li><textarea title="address" id="address" name="address" class="form-control mb-md" readonly >${consultInfo.address} </textarea>
                </li>
               </ul> 
                
            </fieldset>
            
           <fieldset>
            <div class="fs-list-full"> 
                <h2 class="fs-title">Bank Details of Firm</h2>
                
                <ul class="fs-list-details">
                <li><p>Bank <span class="red">*</span></p></li>
                <li><input type="text" title="bank" id="bank" name="bank_name" class="form-control mb-md" readonly value="${consultInfo.bank_name}"> 
                </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Branch <span class="red">*</span></p></li>
                <li><input type="text" title="branch" id="branch" name="branch" class="form-control mb-md" readonly value="${consultInfo.branch}">
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>Account Type<span class="red">*</span></p></li>
                <li><input type="text" title="account-type" id="account_type" name="account_type" class="form-control mb-md" readonly value="${consultInfo.account_type}">
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>A/c Number<span class="red">*</span></p></li>
                <li><input type="text" title="account-number" id="account_number" name="account_number" class="form-control mb-md" readonly value="${consultInfo.account_number}">
               </li>
               </ul>
               
               <ul class="fs-list-details">
                <li><p>IFSC Code<span class="red">*</span></p></li>
                <li><input type="text" title="ifsc-code" id="ifsc_code" name="ifsc_code" class="form-control mb-md" readonly value="${consultInfo.ifsc_code}">
               </li>
               </ul>
                
                </div>
             </fieldset> 
          <div class="row">
          <div class="col-sm-6 form-group"><a href="#" onclick="goBack()" class="btn btn-info ">Back</a></div>
          <div class="col-sm-6 form-group"><a href="<c:url value="/technicalSanction/view?workId=${consultInfo.work.id}"/>" class="btn btn-info ">Technical Sanction Page</a></div>
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
