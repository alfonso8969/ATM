let amount = "";
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

var deleteAmount = () => {
	amount = "";
	$("#qcWithdrawFounds").val(amount);
}

var withDrawl = (number, permanent) => {

	if(permanent) {
		deleteAmount();
	}

	if (number === 0 && amount.length == 0) return;
	amount += number+"";
	if (amount.length > 5) return;
	s();
	var c = formatNumber.new(amount);
	$("#qcWithdrawFounds").val(c);
}

var validate = () => {
	var error = false;
	amount = $("#qcWithdrawFounds").val();
	var comp = numberToInt(amount);

	if(comp < 20 /*|| comp > 600*/) {
		error = true;
	}

	if (comp % 20 != 0 && comp % 50 != 0 && (comp%(50+20))%10 != 0) {
		error = true;
	}

	if(error) {
		showError();
	} else {
		setTimeout(() => {
			$("#btnConfirm").prop("disabled", false);
			$("#tdConfirButton").removeClass("disabled");
		}, 1000);
	}
}

function showError() {
$("#qcWithdrawFounds").val("Cantidad no valida");
	$("#qcWithdrawFounds").css("color", "red");
	
	setTimeout(() => {
		$("#qcWithdrawFounds").css("color", "black");
		amount = "";
		$("#qcWithdrawFounds").val(amount);
		$("#btnConfirm").prop("disabled", false);
		$("#tdConfirButton").removeClass("disabled");
	}, 1000);
}