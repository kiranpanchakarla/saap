<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : General Information</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
</head>

<body>

<!--=== Header ====-->
<jsp:include page="online-mis-header.jsp" />

<!--==========================
    Intro Section
  ============================-->
<section id="intro-inner">
  <div class="page-header">
    <section id="page-title" class="parralax">
      <div class="container rel">
        <div class="row">
          <div class="col-md-12">
            <div class="text-center">
              <h2 class="section-title">General Information</h2>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</section>
<!-- #intro -->

<main id="main"> 
  
   <!--==========================
      Contact Us Section
    ============================-->
  
  <section id="contact" class="section-bg-con">
    <div class="container">
    
    <div class="row">
    <div class="col-md-12">
       <c:url value="/landDetails/generalInfo" var="createUrl" />
      <form id="msform" method="GET" action="${createUrl}" >

           <input type="hidden" name="${_csrf.parameterName}"
          value="${_csrf.token}" />
           
            
            <!-- fieldsets -->
            <fieldset>
                <h2 class="fs-title">Work Creation</h2>
                <!--<h3 class="fs-subtitle">Tell us something about you</h3>-->  
                
                <ul class="fs-list-details">
                <li><p>Types of Work <span class="red">*</span></p></li>
                <li><!-- <input type="text" title="New" id="typeworkid" name="typeworkid" class="form-control mb-md" readonly value="New">  -->
                <input type="text" title="New" id="typeworkid" name="typeOfWork" class="form-control mb-md" readonly value="${workInfo.typeOfWork.name}">
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
                <li><input type="text" title="1" name="work-number" class="form-control mb-md" readonly value="${generalInfo.works.workNo}"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>No. of Works <span class="red">*</span></p></li>
                <li><input type="text" title="1" name="no-of-work" class="form-control mb-md" readonly  value="${generalInfo.works.noOfWorks}"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Work Detail <span class="red">*</span></p></li>
                <li><input type="text" title="SAAP" name="s.no" class="form-control mb-md" readonly 
               value="${generalInfo.works.workDetails}"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Estimated Cost <span class="red">*</span></p></li>
                <li><input type="text" title="SAAP" name="work-details-new" class="form-control mb-md" readonly 
               value="${generalInfo.works.cost}"></li>
                </ul>
                
               
                
            </fieldset>
            
            
            <fieldset>
             <div class="fs-list-full"> 
                <h2 class="fs-title">Administrative Section</h2>
                <ul class="fs-list-details">
                <li><p>Name of Work <span class="red">*</span></p></li>
                <li><input type="text" title="SAAP" name="work-name" class="form-control mb-md" readonly 
                value="${generalInfo.administrativeesction.workName}">
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Work Number <span class="red">*</span></p></li>
                <li><input type="text" title="1" name="word-number" class="form-control mb-md" readonly 
                value="${generalInfo.administrativeesction.workNumber}"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>AS Sanctioned Details <span class="red">*</span></p></li>
                <li><input type="text" title="1" name="detail-sanctioned" class="form-control mb-md" readonly 
                value="${generalInfo.administrativeesction.sanctionedDetails}"></li>
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
                <li> <img  src="${filePath}"    width="100" height="70"/> 
               </li> 
              
               
           
				
			</td>
		</tr>
	</table>

</body>
</html>
                </ul>
                
                
                </div>
                
               
            </fieldset>
            
            <fieldset>
            <div class="fs-list-full"> 
                <h2 class="fs-title">Linking with Line Department</h2>
                
                <ul class="fs-list-details">
                <li><p>Name of Department <span class="red">*</span></p></li>
                <li><input type="text" title="department" name="department-name" class="form-control mb-md" readonly value="${generalInfo.departmentlinkingine.departmentName}">
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Nature of work <span class="red">*</span></p></li>
                <li><input type="text" title="work" name="dept-work-nature" class="form-control mb-md" readonly value="${generalInfo.departmentlinkingine.workNature}">
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Circle <span class="red">*</span></p></li>
                <li><input type="text" title="circle" name="circle-name" class="form-control mb-md" readonly value="${generalInfo.departmentlinkingine.circle}">
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
                <li><input type="text" title="Section officer" name="sectionId" class="form-control mb-md" readonly value="${generalInfo.departmentlinkingine.sectionOfficerName}">
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Mobile No <span class="red">*</span></p></li>
                <li><input type="text" title="7689765432" name="mobileNo" class="form-control mb-md" readonly value="${generalInfo.departmentlinkingine.mobileNo}">
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Email Id <span class="red">*</span></p></li>
                <li><input type="text" title="a@gmail.com" name="emailId" class="form-control mb-md" readonly value="${generalInfo.departmentlinkingine.email}"></li>
                </ul>
                
                
                </div>
                
            </fieldset>
            
            <fieldset>
            <div class="fs-list-full"> 
                <h2 class="fs-title">Land details</h2>
                
                <ul class="fs-list-details">
                <li><p>Work <span class="red">*</span></p></li>
                <li><input type="text" title="NTR KVK (Constituency KVKs)" name="activityName" class="form-control mb-md" readonly value="NTR KVK (Constituency KVKs)"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Work Number <span class="red">*</span></p></li>
                <li><input type="text" name="packageNumber" title="1" class="form-control mb-md" readonly value="${generalInfo.administrativeesction.workNumber}"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Name of the Work <span class="red">*</span></p></li>
                <li><input type="text" title="Land work" name="fullLand" class="form-control mb-md" readonly value="${generalInfo.administrativeesction.workName}"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Land Extend <span class="red">*</span></p></li>
                <li><input type="text" title="Land" name="fullRapFile" class="form-control mb-md" readonly value="${generalInfo.landdetails.landExtend}"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Survey Number <span class="red">*</span></p></li>
                <li><input type="text" title="survey" name="SurveyFile" class="form-control mb-md" readonly 
                value="${generalInfo.landdetails.surveyNo}"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Field Mesurment Book Details <span class="red">*</span></p></li>
                <li><input type="text" title="book" name="bookDetails" class="form-control mb-md" readonly 
                value="${generalInfo.landdetails.bookDetails}"></li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Type Of Land  <span class="red">*</span></p></li>
                <li><input type="text" title="Government" name="activityId" class="form-control mb-md" readonly 
                value="${landinfo.typeOfLand.name}">
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Upload Land Details Document(pdf/jpg/png) <span class="red">*</span></p></li>
                <li><img src="${landfilePath}"  width="100" height="70"/></li>
                </ul>
                
                </div>
                <input type="submit" name="next" class="next action-button" value="Save and Continue">
                
            </fieldset>
            
        </form>
        
    </div>
</div>
<!-- /.MultiStep Form -->
    

    </div>
  </section>

 
  
    
  <!-- #contact --> 
  
</main>

<!--=== Footer ====-->
<jsp:include page="online-mis-footer.jsp" />

</body>
</html>
