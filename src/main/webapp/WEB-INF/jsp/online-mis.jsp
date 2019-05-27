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
			  $("#work_detailsErr").html("");
			 	 var count = $("#noOfWorks").val(); 
			 	//alert(count);
			 	 if( count > 0){
			 		$("#createval").val(1);
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
				    		+ '<input type="text" name="workDetails" id="work_details'+i+'"  onkeyup="return isText(this)" class="form-control mb-md" />'
				    		+ '</td>'
				    		+ '<td>'
				    		+ '<input type="text" name="cost" id="estimated_cost'+i+'" onkeypress="return isNumber(event)" maxlength="9" class="form-control mb-md" />'
				    		+ '</td>'
				            +'</tr>');
							sno=sno+1;
						}
						$("#work_table_div").toggle();

			 	 }else{
			 		$("#work_table tr").remove();
			 		$("#createval").val(0);
			 	 }
		    
		  });
	  
	  $(document).on("change", "#district", function(){
			var selected_value = $(this).val();
			if(""===selected_value){
			    $('#constituency').find('option').not(':first').remove();								
				$('#mandal').find('option').not(':first').remove();
				$('#village').find('option').not(':first').remove();
			 }
			 else{
	        $.ajax({
						url : "<c:url value ='/constituency'/>?PlaceId="+selected_value,
						error : function(xhr,status, error) {
							alert('Exception occurred:'+ error);
						},
						success : function(data) {
							var datata = JSON.parse(data);
							var constituency_dropdown = $("#constituency");
							constituency_dropdown.find('option').not(':first').remove();
							$.each(datata,function(index, item){
								constituency_dropdown.append(  $("<option />").val(item.id).text(item.name)  );
							});
							
						}
					});
			 }
			
	    });
	  
	  
	  
	  $(document).on("change", "#constituency", function(){
			var selected_value = $(this).val();
			
			if(""===selected_value){
			 	$('#mandal').find('option').not(':first').remove();
				$('#village').find('option').not(':first').remove();
			 }
			 else{
			  $.ajax({
						url : "<c:url value ='/mandal'/>?PlaceId="+selected_value,
						error : function(xhr,status, error) {
							alert('Exception occurred:'+ error);
						},
						success : function(data) {
							var datata = JSON.parse(data);
							var mandal_dropdown = $("#mandal");
							mandal_dropdown.find('option').not(':first').remove();
							$.each(datata,function(index, item){
								mandal_dropdown.append(  $("<option />").val(item.id).text(item.name)  );
							});
							
						}
					});
			 }
			 
	    });
	  
	  $(document).on("change", "#mandal", function(){
			var selected_value = $(this).val();
			if(""===selected_value){
			  $('#village').find('option').not(':first').remove();
			 }
			 else{
			  $.ajax({
						url : "<c:url value ='/village'/>?PlaceId="+selected_value,
						error : function(xhr,status, error) {
							alert('Exception occurred:'+ error);
						},
						success : function(data) {
							var datata = JSON.parse(data);
							var village_dropdown = $("#village");
							village_dropdown.find('option').not(':first').remove();
							$.each(datata,function(index, item){
								village_dropdown.append(  $("<option />").val(item.id).text(item.name)  );
							});
							
						}
					});
			 }
	    });
	  
	  $(document).on("blur", "#estimated_cost", function(){
          this.value = this.value.match(/^\d+/);
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
                 <c:forEach  var="natureOfWork" items="${natureOfWork}">
				         <option value="${natureOfWork.name}">${natureOfWork.name}</option>
				      </c:forEach>
                </select>
               		<br><span id="natureOfWorkErr" class="errors" style="color:red;float:right;"></span>
               </li>
                </ul>
                
                
                
               
                
                <ul class="fs-list-details">
                <li><p>District <span class="red">*</span></p></li>
                <li><select id="district" name="district" >
                <option value="" selected="">--select district--</option>
                  <c:forEach  var="districts" items="${districts}">
                   <option value="${districts.id}">${districts.name}</option>
                 </c:forEach> 
               </select>
               <br><span id="districtErr" class="errors" style="color:red;float:right;"></span>
               </li>
                </ul>
                
            
                
                <ul class="fs-list-details">
                <li><p>Constituency <span class="red">*</span></p></li>
                <li>                
               <select id="constituency" name="constituency">
                <option value="">--select constituency--</option>
                </select>
              <br><span id="constituencyErr" class="errors" style="color:red;float:right;"></span>
            </li>
                </ul>
                
                  
                
                <ul class="fs-list-details">
                <li><p>Mandal <span class="red">*</span></p></li>
                <li>
	                <select id="mandal" name="mandal" class="form-control mb-md">
	                  <option value="" >--select Mandal--</option>
	               </select>
		            <span id="mandalErr" class="errors" style="color:red;float:right;"></span>
		            </li>
		         </ul>
                
                
                
                
                <ul class="fs-list-details">
                <li><p>Village <span class="red">*</span></p></li>
                <li><select id="village" class="form-control mb-md" name="village">
                <option value="" >--select village--</option>
			   </select></li>
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
             <input type="hidden" id="createval" name="createval" value="0">
            
            
            
            
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

$("#workNo").on('input', function() {
	  $(this).val($(this).val().replace(/[^a-z0-9]/gi, ''));
	})	
$('#location').on('input', function() {
	  $(this).val($(this).val().replace(/[^a-z]/gi, ''));
	});

function isText(txtVal){
	txtVal.value = txtVal.value.replace(/[^a-z0-9 ]/gi, '');
}

function isNumber(evt) {
  evt = (evt) ? evt : window.event;
  var charCode = (evt.which) ? evt.which : evt.keyCode;
  if (charCode > 31 && (charCode < 48 || charCode > 57)) {
      return false;
  }
  return true;
}	
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
    	if($("#createval").val() == 1){
        	for(var i=1;i<=noofworks;i++){
            	if($('#work_details'+i+'').val() =="" || $('#work_details'+i+'').val() ==null){
            		$("#work_detailsErr").html("Please Enter Work Details");  		
            		$('#work_details'+i+'').focus();
            		 return false;
            	}
            	if($('#estimated_cost'+i+'').val() =="" || $('#estimated_cost'+i+'').val() ==null){
            		$("#work_detailsErr").html("Please Enter Estimated Cost");  		
            		$('#estimated_cost'+i+'').focus();
            		 return false;
            	}   		
        	}    		
    	}else{
    		$("#work_detailsErr").html("Create Work Details"); 
    		return false;
    	}
    }else{
    	 $("#work_detailsErr").html("");
    }
});
 
</script>
</body>
</html>
