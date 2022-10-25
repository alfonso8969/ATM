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

	let date = new Date();
	let val = formatDate(date, false);
	$("#dateInit").datepicker();
	$("#dateEnd").datepicker();
	let dateformat = "yy-mm-dd";
	$("#dateInit").datepicker("option", "dateFormat", dateformat);
	$("#dateEnd").datepicker("option", "dateFormat", dateformat);
	$("#dateInit").val(val)
	$("#dateEnd").val(val);
});

function getMovementsBetweendates() {

	let dateFrom = $("#dateInit").val() + " 00:00:00";
	let dateTo = $("#dateEnd").val() + " 00:00:00";

	let formData = {
		idAccount: $("#idAccount").val(),
		dateFrom: dateFrom,
		dateTo: dateTo
	}

	$.get("doGetMovements", formData, (data) => {
		response(data);
	});
}


function response(data) {
	let ex = $("#idExtr").text();
	let cadena = "";
	let sum = 0;
	let negative = "";
	let decimals = "0";

	for (let mv of data) {
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

	if (sum.split(",")[1]) {
		decimals =  sum.split(",")[1].substring(0,2)
	}

	$("#saldo").html("<p id='saldo' class='"+ negative + "'>Total: " + (sum.split(",")[0] + "," + decimals )  + "</p>");

}

