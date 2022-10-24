//import $ from "jquery"
function selectClient() {

	var idClient = $("#clients").val();

	var formData = {
		idClient
	}

	$.get("getClient", formData, (data) => {
		response(data);
	});

	function response(data) { 
		$("#dni").val(data.dni);
		$("#name").val(data.name);
		$("#lastName").val(data.lastName);
		$("#email").val(data.email);
		$("#address").val(data.address);
		$("#phone").val(data.phone);
		$("#addInform").val(data.info);
	}

}