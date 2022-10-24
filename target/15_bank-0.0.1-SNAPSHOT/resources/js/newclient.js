
$(document).ready(function () {
	$("#name").on("input", function() {
		if($("#nameErr").is(":visible")) {
			$("#nameErr").hide();
		}
	});

	$("#email").on("input", function() {
		if($("#emailErr").is(":visible")) {
			$("#nemailErr").hide();
		}
	});

	$("#dni").on("input", function() {
		if($("#dniErr").is(":visible")) {
			$("#dniErr").hide();
		}
		if($("#dniErrLength").is(":visible")) {
			$("#dniErrLenght").hide();
		}
	});
});
function validate() {
	var error = false;
	if($("#name").val() == "") {
		$("#nameErr").show();
		error = true;
	}

	if($("#email").val() == "") {
		$("#emailErr").show();
		error = true;
	}

	if($("#dni").val() == "") {
		$("#dniErr").show();
		error = true;
	}
	
	if($("#dni").val().length < 8) {
		$("#dniErrLength").show();
		error = true;
	}

	if($("#phone").val() == "") {
		$("#phone").val(0)
	}
	

	
	return !error;
}
