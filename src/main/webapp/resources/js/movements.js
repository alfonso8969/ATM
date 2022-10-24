//import $ from "jquery"
$(document).ready(function () {
	$.datepicker.setDefaults({
		showOn: "both",
		buttonImageOnly: true,
		buttonImage: "./resources/img/calendar_small.png",
		buttonText: "Abrir calendario"
	});

	$("#dateInit").datepicker({
		maxDate: "0d"
	});
	$("#dateEnd").datepicker({
		maxDate: "+1d"
	});

	var date = new Date();
	var val = formatDate(date, false);
	$("#dateInit").datepicker();
	$("#dateEnd").datepicker();
	var dateformat = "yy-mm-dd";
	$("#dateInit").datepicker("option", "dateFormat", dateformat);
	$("#dateEnd").datepicker("option", "dateFormat", dateformat);
	$("#dateInit").val(val)
	$("#dateEnd").val(val);
});

function getMovementsBetweendates() {

	var dateFrom = $("#dateInit").val() + " 00:00:00";
	var dateTo = $("#dateEnd").val() + " 00:00:00";

	var formData = {
		idAccount: $("#idAccount").val(),
		dateFrom: dateFrom,
		dateTo: dateTo
	}

	$.get("doGetMovements", formData, (data) => {
		response(data);
	});
}


function response(data) {
	var ex = $("#idExtr").text();
	var cadena = "";
	var sum = 0;
	var negative = "";

	for (var mv of data) {
		if (mv.transactionType === ex || mv.transactionType === "transferencia enviada") {
			sum -= mv.amount;
			negative = "negative";
		} else {
			negative = "";
			sum += mv.amount;
		}
		cadena += "<tr><td class='can "+ negative + "'>" + decimalFormat(mv.amount) + "</td>";
		cadena += "<td class='"+ negative + "'>" + mv.transactionType + "</td><td>";
		cadena += formatDate(mv.transactionDate, true) + "</td></tr>";
	}
	$("#movs").html(cadena);

	sum = decimalFormat(sum);
	negative = 	parseInt(sum) > 0 ? "" : "negative";

	$("#saldo").html("<p id='saldo' class='"+ negative + "'>Total: " + (sum.split(",")[0] + "," + sum.split(",")[1].substring(0,2) )  + "</p>");

}

