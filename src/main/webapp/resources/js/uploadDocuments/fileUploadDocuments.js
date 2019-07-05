$("#files").off().on(
		'change',
		function() {
			console.log("start " + (new Date()).getTime());

			if ($(this) && $(this).length) {

				var totalFiles = $(this).get(0).files.length;
				var formObj = new FormData();
				formObj.append("moduleName", moduleName);

				$($(this).get(0).files)
						.each(
								function(i, v) {

									// Check for invalid file
									// formats
									if ($.inArray(v.name.substring(v.name
											.lastIndexOf(".")),
											allowedFileExtensions) === -1) {

										showIndalidFileFormatSelectedWarning();

										formObj = null;
										return false;
									}
									
									

									// Check if the file exceeds given size in
									// Bytes
									
									if(v.size > maxFileSize){
										showSelectedFileSizeExceedsWarning(totalFiles);
										formObj = null;
										return false;
									}

									formObj.append("files", v);

									if (0 === --totalFiles) {
										
										saveDocumentFile(formObj);
									}

								});

			}

		});

function showWarnigModel(header, messageBody) {

	alertify.alert().setting({
		'label' : 'I got it',
		'message' : messageBody,
		'onok' : function() {
			$("#files").val('');
		}
	}).setHeader('<h4 class="mb-0"> ' + header + ' </h4> ').show(true,
			'warning-alertjs-model');

}

function showSelectedFileSizeExceedsWarning(fileIndx) {
	var size = (maxFileSize / 1024 ) / 1024;
	size = size.toFixed(1) + " MB";
	
	showWarnigModel("Invalid file size", (fileIndx > 1 ? "Some of files" : "File") + " exceeds max allowed file size limit : <b> "+size +"</b>");

}

function showIndalidFileFormatSelectedWarning() {
	
	showWarnigModel("Invalid file selection", "Only allowed files with extensions are :<b>  " + allowedFileExtensions.join(", ")+"</b>");	
}

// Display files current module having now
function renderFilesOnGrid(filesList) {

	var landDetailsAttachmentsTableRef = $("#landDetailsAttachmentsTable");

	if (landDetailsAttachmentsTableRef.find("tr").length === 1) {
		if (landDetailsAttachmentsTableRef.find("tr").first().data("attachmentId")
				&& parseInt(landDetailsAttachmentsTableRef.find("tr").first().data("attachmentId")) === -1) {

			landDetailsAttachmentsTableRef.empty();
		}
	}
	var fileIndx = landDetailsAttachmentsTableRef.find('tr').length || 0;
	if (filesList.length > 0) {

		$.each(filesList, function(i, e) {
			landDetailsAttachmentsTableRef.append(getAttachmentsRow(++fileIndx,
					e));
			
			if((i+1) === filesList.length){
				updateTotalFileCount(landDetailsAttachmentsTableRef.find("tr").length);
			}
		})

	} else {
		landDetailsAttachmentsTableRef.append(getNoAttachmentsFoundRow());
	}
	
}

function getFileNameFromPath(path) {
	var folders = path.replace(/\\/g, "@").split("@")
	return folders[folders.length - 1];
}

function getAttachmentsRow(index, attachment) {

	return '<tr data-attachment-id = "'
			+ attachment.id
			+ '"><td>'
			+ index
			+ '</td>'
			+ '	<td>'
			+ getFileNameFromPath(attachment.path)
			+ '</td>'
			+ '	<td>'
			+ (attachment.updatedAt == null ? attachment.createdAt
					: attachment.updatedAt)
			+ '</td>'
			+ '<td class="text-center"><a href="#" name="remove"><i class="fa fa-trash"/></a>&nbsp;&nbsp;<a href="'+ contextPath + attachment.path+'" target="_blank"><i class="fa fa-eye"/></a></td>'
			+ '</tr>'
}

function getNoAttachmentsFoundRow() {

	return '<tr data-attachment-id = "-1"><td colspan="5" ><p class="text-center pt-4 mb-4 notfound">No file uploads found</p></td></tr>'
}
var attachmentIdToDelete = 0;
$(document)
		.on(
				'click',
				"#landDetailsAttachmentsTable tr td:last-child a[name='remove']",
				function() {
					var trRef = $(this).parents("tr");
					var attachmentId = trRef.data("attachmentId");

					if (attachmentId) {
						attachmentIdToDelete = attachmentId;
						alertify
								.confirm()
								.setting(
										{
											'labels' : {
												'ok' : 'Yes',
												'cancel' : 'No'
											},
											'message' : "Are you sure want to delete file : <b>"
													+ trRef.find("td").eq(1)
															.text() + "</b>"

										})
								.set('onok', function() {
									deleteDocumentFile();
								})
								.setHeader(
										'<h4 class="mb-0"> Delete file confirmation </h4> ')
								.show('true', 'danger-alertjs-model');

					}
				});

function saveDocumentFile(formData) {

	$.ajax({
		type : "POST",
		enctype : 'multipart/form-data',
		url : saveDocumentFileUrl,
		data : formData,
		processData : false,
		contentType : false,
		cache : false,
		timeout : 600000,
		headers : {
			'X-CSRF-TOKEN' : csrf_tokenvalue
		},
		success : function(data) {
			renderFilesOnGrid(data);
			$("#files").val('');
		}
	});

}

function deleteDocumentFile() {

	if (attachmentIdToDelete != 0) {

		var formData = {};
		formData["uploadFileId"] = attachmentIdToDelete;

		$.ajax({
			type : "POST",
			headers : {
				'Content-Type' : 'application/x-www-form-urlencoded'
			},
			url : deleteDocumentFileUrl,
			data : formData,
			headers : {
				'X-CSRF-TOKEN' : csrf_tokenvalue
			},
			success : function(data) {
				if (data == "success") {
					deletedFileOnServer();
				} else {
					alert("unable to delete");
				}
			}
		});

	}
}

function deletedFileOnServer() {
	if (attachmentIdToDelete != 0) {

		var allAttachments = $("#landDetailsAttachmentsTable");
		var filterdAttachments = allAttachments.find("tr").filter(function() {
			return $(this).data("attachmentId") !== attachmentIdToDelete && $(this).data("attachmentId") > 0;
		}).map(function(i, e) {
			var trRef = $(e);
			trRef.find("td").eq(0).text(i + 1);
			return trRef
		}).get();

		allAttachments.html(filterdAttachments);

		updateTotalFileCount(filterdAttachments.length);
		if (filterdAttachments.length === 0) {
			allAttachments.append(getNoAttachmentsFoundRow());
		}
		attachmentIdToDelete = 0;
	}

}

function updateTotalFileCount(fileCount) {
	$("#selectedFilesCount").text("* file selected " + fileCount);
}