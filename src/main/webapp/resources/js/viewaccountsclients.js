//import $ from "jquery"
function selectClient() {

	let idClient = $("#clients").val();

	let formData = {
		idClient
	}

	$.get("getAccountsClient", formData, (data) => {
		response(data);
	});
}

function response(data) { 

	let cadena = "";
	let negative = "";

	for (let cu of data) {
		cadena += "<tr><td>" + cu.idAccount + "</td>";
		cadena += "<td>" + cu.accountType + "</td>";
		negative = 	parseInt(cu.balance) > 0 ? "" : "negative";
		cadena +=  "<td class="+ negative + ">" + decimalFormat(cu.balance) + "</td></tr>";
	}
	$("#tbody").html(cadena);
}