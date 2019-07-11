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
<title>SAAP : Online MIS</title>
<c:import url="/WEB-INF/jsp/online-mis-headFiles.jsp" />
</head>
<script>
                        $(document).ready(function() {
                        	
                            $(".createClass").click(function() {

                                $("#work_detailsErr").html("");
                                var count = $("#noOfWorks").val();
                                /*  alert(count);  */
                                 if(count > 5){
                                	 alertify.alert("Number of Works","Max 5 works are Allowed!");
                                	 $("#noOfWorks").val("");
                                 }
                                if (count <= 5) {
                                    $("#createval").val(1);
                                    $("#work_table tr").remove();

                                    var sno = 1;

                                    $('#work_table')
                                        .append(
                                            '<tr>' + ' <th>S.No</th>' + ' <th>Work Detail</th>' + ' <th>Estimated Cost (in Lakhs)</th>' + '</tr>');
                                    for (var i = 1; i <= count; i++) {
                                        $('#work_table')
                                            .append(
                                                '<tr><td><b>' + sno + '<b></td>' + '<td>'
                                                /* + '<input type="text" name="workDetails" id="work_details'+i+'"  onkeyup="return isText(this)" class="form-control mb-md" />' */
                                                + '<input type="text" name="WorkLineItemsList[' + i + '].workDetails" id="work_details' + i + '"  onkeyup="return isText(this)" class="form-control mb-md" />' + '</td>' + '<td>'
                                                /* + '<input type="text" name="cost" id="estimated_cost'+i+'" onkeypress="return isNumber(event)" maxlength="9" class="form-control mb-md" />' */
                                                + '<input type="text" name="WorkLineItemsList[' + i + '].cost" id="estimated_cost' + i + '" onkeypress="return isNumber(event)" maxlength="9" class="form-control mb-md" />' + '</td>' + '</tr>');
                                        sno = sno + 1;
                                    }
                                    $("#work_table_div").toggle();
                                    $("#saveDiv").show();
                                } else {
                                    $("#work_table tr").remove();
                                    $("#createval").val(0);
                                }

                            });
                           
                           
                          var workIdVal=$('#id').val();
                          if(workIdVal == undefined){
                        	 
                          }else{
                           $.ajax({
                          	   url: "<c:url value ='/worksCreation/worklineitems'/>?workId=" + workIdVal,
                               error: function(xhr, status, error) {
                                   alert('Exception occurred:' + error);
                               },
                               success: function(data) {
                                    var dataVal = JSON.parse(data); 
                                $('.createClass').trigger('click');
                                var i = 1;
                                for(j=0;i<= dataVal.length;j++){
                              	 $('#work_details'+i+'').val(dataVal[j].workDetails);
                                 $('#estimated_cost'+i+'').val(dataVal[j].cost);  
                                 i++;
                                } 

                               }
                           });
                          }
                         
                          
                            $(document).on("change", "#district", function() {
                                var selected_value = $(this).val();
                                if ("" === selected_value) {
                                    $('#constituency').find('option').not(':first').remove();
                                    $('#mandal').find('option').not(':first').remove();
                                    $('#village').find('option').not(':first').remove();
                                } else {
                                    $.ajax({
                                        url: "<c:url value ='/worksCreation/constituency'/>?PlaceId=" + selected_value,
                                        error: function(xhr, status, error) {
                                            alert('Exception occurred:' + error);
                                        },
                                        success: function(data) {
                                            var datata = JSON.parse(data);
                                            var constituency_dropdown = $("#constituency");
                                            constituency_dropdown.find('option').not(':first').remove();
                                            $.each(datata, function(index, item) {
                                                constituency_dropdown.append($("<option />").val(item.id).text(item.name));
                                            });

                                        }
                                    });
                                }

                            });

                            $(document).on("change", "#constituency", function() {
                                var selected_value = $(this).val();

                                if ("" === selected_value) {
                                    $('#mandal').find('option').not(':first').remove();
                                    $('#village').find('option').not(':first').remove();
                                } else {
                                    $.ajax({
                                        url: "<c:url value ='/worksCreation/mandal'/>?PlaceId=" + selected_value,
                                        error: function(xhr, status, error) {
                                            alert('Exception occurred:' + error);
                                        },
                                        success: function(data) {
                                            var datata = JSON.parse(data);
                                            var mandal_dropdown = $("#mandal");
                                            mandal_dropdown.find('option').not(':first').remove();
                                            $.each(datata, function(index, item) {
                                                mandal_dropdown.append($("<option />").val(item.id).text(item.name));
                                            });

                                        }
                                    });
                                }

                            });

                            $(document).on("change", "#mandal", function() {
                                var selected_value = $(this).val();
                                if ("" === selected_value) {
                                    $('#village').find('option').not(':first').remove();
                                } else {
                                    $.ajax({
                                        url: "<c:url value ='/worksCreation/village'/>?PlaceId=" + selected_value,
                                        error: function(xhr, status, error) {
                                            alert('Exception occurred:' + error);
                                        },
                                        success: function(data) {
                                            var datata = JSON.parse(data);
                                            var village_dropdown = $("#village");
                                            village_dropdown.find('option').not(':first').remove();
                                            $.each(datata, function(index, item) {
                                                village_dropdown.append($("<option />").val(item.id).text(item.name));
                                            });

                                        }
                                    });
                                }
                            });

                            $(document).on("blur", "#estimated_cost", function() {
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
	<!--  <section id="intro-inner">
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
	<!-- #intro -->

	<main id="main"> <!--==========================
      Contact Us Section
    ============================-->

	<section id="contact" class="section-bg-con">
		<div class="container">
			<%-- <c:if test="${!empty workObject.id}"> --%>
			<jsp:include page="online-mis-tabView.jsp" />
			<%--   </c:if> --%>
			<div class="tab-content">

				<!-- <div class="tab-pane" id="work" role="tabpanel" aria-labelledby="work-tab"> -->
				<div class="tab-pane fade show" id="nav-work" role="tabpanel"
					aria-labelledby="nav-work-tab">
					<div class="row">
						<div class="col-md-12">

							<c:url value="/worksCreation/save" var="createUrl" />
							<%-- <form id="msform"  method="post" action="${createUrl}" modelAttribute="workObject"> --%>

							<form:form id="msform" method="POST" action="${createUrl}"
								modelAttribute="workObject">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />



								<!-- for Spring Security -->
								<c:choose>
									<c:when test="${!empty workObject.id}">
										<form:input type="hidden" path="id" class="form-control"
											id="id" name="id"></form:input>
										<form:input type="hidden" path="workStatus"
											class="form-control" id="workStatus" name="workStatus"></form:input>
									</c:when>
								</c:choose>
								<!-- fieldsets -->
								<fieldset>
									<h2 class="fs-title">Work Creation</h2>
									<!--<h3 class="fs-subtitle">Tell us something about you</h3>-->

									<ul class="fs-list-details">
										<li>
											<p>
												Types of Work <span class="red">*</span>
											</p>
										</li>
										<li><form:select id="typeworkid" path="typeOfWork.id" onchange="hasChanged()">
												<form:option value="">--Select--</form:option>
												<c:forEach items="${typeOfWork}" var="typeOfWork">
													<form:option value="${typeOfWork.id}">${typeOfWork.name}</form:option>
												</c:forEach>
											</form:select> <span id="typeworkErr" class="errors"
											style="color: red; float: right;"></span>
									</ul>

									<ul class="fs-list-details">
										<li>
											<p>
												Nature of work <span class="red">*</span>
											</p>
										</li>
										<li><form:select id="natureOfWork" path="natureOfWork.id" onchange="hasChanged()">
												<form:option value="">--Select--</form:option>
												<c:forEach items="${natureOfWork}" var="natureOfWork">
													<form:option value="${natureOfWork.id}">${natureOfWork.name}</form:option>
												</c:forEach>
											</form:select> <br>
										<span id="natureOfWorkErr" class="errors"
											style="color: red; float: right;"></span></li>
									</ul>

									<ul class="fs-list-details">
										<li>
											<p>
												District <span class="red">*</span>
											</p>
										</li>
										<li><form:select id="district" path="district.id">
												<form:option value="">--Select--</form:option>
												<c:forEach items="${districts}" var="district">
													<form:option value="${district.id}">${district.name}</form:option>
												</c:forEach>
											</form:select> <br>
										<span id="districtErr" class="errors"
											style="color: red; float: right;"></span></li>
									</ul>

									<ul class="fs-list-details">
										<li>
											<p>
												Constituency <span class="red">*</span>
											</p>
										</li>
										<li><form:select id="constituency" path="constituency.id">
												<form:option value="">--Select--</form:option>
												<c:if test="${workObject.id != null}">
													<c:forEach items="${constituency}" var="constituency">
														<form:option value="${constituency.id}">${constituency.name}</form:option>
													</c:forEach>
												</c:if>
											</form:select> <br>
										<span id="constituencyErr" class="errors"
											style="color: red; float: right;"></span></li>
									</ul>

									<ul class="fs-list-details">
										<li>
											<p>
												Mandal <span class="red">*</span>
											</p>
										</li>
										<li><form:select id="mandal" path="mandal.id">
												<form:option value="">--Select--</form:option>
												<c:if test="${workObject.id != null}">
													<c:forEach items="${mandal}" var="mandal">
														<form:option value="${mandal.id}">${mandal.name}</form:option>
													</c:forEach>
												</c:if>
											</form:select> <span id="mandalErr" class="errors"
											style="color: red; float: right;"></span></li>
									</ul>

									<ul class="fs-list-details">
										<li>
											<p>
												Village <span class="red">*</span>
											</p>
										</li>
										<li><form:select id="village" path="village.id">
												<form:option value="">--Select--</form:option>
												<c:if test="${workObject.id != null}">
													<c:forEach items="${village}" var="village">
														<form:option value="${village.id}">${village.name}</form:option>
													</c:forEach>
												</c:if>
											</form:select> <span id="villageErr" class="errors"
											style="color: red; float: right;"></span></li>
									</ul>

									<ul class="fs-list-details">
										<li>
											<p>
												Location <span class="red">*</span>
											</p>
										</li>
										<li><form:input type="text" id="location"
												placeholder='Location' path="location" /> <br>
										<span id="locationErr" class="errors"
											style="color: red; float: right;"></span></li>
									</ul>

									<ul class="fs-list-details">
										<li>
											<p>
												Work Number <span class="red">*</span>
											</p>
										</li>
										<li><form:input type="text" id="workNo" path="workNo"
												placeholder="Work Number" /> <br>
										<span id="workNoErr" class="errors"
											style="color: red; float: right;"></span></li>
									</ul>

									<ul class="fs-list-details fs-list-full">
										<li>
											<p>
												No. of Works <span class="red">*</span>
											</p>
										</li>
										<li class="work-space"><form:input type="text"
												id="noOfWorks" path="noOfWorks" placeholder="No. of Works" />
											<span id="noOfWorksErr" class="errors"
											style="color: red; float: center;"></span> <input
											type="button" name="Create" id="Create" value="Create"
											class="create-button createClass"></li>
									</ul>

									<span id="work_detailsErr" class="errors"
										style="color: red; float: center;"></span>
									<div id="work_table_div">
										<table id="work_table"
											class=" table table-bordered  table-striped mb-none table_head animated fadeInUp">
											
										</table>
									</div>
									<!-- <input type="text" id="test"/> -->
									
									<c:if test="${workObject.id==null}">
										<div id="saveDiv" style="display: none">
											<input type="submit" id="submit" name="submit"
												class="next action-button float-right"
												value="Save and Continue" />
										</div>
									</c:if>
									<c:if test="${workObject.id!=null}">
										<input type="submit" id="submit" name="submit"
											class="next action-button float-right"
											value="Update and Continue" />
									</c:if>
									<!-- name="next" -->
								</fieldset>
								<input type="hidden" id="createval" name="createval" value="0">
								<%-- </form> --%>
							</form:form>
						</div>
					</div>
					<!-- /.MultiStep Form -->
				</div>
			</div>
		</div>
	</section>
	<!-- #contact --> </main>

	<!--=== Footer ====-->
	<jsp:include page="online-mis-footer.jsp" />

	<script type="text/javascript">
	
	$(document).ready(function() {
        $('#nav-work-tab').addClass('active');
        $('#nav-work').addClass('active');
        
    });
	
                            $("#workNo").on('input', function() {
                                $(this).val($(this).val().replace(/[^a-z0-9]/gi, ''));
                            })
                            $('#location').on('input', function() {
                                $(this).val($(this).val().replace(/[^a-z]/gi, ''));
                            });

                            function isText(txtVal) {
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
                            $("#noOfWorks").on('input', function() {
                                this.value = this.value.match(/^\d+/);
                            });

                            $('#Create').on('click', function() {
                                var noofworks = $("#noOfWorks").val();
                                if (noofworks == "" || noofworks == null) {
                                    $("#noOfWorksErr").html("Please Enter No. of Works");
                                    $("#noOfWorks").focus();
                                    return false;
                                } else {
                                    $("#noOfWorksErr").html("");
                                }

                                if (noofworks <= 0) {
                                    $("#work_details").val("");
                                    $("#estimated_cost").val("");
                                    $("#work_detailsErr").html("");
                                }
                            })

                            $("#submit").click(function() {
                            	
                            	 $.ajax({
             	    		        type: "POST",
             	    		        url : "<c:url value="/worksCreation/save"/>",
             	    		        data: isChange,
             	    		        processData: false,
             	    		        contentType: false,
             	    		        cache: false,
             	    		        timeout: 600000,
             	    		        success: function (data) {
             	    		        	if(data == true){
                 							  alert(data);
                 					            }
             						 /*  else{
             								alert("Unable to upload File");
             							} */
             	    		        } 
             	    		    });

                                if ($("#typeworkid option:selected").val() == "") {
                                    $("#typeworkErr").text("Select Types of Work");
                                    $("#typeworkid").focus();
                                    return false;
                                } else {
                                    $("#typeworkErr").text("");
                                }

                                if ($("#natureOfWork option:selected").val() == "") {
                                    $("#natureOfWorkErr").text("Select Nature of work");
                                    $("#natureOfWork").focus();
                                    return false;
                                } else {
                                    $("#natureOfWorkErr").text("");
                                }

                                if ($("#district option:selected").val() == "") {
                                    $("#districtErr").text("Select District");
                                    $("#district").focus();
                                    return false;
                                } else {
                                    $("#districtErr").text("");
                                }

                                if ($("#constituency option:selected").val() == "") {
                                    $("#constituencyErr").text("Select Constituency");
                                    $("#constituency").focus();
                                    return false;
                                } else {
                                    $("#constituencyErr").text("");
                                }

                                if ($("#mandal option:selected").val() == "") {
                                    $("#mandalErr").text("Select Mandal");
                                    $("#mandal").focus();
                                    return false;
                                } else {
                                    $("#mandalErr").text("");
                                }

                                if ($("#village option:selected").val() == "") {
                                    $("#villageErr").text("Select Village ");
                                    $("#village").focus();
                                    return false;
                                } else {
                                    $("#villageErr").text("");
                                }

                                var location = $("#location").val();
                                if (location == "" || location == null) {
                                    $("#locationErr").html("Please Enter location");
                                    $("#location").focus();
                                    return false;
                                } else {
                                    $("#locationErr").html("");
                                }

                                var workNo = $("#workNo").val();
                                if (workNo == "" || workNo == null) {
                                    $("#workNoErr").html("Please Enter Work Number");
                                    $("#workNo").focus();
                                    return false;
                                } else {
                                    $("#workNoErr").html("");
                                }

                                var noofworks = $("#noOfWorks").val();
                                if (noofworks == "" || noofworks == null) {
                                    $("#noOfWorksErr").html("Please Enter No. of Works");
                                    $("#noOfWorks").focus();
                                    return false;
                                } else {
                                    $("#noOfWorksErr").html("");
                                }

                                if (noofworks >= 1) {
                                    if ($("#createval").val() == 1) {
                                        for (var i = 1; i <= noofworks; i++) {
                                            if ($('#work_details' + i + '').val() == "" || $('#work_details' + i + '').val() == null) {
                                                $("#work_detailsErr").html("Please Enter Work Details");
                                                $('#work_details' + i + '').focus();
                                                return false;
                                            }
                                            if ($('#estimated_cost' + i + '').val() == "" || $('#estimated_cost' + i + '').val() == null) {
                                                $("#work_detailsErr").html("Please Enter Estimated Cost");
                                                $('#estimated_cost' + i + '').focus();
                                                return false;
                                            }
                                        }
                                    } else {
                                        $("#work_detailsErr").html("Create Work Details");
                                        return false;
                                    }
                                } else {
                                    $("#work_detailsErr").html("");
                                }

                            });

                            
                        </script>
</body>

</html>