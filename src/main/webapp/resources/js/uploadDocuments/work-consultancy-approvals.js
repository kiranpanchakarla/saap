const APPROVE = "approve-btn", REJECT = "reject-btn", UNDO = "undo-btn", ACTIVE = "active", NOT_ALLOWED = "not-allowed";

$(document).on('click', '.btn-group button', function() {
	var $btnRef = $(this);
	if ($btnRef.hasClass(REJECT)) {
		takeConfirmationForReject($btnRef);
	} else if ($btnRef.hasClass(APPROVE)) {
		sendRequestForApproveFileUploadDocument($btnRef);
	} else if ($btnRef.hasClass(UNDO)) {
		takeConfirmationForUndo($btnRef, getUndoType($btnRef));
	}

}).ready(function() {

	$('input[name="previous"]').on('click', function() {
		$("#nav-tab > ul.nav > li > a#pills-work-info-tab").trigger('click');
	});
	$('input[name="next"]').on('click', function() {
		$("#nav-tab > ul.nav > li > a#pills-attachments-tab").trigger('click');
	});

	if ($("#approveWork").length) {
		$("#approveWork").on('click', function() {
			showHideWorkApproveButton(true);
			sendRequestToServerForApproveWork();
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
	var fileName = getFileName($btnRef);
	raiseNotificatrion(`File : <b>${fileName}</b> rejected`, 'success');
}

/* Approve file handling */

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
	var fileName = getFileName($btnRef);
	raiseNotificatrion(`File : <b>${fileName}</b> approved`, 'success');
}

/* Undo Approved or Rejected file handling */

function takeConfirmationForUndo($btnRef, approveOrReject) {
	var fileName = getFileName($btnRef);
	if ($.inArray(approveOrReject, [ 'Approve', 'Reject' ]) === -1) {
		return false;
	}

	showCofirmationDialog(
			`Undo ${approveOrReject} file confirmation`,
			`Are you sure want to undo ${approveOrReject} file : <b> ${fileName} </b>`,
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

	raiseNotificatrion(`Undo ${undoType} file : <b>${fileName}</b>`, 'success');
	$btnRef.siblings().prop("disabled", false).removeClass(
			ACTIVE + " " + NOT_ALLOWED);

	$btnRef.prop("disabled", true).addClass(NOT_ALLOWED);
}

/* Utility functions */

function raiseNotificatrion(message, notificationType) {

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
			raiseNotificatrion("Attachment status updation failed ", "error");
		}

	};

	$.ajax({
		type : "post",
		url : attachmentStatusUpdateUrl,
		statusCode : {
			404 : function() {
				raiseNotificatrion("Invalid attachment", "error");
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
			showHideWorkApproveButton(false);
			raiseNotificatrion("work approved successfully", "success");
			var timeOutId = setTimeout(function() {
				clearTimeout(timeOutId);
				window.location.href = "";
			}, 3000);
		}

	};

	var errorFunction = function(jqXHR, textStatus, errorThrown) {
		showHideWorkApproveButton(false);
		if (jqXHR.status !== 404) {
			raiseNotificatrion("work approve failed " + errorThrown, "error");
		}

	};

	$.ajax({
		type : "POST",
		url : workApprovalUrl,
		statusCode : {
			404 : function() {
				raiseNotificatrion("Invalid work id", "error");
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
	$("#approveWork").prop('disabled', disabled);
}