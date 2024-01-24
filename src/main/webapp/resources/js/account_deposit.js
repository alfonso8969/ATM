 //import $ from "jquery";

let amount = "";
let aux = "";
let res = "";
let first = true;
let timeout;

function s() {
	$("#btnConfirm").prop("disabled", true);
	$("#tdConfirButton").addClass("disabled");
	clearTimeout(timeout);
	timeout = setTimeout(() => {
		validate();
		clearTimeout(timeout);
	},1500)
}


var insertMoney = (number) => {
	if (number === 0 && amount.length == 0) return;
	
	amount += number + "";
	if (amount.length > 5) return;
	if (amount.length > 1) s();
	var c = formatNumber.new(amount);
	$("#qcCustomNumber").val(c);
}

var deleteAmount = () => {
	amount = "";
	aux = "";
	res = "";
	first = true;
	$("#qcCustomNumber").val(amount);
	$("#qcCustomNumberCheck").val(amount);
}


var validate = () => {
	
	amount = $("#qcCustomNumber").val();
	var comp = numberToInt(amount);

	if (comp % 5 != 0) {
		$("#qcCustomNumber").val("Cantidad no valida");
		$("#qcCustomNumber").css("color", "red");
		
		setTimeout(() => {
			$("#qcCustomNumber").css("color", "black");
			amount = "";
			$("#qcCustomNumber").val(amount);
			$("#btnConfirm").prop("disabled", false);
			$("#tdConfirButton").removeClass("disabled");
		}, 1000);
	} else {
		setTimeout(() => {
			$("#btnConfirm").prop("disabled", false);
			$("#tdConfirButton").removeClass("disabled");
		}, 1000);
	}
}

var insertCheck = (number) => {
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
		$("#qcCustomNumberCheck").val(res);
		return;
	}
	amount += number+"";
	var c = formatNumber.new(amount);
	$("#qcCustomNumberCheck").val(c);
}