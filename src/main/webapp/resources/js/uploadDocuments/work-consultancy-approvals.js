const APPROVE = "approve-btn", REJECT = "reject-btn", UNDO = "undo-btn", ACTIVE = "active", NOT_ALLOWED = "not-allowed";

var FILE_UPLOAD_STATUS = {
	APPROVED : 'APPRVD',
	REJECTED : 'REJCTD',
	UNDO : 'OPEN',
	WORK_APPROVE_STATUS : "WORK_APPROVE_STATUS"
}

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
			$(this).prop('disabled', true);
			sendRequestToServerForApproveWork();
		});
	}

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
	$btnRef.addClass(ACTIVE + " " + NOT_ALLOWED).prop("disabled", true);
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
	$btnRef.addClass(ACTIVE + " " + NOT_ALLOWED).prop("disabled", true);
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
	raiseNotificatrion(`Unod File : <b>${fileName}</b> ${undoType}`, 'success');
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
	if (typeof callback === "function")
		callback($btnRef);

	/*
	 * var successFunction = function() { if (typeof callback === "function")
	 * callback($btnRef); } var errorFunction = function(e) {
	 * raiseNotificatrion( "There is something happen on server please try again ",
	 * "error"); }
	 * 
	 * $.ajax({ type : "POST", url :
	 * "/updateAttachmentApproveOrRejectOrUndoStatus", data :
	 * JSON.stringify(reqPayload), beforeSend : startAjaxLoadAnimation, complete :
	 * stopAjaxLoadAnimation, success : successFunction, error : errorFunction
	 * });
	 */
}

function sendRequestToServerForApproveWork() {

	var reqPayload = getApproveOrRejectOrUndoAttachementRequestPayload($(
			"input[name='workId']").val(),
			FILE_UPLOAD_STATUS.WORK_APPROVE_STATUS);

	/*
	 * var successFunction = function() { $("#approveWork").prop('disabled',
	 * false); raiseNotificatrion("work approved successfully", "success"); var
	 * timeOutId = setTimeout(function() { clearTimeout(timeOutId);
	 * window.location.href = ""; }, 3000); } var errorFunction = function(e) {
	 * raiseNotificatrion("work approve failed " + e.getMessage(), "error");
	 * $("#approveWork").prop('disabled', false); }
	 * 
	 * $.ajax({ type : "POST", url :
	 * "/updateAttachmentApproveOrRejectOrUndoStatus", data :
	 * JSON.stringify(reqPayload), beforeSend : startAjaxLoadAnimation, complete :
	 * stopAjaxLoadAnimation, success : successFunction, error : errorFunction
	 * });
	 */

}

function getFileName($btnRef) {
	return $btnRef.parents("tr").find("td").eq(1).text();
}

function getAttachmentId($btnRef) {
	return $btnRef.parent("tr").data("attachmentId");
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
		scrollTop : 0
	}, 1500, 'easeInOutExpo');
}