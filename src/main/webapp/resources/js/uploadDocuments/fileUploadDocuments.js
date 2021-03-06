$("#files")
		.off()
		.on(
				'change',
				function() {
					console.log("start " + (new Date()).getTime());

					if ($(this) && $(this).length) {

						var totalFiles = $(this).get(0).files.length;
						var formObj = new FormData();

						formObj.append("moduleName", moduleName);
						var currentSelectedFilesSize = 0;

						// Check total size doesn't exceed allowed max size
						if (!checkNumberOfFileUploadExceedThenAllowedMaxUpload(totalFiles)) {
							showMaximumUploadableFilesExceedsWarning(totalFiles);
							return false;
						}

						var fileSizeArray = $.map($(this).get(0).files,
								function(e) {
									return e.size;

								})

						$.each(fileSizeArray, function(i, e) {
							currentSelectedFilesSize += e;
						});

						// Check total size doesn't exceed allowed max size
						if (!checkTotalFilesSizeIsExceedThenAllowedSize(currentSelectedFilesSize)) {
							showMaximumFileSizeExceedsWarning();
							return false;
						}

						var selectedFileNameArray = $.map($(this).get(0).files,
								function(e) {
									return e.name;

								})

						// Check any duplicate file names found
						if (checkDuplicateFileNames(selectedFileNameArray)) {
							showCurrentSelectionContainsDuplicateFileNamesWarning();
							return false;
						}

						$($(this).get(0).files).each(
								function(i, v) {

									// Check for invalid file
									// formats
									if ($.inArray(v.name.substring(
											v.name.lastIndexOf(".") + 1)
											.toLowerCase(),
											allowedFileExtensions) === -1) {

										showIndalidFileFormatSelectedWarning();

										formObj = null;
										return false;
									}

									// Check if the file exceeds given size in
									// Bytes
									/*
									 * if(v.size > maxFileSize){
									 * showSelectedFileSizeExceedsWarning(totalFiles);
									 * formObj = null; return false; }
									 */

									formObj.append("files", v);

									if (0 === --totalFiles) {

										saveDocumentFile(formObj);
									}

								});

					}

				});

function showWarnigModel(header, messageBody) {

	alertify.alert().setting({
		'label' : 'Ok',
		'message' : messageBody,
		'onok' : function() {
			$("#files").val('');
		}
	}).setHeader('<h4 class="mb-0"> ' + header + ' </h4> ').show(true,
			'warning-alertjs-model');

}

function showMaximumUploadableFilesExceedsWarning(fileIndx) {

	showWarnigModel("Invalid file uploads count",
			"Your file selection exceeds max allowed file upload limit : <b> "
					+ maxFileUploadCount + "</b>");

}

function showMaximumFileSizeExceedsWarning() {
	var size = humanReadableFileSize(maxFileSize);
	showWarnigModel("Invalid file size",
			"Files exceeds max allowed file size limit : <b> " + size + "</b>");

}

function showCurrentSelectionContainsDuplicateFileNamesWarning() {
	showWarnigModel(
			"Duplicate file names found",
			"There are some files already existed with same name, file names should not be same");
}

function showIndalidFileFormatSelectedWarning() {

	showWarnigModel("Invalid file selection",
			"Only allowed files with extensions are :<b>  "
					+ allowedFileExtensions.join(", ") + "</b>");
}

// Display files current module having now
function renderFilesOnGrid(filesList) {

	var landDetailsAttachmentsTableRef = $("#landDetailsAttachmentsTable");

	if (landDetailsAttachmentsTableRef.find("tr").length === 1) {
		if (landDetailsAttachmentsTableRef.find("tr").first().data(
				"attachmentId")
				&& parseInt(landDetailsAttachmentsTableRef.find("tr").first()
						.data("attachmentId")) === -1) {

			landDetailsAttachmentsTableRef.empty();
		}
	}
	var fileIndx = landDetailsAttachmentsTableRef.find('tr').length || 0;
	if (filesList.length > 0) {

		$.each(filesList,
				function(i, e) {
					landDetailsAttachmentsTableRef.append(getAttachmentsRow(
							++fileIndx, e));

					if ((i + 1) === filesList.length) {
						updateTotalFileCount(landDetailsAttachmentsTableRef
								.find("tr").length);
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
	var rowHtml = "";
	rowHtml = '<tr data-attachment-id = "'
			+ attachment.id
			+ '" data-file-size="'
			+ attachment.fileSize
			+ '"><td>'
			+ index
			+ '</td>'
			+ '	<td>'
			+ getFileNameFromPath(attachment.path)
			+ '</td>'
			+ '	<td>'
			+ attachment.convertFileSize
			+ '</td>'
			+ '<td>'
			+ getLoacalDateString(attachment.updatedAt == null ? attachment.createdAt
					: attachment.updatedAt) + '</td>';

	if (typeof isFileUploadStatusColumnSupported !== "undefined"
			&& isFileUploadStatusColumnSupported) {
		rowHtml += '	<td>' + getStatusHtml(attachment.status) + '</td>';
	}

	rowHtml += '<td class="text-center">';

	if (typeof isFileUploadStatusColumnSupported !== "undefined"
			&& isFileUploadStatusColumnSupported) {
		rowHtml += '<a href="#" name="remove" data-disabled="'
				+ (FILE_UPLOAD_APPROVED == attachment.status ? 1 : 0)
				+ '"><i class="fa fa-trash '
				+ (FILE_UPLOAD_APPROVED == attachment.status ? "text-muted cursor-not-allowed"
						: "") + '"/></a>';
	} else {
		rowHtml += '<a href="#" name="remove" ><i class="fa fa-trash"/></a>';
	}

	rowHtml += '&nbsp;&nbsp;<a href="' + contextPath + attachment.path
			+ '" target="_blank"><i class="fa fa-eye"/></a></td>' + '</tr>';

	return rowHtml;

}

function getStatusHtml(status) {
	switch (status) {
	case FILE_UPLOAD_APPROVED:
		return '<span class="text-success"><i class="fa fa-check"></i>&nbsp;Approved</span>';

	case FILE_UPLOAD_REJECTED:
		return '<span class="text-danger"><i class="fa fa-close"></i>&nbsp;Rejected</span>';

	default:
		return '<span class="text-muted"><i class="fa fa-hourglass"></i>&nbsp;Pending</span>';
	}
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
					if ($(this).data("disabled") === 1) {
						return false;
					}
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
															.text()
													+ "</b> permanently"

										})
								.set('onok', function() {
									deleteDocumentFile();
								})
								.setHeader(
										'<h4 class="mb-0"> Delete file confirmation </h4> ')
								.set('defaultFocus', 'cancel').show('true',
										'danger-alertjs-model');

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
		var filterdAttachments = allAttachments
				.find("tr")
				.filter(
						function() {
							return $(this).data("attachmentId") !== attachmentIdToDelete
									&& $(this).data("attachmentId") > 0;
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

// update files count on screen below file controller
function updateTotalFileCount(fileCount) {
	$("#selectedFilesCount").text(
			"* file selected " + fileCount + "/" + maxFileUploadCount);
	$("input[name=file]")
			.prop('disabled', fileCount >= maxFileUploadCount)
			.siblings("label.fileuploadLabel")
			.css("cursor",
					fileCount >= maxFileUploadCount ? 'not-allowed' : 'pointer')
}

function getLoacalDateString(datetime) {

	return new moment(datetime, 'MMM DD, YYYY hh:mm:ss A')
			.format("DD-MM-YYYY hh:mm A");

}

// Check total files size against specified max file upload size
function checkTotalFilesSizeIsExceedThenAllowedSize(currentSelectedFileSize) {
	var existedUploadedFileSize = 0;

	// Get all existed file size on each row by data-file-size(store current
	// file size in bytes) attribute
	var existedFileSizeArray = $("#landDetailsAttachmentsTable tr").map(
			function(i, e) {
				// Check it is not a empty row or no records found row
				if ($(e).data("attachmentId") !== -1)
					return $(e).data("fileSize");
				return 0;
			});

	// iterate existed file size array and sum each file size and store it on a
	// variable
	$.each(existedFileSizeArray, function(i, e) {
		existedUploadedFileSize += e;
	});

	var totalFileSize = currentSelectedFileSize + existedUploadedFileSize;

	console.log("Total file sizes Till now : "
			+ humanReadableFileSize(totalFileSize));

	if (typeof maxFileSize === "string")
		maxFileSize = parseInt(maxFileSize);
	return totalFileSize <= maxFileSize;

}

function checkNumberOfFileUploadExceedThenAllowedMaxUpload(selectedFilesCount) {

	var existedFilesArray = $("#landDetailsAttachmentsTable tr").filter(
			function(i, e) {
				return $(e).data("attachmentId") !== -1;
			});

	return existedFilesArray.length + selectedFilesCount <= maxFileUploadCount;
}

function checkDuplicateFileNames(selectedFilesArray) {

	// Get existed files
	var existedFilesArray = $("#landDetailsAttachmentsTable tr").map(
			function(i, e) {
				if ($(e).data("attachmentId") !== -1)
					return $(e).find("td").eq(1).text();
				return "";
			});

	var fileNameAlreadyExisted = false;

	// iterate selected files names array
	$.each(selectedFilesArray, function(i, e) {

		// check if file name found in existed files
		if ($.inArray(e, existedFilesArray) !== -1) {
			fileNameAlreadyExisted = true;
		}

		return !fileNameAlreadyExisted;
	})

	return fileNameAlreadyExisted;

}

function humanReadableFileSize(size) {
	if (size < 1024)
		return size + ' B'
	let i = Math.floor(Math.log(size) / Math.log(1024))
	let num = (size / Math.pow(1024, i))
	let round = Math.round(num)
	num = round < 10 ? num.toFixed(2) : round < 100 ? num.toFixed(1) : round
	return `${num} ${'KMGTPEZY'[i-1]}B`
}