//import $ from "jquery"
var idClient;
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

	$.get("getClientsAccount", formData, (data) => {
		responseIdClient(data);
	});

	function responseIdClient(data) {
		$("#clients").html("");
		var cadena = "<option selected>Seleccione cliente</option>";
		for (var cl of data) { 
			cadena += "<option value=" + cl.dni + ">Dni: " + cl.dni + " - Nombre " + cl.name + "</option>";
		}
		$("#clients").html(cadena);

	}
}

function selectClient() {
	idClient = $("#clients").val();
}

let swalWithBootstrapButtons;

function validate() {

	if ($("#accounts").val() == "" || $("#clients").val() == "") {
		Swal.fire("Error", "compruebe los campos: Faltan datos", "error");
		return;
	}

	swalWithBootstrapButtons = Swal.mixin({
		customClass: {
			confirmButton: 'btn btn-success',
			cancelButton: 'btn btn-danger'
		},
		buttonsStyling: false
	})

	swalWithBootstrapButtons.fire({
		title: 'Esta seguro de eliminar la cuenta ' + $("#idAccountNew").val() + '?',
		text: "Este acción no se puede revertir",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonText: 'Borrar',
		cancelButtonText: 'Cancelar',
		reverseButtons: true
	}).then((result) => {
		if (result.isConfirmed) {
			$('#form').attr('action', 'doDeleteAccount?idAccount=' + $("#idAccountNew").val() + "&idClient=" +  idClient);
			$("#form").submit(); 
			
		} else if (result.dismiss === Swal.DismissReason.cancel) {
			swalWithBootstrapButtons.fire(
				'Cancelado',
				'La cuenta' + $("#idAccountNew").val() + ' no se elimin&oacute;',
				'error'
			)
		}
	})
}