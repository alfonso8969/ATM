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
		$("#idClient").val(data.dni);
		$("#name").val(data.name);
		$("#lastName").val(data.lastName);
		$("#email").val(data.email);
		$("#address").val(data.address);
		$("#phone").val(data.phone);
		$("#addInform").val(data.info);
	}

}
let swalWithBootstrapButtons;
function validate() {

	swalWithBootstrapButtons = Swal.mixin({
		customClass: {
			confirmButton: 'btn btn-success',
			cancelButton: 'btn btn-danger'
		},
		buttonsStyling: false
	})

	swalWithBootstrapButtons.fire({
		title: 'Esta seguro de eliminar al cliente ' + $("#name").val() + '?',
		text: "Este acción no se puede revertir",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonText: 'Borrar',
		cancelButtonText: 'Cancelar',
		reverseButtons: true
	}).then((result) => {
		if (result.isConfirmed) {
			$('#form').attr('action', 'doDeleteClient?idClient=' + $("#idClient").val());
			$("#form").submit(); 
			
		} else if (
			/* Read more about handling dismissals below */
			result.dismiss === Swal.DismissReason.cancel
		) {
			swalWithBootstrapButtons.fire(
				'Cancelado',
				'El cliente con dni ' + $("#idClient").val() + ' no se elimin&oacute;',
				'error'
			)
		}
	})
}




