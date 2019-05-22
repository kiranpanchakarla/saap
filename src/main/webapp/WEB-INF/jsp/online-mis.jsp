<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SAAP : Online MIS</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
</head>
<script>
$(document).ready(function(){
	  $(".createClass").click(function(){
		 	 var count = $("#noOfWorks").val(); 
		 	//alert(count);
		 	 if( count > 0){
			 	 
					$("#work_table tr").remove();
					
					var sno = 1;
					
					 $('#work_table')
			            .append(
			            '<tr>'
			            + ' <th>S.No</th>'
			            + ' <th>Work Detail</th>'
			            + ' <th>Estimated Cost (in Lakhs)</th>'
			            + '</tr>');
					
					for(var i=1;i<=count;i++){
						$('#work_table')
			            .append(
			            '<tr><td><b>'+ sno +'<b></td>'
			            + '<td>'
			    		+ '<input type="text" name="workDetails" id="work_details"  class="form-control mb-md" />'
			    		+ '</td>'
			    		+ '<td>'
			    		+ '<input type="number" name="cost" id="estimated_cost"  class="form-control mb-md" />'
			    		+ '</td>'
			            +'</tr>');
						sno=sno+1;
					}
					$("#work_table_div").toggle();

		 	 }else{
		 		$("#work_table tr").remove();
		 	 }
	    
	  });
	});

</script>

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
              <h2 class="section-title">Work Creation</h2>
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
        <c:url value="/worksCreation/save" var="createUrl" />
        <form id="msform"  method="post" action="${createUrl}" modelAttribute="workObject">
           
             <input type="hidden" name="${_csrf.parameterName}"
            value="${_csrf.token}" /> <!-- for Spring Security -->
            
            <!-- fieldsets -->
            <fieldset>
                <h2 class="fs-title">Work Creation</h2>
                <!--<h3 class="fs-subtitle">Tell us something about you</h3>-->  
                
                <ul class="fs-list-details">
                <li><p>Types of Work <span class="red">*</span></p></li>
                <li><select id="typeOfWork" name="typeOfWork" class="required">
                <option value="" selected="">--Types of Work --</option> 
                <option value="New">New</option>
                <option value="upgrade">Upgrade</option>
                <option value="repair">Repair</option>
                </select> 
                	<br><span id="typeworkErr" class="errors" style="color:red;float:right;"></span>
                </ul>
                
                
                <ul class="fs-list-details">
                <li><p>Nature of work <span class="red">*</span></p></li>
                <li><select id="natureOfWork" name="natureOfWork" >
                <option value="" selected="">--select work--</option>
             	 <option value="NTR KVK (Constituency KVKs)">NTR KVK (Constituency KVKs)</option>
             	 <option value="NTR MKVKs">NTR MKVKs</option>
             	 <option value="Modernization Works">Modernization Works</option>
             	 <option value="Regional Academics">Regional Academics</option>
             	 <option value="District Level Sports Complex">District Level Sports Complex</option>
             	 <option value="Swimming Pools">Swimming Pools</option>
             	 <option value="400 mtrs Synthetic Athletic Track">400 mtrs Synthetic Athletic Track</option>
             	 <option value="Water Sports Academies">Water Sports Academies</option>
             	 <option value="Model Sport School at Vizzy Stadium">Model Sport School at Vizzy Stadium</option>
             	 <option value="Twin Synthetic Tennis Courts">Twin Synthetic Tennis Courts</option>
             	 <option value="Wooden Flooring">Wooden Flooring</option>
             	 <option value="Repairs to Swimming Pools">Repairs to Swimming Pools</option>
             	 <option value="Shopping Complex">Shopping Complex</option>
               </select>
               		<br><span id="natureOfWorkErr" class="errors" style="color:red;float:right;"></span>
               </li>
                </ul>
                
                <!-- <ul class="fs-list-details">
                <li><p>Nature of work <span class="red">*</span></p></li>
                <li><select id="worknatureid" name="natureOfWork" >
                <option value="" selected="">--select work--</option>
             	 <option value="work1">NTR KVK (Constituency KVKs)</option>
             	 <option value="work2">NTR MKVKs</option>
             	 <option value="work3">Modernization Works</option>
             	 <option value="work4">Regional Academics</option>
             	 <option value="work5">District Level Sports Complex</option>
             	 <option value="work6">Swimming Pools</option>
             	 <option value="work7">400 mtrs Synthetic Athletic Track</option>
             	 <option value="work8">Water Sports Academies</option>
             	 <option value="work9">Model Sport School at Vizzy Stadium</option>
             	 <option value="work10">Twin Synthetic Tennis Courts</option>
             	 <option value="work11">Wooden Flooring</option>
             	 <option value="work12">Repairs to Swimming Pools</option>
             	 <option value="work13">Shopping Complex</option>
               </select>
               </li>
                </ul> -->
                
                <ul class="fs-list-details">
                <li><p>District <span class="red">*</span></p></li>
                <li><select id="district" name="district" >
                <option value="" selected="">--select district--</option>
                 <c:forEach  var="districts" items="${districts}">
         			<option value="${districts.name}">${districts.name}</option>
      			</c:forEach>
               </select>
               <br><span id="districtErr" class="errors" style="color:red;float:right;"></span>
               </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Constituency <span class="red">*</span></p></li>
                <li>                
                <select id="constituency" name="constituency">
                  <option value="" selected="" disabled="">--select --</option>
                   <c:forEach  var="constituency" items="${allConstituencs}">
         			<option value="${constituency.name}">${constituency.name}</option>
      				</c:forEach>
              </select>
              <br><span id="constituencyErr" class="errors" style="color:red;float:right;"></span>
            </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Mandal <span class="red">*</span></p></li>
                <li>
                <select id="mandal" name="mandal" class="form-control mb-md">
              <option value="" selected="" disabled="">--select Mandal--</option>
                <c:forEach  var="mandals" items="${allMandals}">
         		<option value="${mandals.name}">${mandals.name}</option>
      			</c:forEach>
            </select>
            <span id="mandalErr" class="errors" style="color:red;float:right;"></span>
            </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Village <span class="red">*</span></p></li>
                <li><select id="village" class="form-control mb-md" name="village">
              <option value="" selected="" disabled="">--select--</option>
                <c:forEach  var="village" items="${allVillages}">
         <option value="${village.name}">${village.name}</option>
      </c:forEach> 
            
            </select>
            <span id="villageErr" class="errors" style="color:red;float:right;"></span>
            </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Location <span class="red">*</span></p></li>
                <li><input type="text" id="location" name="location" placeholder="Location"/>
                	<br><span id="locationErr" class="errors" style="color:red;float:right;"></span>  	
                </li>
                </ul>
                
                <ul class="fs-list-details">
                <li><p>Work Number <span class="red">*</span></p></li>
                <li><input type="text" id="workNo" name="workNo" placeholder="Work Number" >
                	<br><span id="workNoErr" class="errors" style="color:red;float:right;"></span>  
                </li>
                </ul>
                
                <ul class="fs-list-details fs-list-full">
                <li><p>No. of Works <span class="red">*</span></p></li>
                <li class="work-space"><input type="text" id="noOfWorks" name="noOfWorks" placeholder="No. of Works" > 
                <span id="noOfWorksErr" class="errors" style="color:red;float:center;"></span>
                <input type="button" name="Create" id="Create" value="Create" class="create-button createClass" >
                
                </li> 
                </ul>
                 <span id="work_detailsErr" class="errors" style="color:red;float:center;"></span>
            <div id="work_table_div">
	        <table id="work_table" class=" table table-bordered  table-striped mb-none table_head animated fadeInUp">
	           <!--<tbody>
            	<tr>
                  <th>S.No</th> 
            	  <th>Work Detail</th> 
            	  <th>Estimated Cost (in Lakhs)</th>
            	</tr>
            	<!-- <tr>
            	  <td><b>1</b></td>
                  <td><input type="text" class="form-control mb-md" id="s.no" name="s.no" value=""> </td> 
            	  <td><input type="text" class="form-control mb-md" id="work-details-new" maxlength="10" name="work-details-new"></td>
            	</tr> -->
              </tbody>
            </table>
        </div> 
                
                
                <input type="submit" id="submit" name="submit" class="next action-button float-right" value="Save and Continue"/>
                
                <!-- name="next" -->
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

<script type="text/javascript">
$("#estimated_cost").on('input', function () {
    this.value = this.value.match(/^\d+/);
});
	
$("#noOfWorks").on('input', function () {
    this.value = this.value.match(/^\d+/);
});
	  
$('#Create').on('click',function(){
	var noofworks=$("#noOfWorks").val();
    if(noofworks=="" || noofworks==null){
        $("#noOfWorksErr").html("Please Enter No. of Works");
        $("#noOfWorks").focus();
        return false;
    }else{
        $("#noOfWorksErr").html("");
    }
    
    
    if( noofworks <= 0){   	
    	$("#work_details").val("");
    	$("#estimated_cost").val("");
    	 $("#work_detailsErr").html("");
    }
})

 $("#submit").click(function(){
	if( $("#typeOfWork option:selected").val()==""){
		  $("#typeworkErr").text("Select Types of Work");
		  $("#typeOfWork").focus();
		  return false;
	}else{
		$("#typeworkErr").text("");
	}
	
	if( $("#natureOfWork option:selected").val()==""){
		  $("#natureOfWorkErr").text("Select Nature of work");
		  $("#natureOfWork").focus();
		  return false;
	}else{
		$("#natureOfWorkErr").text("");
	}
	
	if( $("#district option:selected").val()==""){
		  $("#districtErr").text("Select District");
		  $("#district").focus();
		  return false;
	}else{
		$("#districtErr").text("");
	}

	if( $("#constituency option:selected").val()==""){
		  $("#constituencyErr").text("Select Constituency");
		  $("#constituency").focus();
		  return false;
	}else{
		$("#constituencyErr").text("");
	}
	
	if( $("#mandal option:selected").val()==""){
		  $("#mandalErr").text("Select Mandal");
		  $("#mandal").focus();
		  return false;
	}else{
		$("#mandalErr").text("");
	}
	
	if( $("#village option:selected").val()==""){
		  $("#villageErr").text("Select Village ");
		  $("#village").focus();
		  return false;
	}else{
		$("#villageErr").text("");
	}

	
	var location=$("#location").val();
    if(location=="" || location==null){
        $("#locationErr").html("Please Enter location");
        $("#location").focus();
        return false;
    }else{
        $("#locationErr").html("");
    }
    
	var workNo=$("#workNo").val();
    if(workNo=="" || workNo==null){
        $("#workNoErr").html("Please Enter Work Number");
        $("#workNo").focus();
        return false;
    }else{
        $("#workNoErr").html("");
    }
    
    var noofworks=$("#noOfWorks").val();
    if(noofworks=="" || noofworks==null){
        $("#noOfWorksErr").html("Please Enter No. of Works");
        $("#noOfWorks").focus();
        return false;
    }else{
        $("#noOfWorksErr").html("");
    }
    
    if( noofworks >= 1){
    	if($("#work_details").val() =="" || $("#work_details").val() ==null){
    		$("#work_detailsErr").html("Create and Enter Work Details");  		
    		$("#work_details").focus();
    		 return false;
    	}
    }else{
    	 $("#work_detailsErr").html("");
    }
})
 
</script>
</body>
</html>
