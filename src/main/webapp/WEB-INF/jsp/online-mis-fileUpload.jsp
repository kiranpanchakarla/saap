<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<body>
<script type="text/javascript">

    var attachments = [];
    	    var csrf_tokenName="${_csrf.parameterName}", 
    	    csrf_tokenvalue="${_csrf.token}"
    	    $(document).ready(function(){
                        var maxSize = 10, // MB
    	    			currentSize = 0,
    	    			remainSize = 0,
    	    			currentFileLength=0;
    	    	
    	    	function refreshSpace() {
    	    		$('#totalsize span').text(currentSize.toFixed(2));
    	    		$('#remainsize span').text(remainSize.toFixed(2));
    	    	}

    	   	    	$("#files").change(function(e) {
    	   	    	  var moduleName= $('#moduleName').val();
    	   	    	  var files = e.target.files;
    	   	    	  var filesLength=files.length;
    	   	    	  currentFileLength += filesLength;
    			      if(currentFileLength > 5 ){
    			 	              alertify.alert("File Upload","You are allowed to upload a maximum of 5 files. Thanks!!");
    			 	             currentFileLength=currentFileLength-filesLength;
    			 	              $("#files").val('');
    			 	          } 
    			 	
    		           	for (var i = 0, f; f = files[i]; i++) {
    		           	if (attachments.indexOf(files[i].name) === -1) {
    		    		   if (ParseFile(f) === false) {
    		    				  alertify.alert('not enought space - there\'s only ' + remainSize.toFixed(2) + ' MB left');
    		    				  currentFileLength=currentFileLength-filesLength;
    		    				  $("#files").val('');
    		    				
    		    			}
    		    			attachments.push(files[i].name);
    		           	 }else {
    		           		 alertify.alert(files[i].name + " already Exists");
    		           		currentFileLength=currentFileLength-filesLength;
    		           		 $("#files").val('');
    		              } 
    		    			
    		           	}
    			 	 
    		    			function ParseFile(file) {
    			    			var filename = file.name.replace(/\..+$/, '');
    			    			var filesize = file.size / 1024;
    			    			filesize = (Math.round((filesize / 1024) * 100) / 100);
    			    			var filetype = file.type.split('/').pop().toUpperCase();
    			    			if (filetype == 'PDF' || filetype == 'JPEG' || filetype == 'JPG' || filetype == 'PNG') {
    			    				if (currentSize + filesize >= maxSize) {
    			    					return false;
    			    				}
    			    				currentSize += filesize;
    			    				remainSize = maxSize - currentSize;
    			    				}
    			    			else {
    			    				alertify.alert('Only JPG, PDF n PNG files are allowed to upload.');
    			    				 $("#files").val('');
    			    			}
    			    			document.querySelector("#files").onchange=attachments;
    			    		}
    		    			
    	    		refreshSpace();
    	   	    	
    	    		 
    	    		  var formData = new FormData();
    	    		 formData.append("moduleName",moduleName);
    	    		 for (var i = 0; i < $("#files").get(0).files.length; i++) {
    	    			 formData.append("files",$("#files").get(0).files[i]);
    	    		   } 
    	    		 
    	    		 $.ajax({
    	    		        type: "POST",
    	    		        enctype: 'multipart/form-data',
    	    		        url : "<c:url value="/upload/files"/>",
    	    		        data: formData,
    	    		        processData: false,
    	    		        contentType: false,
    	    		        cache: false,
    	    		        timeout: 600000,
    	    		        headers: { 'X-CSRF-TOKEN': csrf_tokenvalue},
    	    		        success: function (data) {
    	    		        	if(data.length>0){
        							  $.each(data, function(index, item) {
        								  var str = item.path;
        								  var fileName = str.substring(str.lastIndexOf("\\") + 1, str.length);
        								  $("#filedetails").append("<tr data-fileId='" + item.path + "' ><td ><a href="+ contextPath + item.path+">"+fileName+"</td><td >"+item.convertFileSize+"</td><td><a class='delete' id='delete_"+item.id+"' href='#'><i class=\"glyphicon glyphicon-trash left\"></i></td></tr>");
        								 }); 
        							   currentFileLength=$("#filedetails tr").length;
        					            }
    						 /*  else{
    								alert("Unable to upload File");
    							} */
    	    		        } 
    	    		    });
    	    		
    	    	});
    	   	  //delete  	
    			$("#filedetails").on('click', '.delete', function(e) {
    				var $parent = $(this).closest('tr'),fileID = $parent.attr('data-fileId');
    				var id = this.id;
    				alertify.confirm(' Are you Sure, this file will be deleted permanently! ',function(e) { 
    				var split_id = id.split('_');
    				var uploadFileId = split_id[1];
    			    var totalFileLength=$("#filedetails tr").length;
    				currentFileLength =totalFileLength-1; 
    			    var formData = new FormData();
    				formData.append("uploadFileId",uploadFileId);
    				if(e){
    				$.ajax({
    	    		        type: "POST",
    	    		        enctype: 'multipart/form-data',
    	    		        url : "<c:url value="/upload/deleteFiles"/>",
    	    		        data: formData,
    	    		        processData: false,
    	    		        contentType: false,
    	    		        cache: false,
    	    		        timeout: 600000,
    	    		        headers: { 'X-CSRF-TOKEN': csrf_tokenvalue},
    	    		       success: function (data) {
    	    		    	   if(data=="success"){
    	    		    		  attachments.splice( attachments.indexOf($parent.find("td").eq(0).text()), 1 );
 	    			   	   	      $parent.remove();
    	    		    	   }else{
    	    		    		   alert("unable to delete");
    	    		    	   }
    	    		        } 
    	    		    });
    	    		    		  
    				}
    	    		
    				 });   
    			});
    			
    			
    			
    		//edit
        
    		var workid=$('#workid').val();
    		var moduleName= $('#moduleName').val();
    		
    		if(workid == undefined){
    			
          	 }else{
    				 $.ajax({
 	    		        url : "<c:url value='/upload/edit'/>?workId="+workid+"&moduleName="+moduleName,
 	    		        success: function(data) {
 	    		        	if(data.length>0){
 	    		        		
  							  $.each(data, function(index, item) {
  								  var str = item.path;
  								  var fileName = str.substring(str.lastIndexOf("\\") + 1, str.length);
  								  $("#filedetails").append("<tr data-fileId='" + item.path + "' ><td ><a href="+ contextPath + item.path+">"+fileName+"</td><td >"+item.convertFileSize+"</td><td><a class='delete' id='delete_"+item.id+"' href='#'><i class=\"glyphicon glyphicon-trash left\"></i></td></tr>");
  								 attachments.push(fileName);
  							  }); 
  							    currentFileLength=$("#filedetails tr").length;
  							   
  					            }
 	    		    	/* if(data.length>0){
                        var dataVal = JSON.parse(data); 
                        $.each(dataVal, function(index, item) {
                        	 var fileName = item.substring(item.lastIndexOf("\\") + 1, item.length);
                        	 $("#filedetails").append("<tr data-fileId='" + item + "' ><td ><a href='"+item+"'>"+fileName+"</td><td><a class='delete' id='delete_"+index+"' href='#'><i class=\"glyphicon glyphicon-trash left\"></i></td></tr>");
                        }); 
                        currentFileLength=$("#filedetails tr").length;
 	    		    	} */

                       }
 	    		      
 	    		    });
            }
 							    
    		

    	    	
    	    	 
    	    	
    	    	});
    
    </script>
</body>
</html>