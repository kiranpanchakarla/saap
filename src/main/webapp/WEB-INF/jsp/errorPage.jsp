<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Error</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
</head>

<body>
<!--=== Header ====-->
<jsp:include page="online-mis-header.jsp" />



<!--==========================
    Intro Section
  ============================-->
<!-- <section id="intro-inner">
  <div class="page-header">
    <section id="page-title" class="parralax">
      <div class="container rel">
        <div class="row">
          <div class="col-md-12">
            <div class="text-center">
              <h2 class="section-title">Error</h2>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</section> -->
<!-- #intro -->

<main id="main"> 
  
   <!--==========================
      Contact Us Section
    ============================-->

	<section id="contact-error" class="section-bg-con wow fadeInUp"
		style="visibility: visible; animation-name: fadeInUp;">
		<div class="container">
			<div class="row">
				<div class="wrapper fadeInDown">
					<div id="formContent" style="max-width: 900px !important;">
						<!-- Tabs Titles -->

						<!-- Icon -->

						<div class="fadeIn first">
							<h5 class="highlight text-center text-uppercase">Message :
								${errorMsg}</h5>
							<h5 class="highlight text-center text-uppercase">Contact :
								help.manuh@gmail.com</h5>
						</div>

					</div>
				</div>

			</div>
		</div>
	</section>

	<!-- #contact -->  
  
</main>

<!--=== Footer ====-->
<jsp:include page="online-mis-footer.jsp" />


</body>
</html>
