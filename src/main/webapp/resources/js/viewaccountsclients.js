//import $ from "jquery"
function selectClient() {

	var idClient = $("#clients").val();

	var formData = {
		idClient
	}

	$.get("getAccountsClient", formData, (data) => {
		response(data);
	});
}

function response(data) { 

	var cadena = "";
	var negative = "";

	for (var cu of data) {
		cadena += "<tr><td>" + cu.idAccount + "</td>";
		cadena += "<td>" + cu.accountType + "</td>";
		negative = 	parseInt(cu.balance) > 0 ? "" : "negative";
		cadena +=  "<td class="+ negative + ">" + decimalFormat(cu.balance) + "</td></tr>";
	}
	$("#tbody").html(cadena);
}