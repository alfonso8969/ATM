// import $ from "jquery";
let amount = "";
let aux = "";
let res = "";
let first = true;

var transferFunds = (number) => {
	if (number === 0 && amount.length == 0) return;
	if (number === ',' && amount.length == 0) return;
	if (number !== ',')
		aux += number+"";
	if (number === ',' || res.includes(',')) {
		aux = formatNumber.new(aux); 
		if (first) {
			res = aux+number+"";	
			first = false;
		} else {
			res += number+"";
		}
		$("#qcTransferFounds").val(res);
		return;
	}
	amount += number+"";
	var c = formatNumber.new(amount);
	$("#qcTransferFounds").val(c);
}

var deleteAmount = () => {
	amount = aux = res = "";
	first = true;
	$("#qcTransferFounds").val(amount);
}

var selectAccountFrom = (idAccounFrom) => {
	$("#idAccountFrom").val(idAccounFrom);	
}

var selectAccountTo = (idAccounTo) => {
	$("#idAccountTo").val(idAccounTo);
}

var validateSubmit = () => {
	if ($("#idAccountTo").val() === "****" || $("#idAccountFrom").val() === "****") {
		Swal.fire("Error", "No ha introducido n&uacute;mero de cuenta o no es v&aacute;lido", "error");
		return false;	
	}

	if($("#qcTransferFounds").val() === "") {
		Swal.fire("Error", "No ha introducido cantidad a transferir", "error");
		return false;	
	}

	return true;	
}










