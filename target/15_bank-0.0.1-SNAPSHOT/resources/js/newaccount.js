$(document).ready(function () {

	$("#accountType").on("input", function() {
		if($("#accountTypeErr").is(":visible")) {
			$("#accountTypeErr").hide();
		}
	});

	$("#idAccountNew").on("input", function() {
		if($("#accountErr").is(":visible")) {
			$("#accountErr").hide();
		}
		if($("#accountErrLength").is(":visible")) {
			$("#accountErrLength").hide();
		}
	});
});

function validate() {
	var error = false;
	if($("#accountType").val() == "") {
		$("#accountTypeErr").show();
		error = true;
	}


	if($("#idAccountNew").val() == "") {
		$("#accountErr").show();
		error = true;
	}
	
	// if($("#idAccountNew").val().length < 18) {
	// 	$("#accountErrLength").show();
	// 	error = true;
	// }

	if($("#balance").val() == "") {
		$("#phone").val(0)
	}

	return !error;
}

function selectClient() {
	var idClient = $("#clients").val();
	$("#idClient").val(idClient)
}