/*
var attachments = [];
	    var csrf_tokenName="${_csrf.parameterName}", 
	    csrf_tokenvalue="${_csrf.token}"
	    $(document).ready(function(){
                    var maxSize = 10, // MB
	    			currentSize = 0,
	    			remainSize = 0;
	    	
	    	
	    	function refreshSpace() {
	    		$('#totalsize span').text(currentSize.toFixed(2));
	    		$('#remainsize span').text(remainSize.toFixed(2));
	    	}

	   	    	$("#files").change(function(e) {
	   	    	  var files = e.target.files;
	   	    	  var filesLength=files.length;
			      var fileInput = document.querySelector("#files");
			 	  var files = fileInput.files; 
			 	
			 	 if(filesLength > 5 ){
			 	              alertify.alert("File Upload","You are allowed to upload a maximum of 5 files. Thanks!!");
			 	              $("#files").val('');
			 	          } 
			 	
		           	for (var i = 0, f; f = files[i]; i++) {
		    			attachments.push(f);
		    			if (ParseFile(f) === false) {
		    				alert('not enought space - there\'s only ' + remainSize.toFixed(2) + ' MB left');
		    				break;
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
			    				alert('Only JPG, PDF n PNG files are allowed to upload.');
			    			}
			    			document.querySelector("#files").onchange=attachments;
			    		}
		    			
	    		refreshSpace();
	   	    	
	    		 
	    		 var formData = new FormData();
	    		 formData.append("moduleName","ADMINISTRATIVE");
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
								  $("#filedetails").append("<tr data-fileId='" + item.id + "' ><td ><strong>" + fileName + "</strong></td><td><a class='delete' id='delete_"+item.id+"' href='#'><i class=\"glyphicon glyphicon-trash left\"></i></td></tr>");
								 }); 
					        document.querySelector("#files").onchange=attachments;
						    	}
							else{
								alert("File not Uploaded");
							}
	    		        } 
	    		    });
	    		
	    	});
	   	    	
			$("#filedetails").on('click', '.delete', function(e) {
				var $parent = $(this).closest('tr'),fileID = $parent.attr('data-fileId');
				var id = this.id;
				alertify.confirm('Are you Sure, want to delete the file! ',function(e) { 
				var split_id = id.split('_');
				var uploadFileId = split_id[1];
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
	    		    	
	    		    	   }else{
	    		    		   alert("unable to delete");
	    		    	   }
	    		        } 
	    		    });
	    		    		   attachments.splice( attachments.indexOf($parent), 1 );
	    			   	   	      $parent.remove();
				}
	    		
				 });   
			});
			

	    	
	    	 
	    	
	    	});*/