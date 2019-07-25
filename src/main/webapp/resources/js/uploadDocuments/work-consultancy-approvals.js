const APPROVE = "approve-btn", REJECT = "reject-btn", UNDO = "undo-btn", ACTIVE = "active", NOT_ALLOWED = "not-allowed";

$(document)
		.on('click', '.btn-group button', function() {
			var $btnRef = $(this);
			if ($btnRef.hasClass(REJECT)) {
				takeConfirmationForReject($btnRef);
			} else if ($btnRef.hasClass(APPROVE)) {
				takeConfirmationForApprove($btnRef);
			} else if ($btnRef.hasClass(UNDO)) {
				takeConfirmationForUndo($btnRef, getUndoType($btnRef));
			}

		})
		.ready(
				function() {

					$('input[name="previous"]')
							.on(
									'click',
									function() {
										$(
												"#nav-tab > ul.nav > li > a#pills-work-info-tab")
												.trigger('click');
									});
					$('input[name="next"]')
							.on(
									'click',
									function() {
										$(
												"#nav-tab > ul.nav > li > a#pills-attachments-tab")
												.trigger('click');
									});

					if ($("#approveWork").length) {
						$("#approveWork")
								.on(
										'click',
										function() {
											if (isAnyDocumentsNeedtoEitherApproveOrRejected()) {
												showWarnigModel(
														"Approval Pending",
														"Please either Approve or Reject the files to continue!")
												return false;
											}
											showHideWorkApproveButton(true);
											sendRequestToServerForApproveWork();
										});
					}

					if ($("#home").length) {
						$("#home").on('click', function() {
							window.location.href = homeUrl;
						});
					}

					$('a[data-toggle="pill"]').on('show.bs.tab', function(e) {
						scrollToTabStart();
					});

				});

/* Reject file handling */

function takeConfirmationForReject($btnRef) {
	var fileName = getFileName($btnRef);
	showCofirmationDialog("Reject file confirmation",
			"Are you sure want to reject file : <b>" + fileName + "</b>",
			sendRequestForRejectFileUploadDocument, $btnRef, "");
}

function sendRequestForRejectFileUploadDocument($btnRef) {
	sendRequestToServer(FILE_UPLOAD_STATUS.REJECTED, $btnRef,
			rejectFileUploadDocument);
}

function rejectFileUploadDocument($btnRef) {
	$btnRef.addClass(ACTIVE + " " + NOT_ALLOWED).prop("disabled", true).find(
			"span").text("Rejected");
	$btnRef.siblings("." + APPROVE).addClass(NOT_ALLOWED)
			.prop("disabled", true);
	$btnRef.siblings("." + UNDO).removeClass(NOT_ALLOWED).prop("disabled",
			false);
	updateWorkAllowStatus($btnRef, true);
	var fileName = getFileName($btnRef);
	raiseNotification(`File : <b>${fileName}</b> rejected`, 'success');
}

/* Approve file handling */
function takeConfirmationForApprove($btnRef) {
	var fileName = getFileName($btnRef);
	showCofirmationDialog("Approve file confirmation",
			"Are you sure want to approve file : <b>" + fileName + "</b>",
			sendRequestForApproveFileUploadDocument, $btnRef, "");
}

function sendRequestForApproveFileUploadDocument($btnRef) {
	sendRequestToServer(FILE_UPLOAD_STATUS.APPROVED, $btnRef,
			approveFileUploadDocument);
}

function approveFileUploadDocument($btnRef) {
	$btnRef.addClass(ACTIVE + " " + NOT_ALLOWED).prop("disabled", true).find(
			"span").text("Approved");

	$btnRef.siblings("." + REJECT).addClass(NOT_ALLOWED).prop("disabled", true)
	$btnRef.siblings("." + UNDO).removeClass(NOT_ALLOWED).prop("disabled",
			false);
	updateWorkAllowStatus($btnRef, true);
	var fileName = getFileName($btnRef);
	raiseNotification(`File : <b>${fileName}</b> approved`, 'success');
}

/* Undo Approved or Rejected file handling */

function takeConfirmationForUndo($btnRef, approveOrReject) {
	var fileName = getFileName($btnRef);
	if ($.inArray(approveOrReject, [ 'Approve', 'Reject' ]) === -1) {
		return false;
	}

	if (approveOrReject === "Approve") {
		approveOrReject = approveOrReject + "d";
	} else if (approveOrReject === "Reject") {
		approveOrReject = approveOrReject + "ed";
	}

	showCofirmationDialog(
			`Undo ${approveOrReject.toLowerCase()} file confirmation`,
			`Are you sure want to undo ${approveOrReject.toLowerCase()} file : <b> ${fileName} </b>`,
			sendRequestForUndoRejectOrApproveFileUploadDocument, $btnRef, "");
}

function sendRequestForUndoRejectOrApproveFileUploadDocument($btnRef) {

	sendRequestToServer(FILE_UPLOAD_STATUS.UNDO, $btnRef,
			undoRejectOrApproveFileUploadDocument);
}

function undoRejectOrApproveFileUploadDocument($btnRef) {
	var fileName = getFileName($btnRef);
	var undoType = getUndoType($btnRef);
	if (undoType == "Approve") {
		$btnRef.siblings("." + APPROVE).find("span").text("Approve");
	} else if (undoType == "Reject") {
		$btnRef.siblings("." + REJECT).find("span").text("Reject");
	}
	updateWorkAllowStatus($btnRef, false);
	raiseNotification(`Undo ${undoType} file : <b>${fileName}</b>`, 'success');
	$btnRef.siblings().prop("disabled", false).removeClass(
			ACTIVE + " " + NOT_ALLOWED);

	$btnRef.prop("disabled", true).addClass(NOT_ALLOWED);
}

/* Utility functions */

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

function raiseNotification(message, notificationType) {

	var notification = alertify.notify(message, notificationType, 5,
			function() {

			});
}

function showCofirmationDialog(header, message, callback, callbackArg,
		topClassName) {

	alertify.confirm().setting({
		'labels' : {
			'ok' : 'Yes',
			'cancel' : 'No'
		},
		'message' : message

	}).set('onok', function() {
		if (typeof callback === "function")
			callback(callbackArg);
	}).setHeader('<h4 class="mb-0"> ' + header + ' </h4> ').set('defaultFocus',
			'cancel').show('true', 'danger-alertjs-model');
}

function sendRequestToServer(status, $btnRef, callback) {
	var reqPayload = getApproveOrRejectOrUndoAttachementRequestPayload(
			getAttachmentId($btnRef), status);
	/*
	 * if (typeof callback === "function") callback($btnRef);
	 */

	var successFunction = function(data, textStatus, jqXHR) {

		if (jqXHR.status === 200) {
			if (typeof callback === "function")
				callback($btnRef);
		}
	};

	var errorFunction = function(jqXHR, textStatus, errorThrown) {

		if (jqXHR.status !== 404) {
			console.error("Attachment status failed due to " + errorThrown);
			raiseNotification("Attachment status updation failed ", "error");
		}

	};

	$.ajax({
		type : "post",
		url : attachmentStatusUpdateUrl,
		statusCode : {
			404 : function() {
				raiseNotification("Invalid attachment", "error");
			}
		},
		contentType : "application/json",
		data : JSON.stringify(reqPayload),
		beforeSend : startAjaxLoadAnimation,
		complete : stopAjaxLoadAnimation,
		success : successFunction,
		error : errorFunction
	});

}

function sendRequestToServerForApproveWork() {

	var workId = $("#workid").val();

	if (!workId) {
		return false;
	}

	var successFunction = function(data, textStatus, jqXHR) {

		if (jqXHR.status === 200) {
			console.log("data " + workId + " textStatus " + textStatus);

			raiseNotification("work approved successfully", "success");
			var timeOutId = setTimeout(function() {
				clearTimeout(timeOutId);
				showHideWorkApproveButton(false);
				$("#home").trigger('click')
			}, 3000);
		}

	};

	var errorFunction = function(jqXHR, textStatus, errorThrown) {
		showHideWorkApproveButton(false);
		if (jqXHR.status !== 404) {
			raiseNotification("work approve failed " + errorThrown, "error");
		}

	};

	$.ajax({
		type : "POST",
		url : workApprovalUrl,
		statusCode : {
			404 : function() {
				raiseNotification("Invalid work id", "error");
				showHideWorkApproveButton(false);
			}
		},
		beforeSend : startAjaxLoadAnimation,
		complete : stopAjaxLoadAnimation,
		success : successFunction,
		error : errorFunction
	});

}

function getFileName($btnRef) {
	return $btnRef.parents("tr").find("td").eq(1).text();
}

function getAttachmentId($btnRef) {
	return $btnRef.parent().data("attachmentId");
}

function getUndoType($btnRef) {
	if ($btnRef.siblings("." + ACTIVE).hasClass(APPROVE)) {
		return 'Approve';
	} else if ($btnRef.siblings("." + ACTIVE).hasClass(REJECT)) {
		return 'Reject';
	}
}

function getApproveOrRejectOrUndoAttachementRequestPayload(attachmentId, status) {
	return {
		'id' : attachmentId,
		'status' : status
	}
}

function startAjaxLoadAnimation() {
}
function stopAjaxLoadAnimation() {
}
function scrollToTabStart() {
	$('html, body').animate({
		scrollTop : 70
	}, 500, 'easeInOutExpo');
}

function showHideWorkApproveButton(disabled) {
	var approveWorkBtnRef = $("#approveWork");
	if (disabled) {
		approveWorkBtnRef.addClass("not-allowed");
	} else {
		approveWorkBtnRef.removeClass("not-allowed");
	}

	approveWorkBtnRef.prop('disabled', disabled);
}

function updateWorkAllowStatus($btnRef, isAllowed) {
	$btnRef.parents("tr").data("allow-work-approval", isAllowed ? 1 : 0);
}

function isAnyDocumentsNeedtoEitherApproveOrRejected() {
	var anyPendingDocuments = $("tbody.uploadedFileDetails tr").filter(
			function(i, e) {
				return parseInt($(e).data("allowWorkApproval")) === 0;
			});

	return anyPendingDocuments.length > 0;
}