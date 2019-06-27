$(document).ready(function() {
	 
	    $("#files").on("change", function(e) {
	      var files = e.target.files,
	        filesLength = files.length;
	      for (var i = 0; i < filesLength; i++) {
	        var f = files[i];
	        var size = parseFloat(Math.round(f.size/1024));
	        var removeLink = "<a class=\"btn btn-delete\" href=\"#\" data-fileid=\"" + [i] + "\"><i " +
   		                           " class=\"glyphicon glyphicon-trash left\"></i></a>";
	        
	        $("<table> <tr id=\"file"+[i]+"\"> <th> " + f.name + " </th> "+ " " + " <th> " + size + "Kb" + " </th> <td> "+ removeLink + " </td>  </tr></table>").insertAfter("#files");
	        
	          $(".btn-delete").click(function($index){
	        	 
	        	/* var val = $(this).parent().attr('id');  */
	        	var val = $(this).parents('tr').attr('id');
	            //alert(val);
	        	 alertify.confirm('Are you Sure, want to delete the file! ',
							function(e) { 
	        	 if(e){
	        		 //$("#file0").remove();  
	        		 $("#"+val).remove();
	        	 }
	        	 
	        	  }); 
	        	 
	          });
	          
	        
	       
	      }
	    });
	  
	});    
	
 
	
	$("input[type='file']").on("change", function () {
		  $("#file_error").html("");
	     if(this.files[0].size > 2000000) {
	    	 $("#file_error").html("File size is greater than 2MB");
	    	 alertify.alert("File Upload","Please upload file less than 2MB. Thanks!!"); 
	       $(this).val('');
	     }
	    }); 