//import $ from "jquery"
function selectAccount() {

	var idAccount = $("#accounts").val();

	var formData = {
		idAccount
	}

	$.get("getAccount", formData, (data) => {
		response(data);
	});

	function response(data) { 
		$("#idAccountNew").val(data.idAccount);
		$("#accountType").val(data.accountType);
		$("#balance").val(data.balance);
		
	}

}

