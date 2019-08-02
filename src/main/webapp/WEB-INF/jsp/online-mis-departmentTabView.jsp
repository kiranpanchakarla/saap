<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	<div id="nav-tab">
		<ul class="nav nav-tabs nav-fill" role="tablist">
		<li class="nav-item"><a class="nav-item nav-link" id="nav-work-tab"
		data-toggle="tab" href="" role="tab"
		aria-controls="nav-work" aria-selected="true">Work Info</a></li>
			<li class="nav-item"><a class="nav-item nav-link"
				id="nav-consultant-tab" data-toggle="tab" href="" role="tab"
				aria-controls="nav-consultant" aria-selected="true">Consultant Info</a></li>

			<li class="nav-item"><a class="nav-item nav-link"
				disabled="disabled" id="nav-process-tab" data-toggle="tab" href=""
				role="tab" aria-controls="nav-process" aria-selected="false">Tender Process</a></li>

			<li class="nav-item"><a class="nav-item nav-link"
				id="nav-evaluation-tab" data-toggle="tab" href="" role="tab"
				aria-controls="nav-evaluation" aria-selected="false">Tender Evaluation</a></li>

			<li class="nav-item"><a class="nav-item nav-link"
				id="nav-loa-tab" data-toggle="tab" href="" role="tab"
				aria-controls="nav-loa" aria-selected="false">LOA</a></li>

		</ul>
	</div>




</body>
<script>
	$(document).ready(function() {

		$("#nav-consultant-tab").click(function() {
			<c:url value="/consultant/consultantInfo" var="homeUrl" />
				window.location.href = "${homeUrl}";
		});
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
		    <c:url value="/consultant/consultantInfo" var="homeUrl" />
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
		
		$("#nav-process-tab").click(function() {
		  <c:url value="/tenderProcess/edit/${workObject.id}" var="homeUrl"></c:url>
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
		
		$("#nav-evaluation-tab").click(function() {
		<c:url value="/tenderEvaluation/edit" var="homeUrl"></c:url>
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
		
		$("#nav-loa-tab").click(function() {
		    <c:url value="/letterOfAcceptance/edit/" var="homeUrl" />
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
		
		 
		
		  <c:if test="${tenderInfo.id == null}">
		 
		$("#nav-process-tab").not('.active').addClass('disabled');
		$("#nav-process-tab").not('.active').find('a').removeAttr("data-toggle");
		$("#nav-process-tab").css({"pointer-events":"none"});
		//$("#nav-consultant-tab").css({"background":"#0e4c2f"});
		
	 	$("#nav-evaluation-tab").not('.active').addClass('disabled');
	    $("#nav-evaluation-tab").not('.active').find('a').removeAttr("data-toggle");
	    $("#nav-evaluation-tab").css({"pointer-events":"none"});
	    
	    $("#nav-loa-tab").not('.active').addClass('disabled');
	    $("#nav-loa-tab").not('.active').find('a').removeAttr("data-toggle");
	    $("#nav-loa-tab").css({"pointer-events":"none"});
	    
	     
		 
		</c:if> 
		
		 <c:if test="${tenderEvaluation.id == null}">
		 
	    $("#nav-evaluation-tab").not('.active').addClass('disabled');
	    $("#nav-evaluation-tab").not('.active').find('a').removeAttr("data-toggle");
	    $("#nav-evaluation-tab").css({"pointer-events":"none"});
	    
	    $("#nav-loa-tab").not('.active').addClass('disabled');
	    $("#nav-loa-tab").not('.active').find('a').removeAttr("data-toggle");
	    $("#nav-loa-tab").css({"pointer-events":"none"});

		 
		 
		</c:if>  
		
		/* <c:if test="${consltInfo.id == null}">
		
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
		 */
		/* <c:if test="${investigation.id == null}">
		
		$("#nav-investigation-tab").not('.active').addClass('disabled');
	    $("#nav-investigation-tab").not('.active').find('a').removeAttr("data-toggle");
	    $("#nav-investigation-tab").css({"pointer-events":"none"});
		
		$("#nav-approvals-tab").not('.active').addClass('disabled');
		$("#nav-approvals-tab").not('.active').find('a').removeAttr("data-toggle");
		$("#nav-approvals-tab").css({"pointer-events":"none"});
		 
		</c:if>  */ 
	});
</script>
</html>