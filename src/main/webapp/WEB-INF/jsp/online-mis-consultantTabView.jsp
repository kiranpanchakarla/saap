<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div id="nav-tab">
		<ul class="nav nav-tabs nav-fill" role="tablist">
		<li class="nav-item"><a class="nav-item nav-link" id="nav-work-tab"
		data-toggle="tab" href="" role="tab"
		aria-controls="nav-work" aria-selected="true">Work Info</a></li>
			<li class="nav-item"><a class="nav-item nav-link"
				id="nav-consultant-tab" data-toggle="tab" href="" role="tab"
				aria-controls="nav-consultant" aria-selected="true">Consultant
					Info</a></li>

			<li class="nav-item"><a class="nav-item nav-link"
				disabled="disabled" id="nav-survey-tab" data-toggle="tab" href=""
				role="tab" aria-controls="nav-survey" aria-selected="false">Land
					Survey</a></li>

			<li class="nav-item"><a class="nav-item nav-link"
				id="nav-layouts-tab" data-toggle="tab" href="" role="tab"
				aria-controls="nav-layouts" aria-selected="false">Layouts</a></li>

			<li class="nav-item"><a class="nav-item nav-link"
				id="nav-investigation-tab" data-toggle="tab" href="" role="tab"
				aria-controls="nav-investigation" aria-selected="false">Investigation</a></li>

			<li class="nav-item"><a class="nav-item nav-link"
				id="nav-approvals-tab" data-toggle="tab" href="" role="tab"
				aria-controls="nav-approvals" aria-selected="false">Approvals</a></li>
		</ul>
	</div>




</body>
<script>
	$(document).ready(function() {

		$("#nav-work-tab").click(function() {
			<c:url value="/consultant/view?workId=${workObject.id}" var="homeUrl" />
		    
		    if(onChange == true){
		    	alertify
				.confirm()
				.setting(
						{
							'labels' : {
								'ok' : 'Yes',
								'cancel' : 'No'
							},
							'message' : "Are you sure. Want to Continue!"

						})
				.set('onok', function() {
					window.location.href = "${homeUrl}";
				})
				.setHeader(
						'<h4 class="mb-0"> Page Navigation </h4> ')
				.set('defaultFocus', 'cancel').show('true',
						'danger-alertjs-model');
		    }else{
		    	window.location.href = "${homeUrl}";
		    }
		});
		
		$("#nav-consultant-tab").click(function() {
		    <c:url value="/ConsultantInfo/edit/${workObject.id}" var="homeUrl" />
		    	if(onChange == true){
			    	alertify
					.confirm()
					.setting(
							{
								'labels' : {
									'ok' : 'Yes',
									'cancel' : 'No'
								},
								'message' : "Are you sure. Want to Continue!"

							})
					.set('onok', function() {
						window.location.href = "${homeUrl}";
					})
					.setHeader(
							'<h4 class="mb-0"> Page Navigation </h4> ')
					.set('defaultFocus', 'cancel').show('true',
							'danger-alertjs-model');
			    }else{
			    	window.location.href = "${homeUrl}";
			    }
		});
		
		$("#nav-survey-tab").click(function() {
		    <c:url value="/landSurveyDetails/edit/${workObject.id}" var="homeUrl" />
		    	if(onChange == true){
			    	alertify
					.confirm()
					.setting(
							{
								'labels' : {
									'ok' : 'Yes',
									'cancel' : 'No'
								},
								'message' : "Are you sure. Want to Continue!"

							})
					.set('onok', function() {
						window.location.href = "${homeUrl}";
					})
					.setHeader(
							'<h4 class="mb-0"> Page Navigation </h4> ')
					.set('defaultFocus', 'cancel').show('true',
							'danger-alertjs-model');
			    }else{
			    	window.location.href = "${homeUrl}";
			    }
		});
		
		$("#nav-layouts-tab").click(function() {
		    <c:url value="/preliminaryPreparationLayout/edit/${workObject.id}" var="homeUrl" />
		    	if(onChange == true){
			    	alertify
					.confirm()
					.setting(
							{
								'labels' : {
									'ok' : 'Yes',
									'cancel' : 'No'
								},
								'message' : "Are you sure. Want to Continue!"

							})
					.set('onok', function() {
						window.location.href = "${homeUrl}";
					})
					.setHeader(
							'<h4 class="mb-0"> Page Navigation </h4> ')
					.set('defaultFocus', 'cancel').show('true',
							'danger-alertjs-model');
			    }else{
			    	window.location.href = "${homeUrl}";
			    }
		});
		
		$("#nav-investigation-tab").click(function() {
		    <c:url value="/geotechnicalInvestigation/edit/${workObject.id}" var="homeUrl" />
		    	if(onChange == true){
			    	alertify
					.confirm()
					.setting(
							{
								'labels' : {
									'ok' : 'Yes',
									'cancel' : 'No'
								},
								'message' : "Are you sure. Want to Continue!"

							})
					.set('onok', function() {
						window.location.href = "${homeUrl}";
					})
					.setHeader(
							'<h4 class="mb-0"> Page Navigation </h4> ')
					.set('defaultFocus', 'cancel').show('true',
							'danger-alertjs-model');
			    }else{
			    	window.location.href = "${homeUrl}";
			    }
		});
		
		$("#nav-approvals-tab").click(function() {
		    <c:url value="/preliminaryDrawings/view/${workObject.id}" var="homeUrl" />
		    window.location.href = "${homeUrl}";
		});
		
		<c:if test="${consultantInfoObject.id == null}">
		 
		$("#nav-consultant-tab").not('.active').addClass('disabled');
		$("#nav-consultant-tab").not('.active').find('a').removeAttr("data-toggle");
		$("#nav-consultant-tab").css({"pointer-events":"none"}); 
		//$("#nav-consultant-tab").css({"background":"#0e4c2f"});
		
	 	$("#nav-survey-tab").not('.active').addClass('disabled');
	    $("#nav-survey-tab").not('.active').find('a').removeAttr("data-toggle");
	    $("#nav-survey-tab").css({"pointer-events":"none"});
	    
	    $("#nav-layouts-tab").not('.active').addClass('disabled');
	    $("#nav-layouts-tab").not('.active').find('a').removeAttr("data-toggle");
	    $("#nav-layouts-tab").css({"pointer-events":"none"});
	    
	    $("#nav-investigation-tab").not('.active').addClass('disabled');
	    $("#nav-investigation-tab").not('.active').find('a').removeAttr("data-toggle");
	    $("#nav-investigation-tab").css({"pointer-events":"none"});

		$("#nav-approvals-tab").not('.active').addClass('disabled');
		$("#nav-approvals-tab").not('.active').find('a').removeAttr("data-toggle");
		$("#nav-approvals-tab").css({"pointer-events":"none"});
		 
		</c:if>
		
		<c:if test="${landSurvey.id == null}">
		 
	    $("#nav-layouts-tab").not('.active').addClass('disabled');
	    $("#nav-layouts-tab").not('.active').find('a').removeAttr("data-toggle");
	    $("#nav-layouts-tab").css({"pointer-events":"none"});
	    
	    $("#nav-investigation-tab").not('.active').addClass('disabled');
	    $("#nav-investigation-tab").not('.active').find('a').removeAttr("data-toggle");
	    $("#nav-investigation-tab").css({"pointer-events":"none"});

		$("#nav-approvals-tab").not('.active').addClass('disabled');
		$("#nav-approvals-tab").not('.active').find('a').removeAttr("data-toggle");
		$("#nav-approvals-tab").css({"pointer-events":"none"});
		 
		</c:if>
		
		<c:if test="${consltInfo.id == null}">
		
		$("#nav-layouts-tab").not('.active').addClass('disabled');
	    $("#nav-layouts-tab").not('.active').find('a').removeAttr("data-toggle");
	    $("#nav-layouts-tab").css({"pointer-events":"none"});
		 
	    $("#nav-investigation-tab").not('.active').addClass('disabled');
	    $("#nav-investigation-tab").not('.active').find('a').removeAttr("data-toggle");
	    $("#nav-investigation-tab").css({"pointer-events":"none"});

		$("#nav-*-tab").not('.active').addClass('disabled');
		$("#nav-approvals-tab").not('.active').find('a').removeAttr("data-toggle");
		$("#nav-approvals-tab").css({"pointer-events":"none"});
		 
		</c:if>
		
		<c:if test="${investigation.id == null}">
		
		$("#nav-investigation-tab").not('.active').addClass('disabled');
	    $("#nav-investigation-tab").not('.active').find('a').removeAttr("data-toggle");
	    $("#nav-investigation-tab").css({"pointer-events":"none"});
		
		$("#nav-approvals-tab").not('.active').addClass('disabled');
		$("#nav-approvals-tab").not('.active').find('a').removeAttr("data-toggle");
		$("#nav-approvals-tab").css({"pointer-events":"none"});
		 
		</c:if>
	});
</script>
</html>