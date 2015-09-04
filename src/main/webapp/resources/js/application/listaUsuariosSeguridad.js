var usuariosAdmin = {
	editarUsuarioAjax : function() {
		$.ajax({
			url: "/repouniversity/seguridad/editarUsuarioRol",
			type: "POST",
			data: $("#editarAlumnoForm").serialize(),
			success: function(data){
				$.gritter.add({
					title:'Usuario editado',
					text: 'Los datos del usuario fueron editados exitosamente.',
					sticky: false
				});
				
				var celdas = $("#listaPersonas td a[data-userid=" + data.id + "]").parents("tr").find("td");
				celdas.get(1).innerHTML = data.persona.nombre;
				celdas.get(2).innerHTML = data.persona.apellido;
				celdas.get(3).innerHTML = data.user;
				celdas.get(4).innerHTML = data.persona.mail;
				celdas.get(5).innerHTML = data.rol;
				//celdas.get(6).innerHTML = data.carrera;
				celdas.get(7).innerHTML = data.permiso.permiso;
				celdas.get(7).setAttribute('data-permisoId', data.permiso.id);
				
				$("a[name=editUser][data-userid=" + data.id + "] button").click(function(){
					$("#editarAlumnoDialog").data('userId', $(this).parent().attr("data-userid"))
						.data('nombre', $(this).parents("tr").find("td").get(1).innerHTML)
						.data('apellido', $(this).parents("tr").find("td").get(2).innerHTML)
						.data('user', $(this).parents("tr").find("td").get(3).innerHTML)
						.data('mail', $(this).parents("tr").find("td").get(4).innerHTML)
						.data('rol', $(this).parents("tr").find("td").get(5).innerHTML)
						.data('carrera', $(this).parents("tr").find("td[data-carreraId]").attr("data-carreraId"))
						.data('permiso', $(this).parents("tr").find("td[data-permisoId]").attr("data-permisoId"))
						.dialog("open");
				});
				
				$("#editarAlumnoDialog").dialog("close");						
			},
			error: function(data) {
				$("#nuevoAlumnoForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de crear el usuario, inténtelo mas tarde.</p></div>")
				setTimeout(function(){
					$("#agregarAlumnoDialog .infoDialog").hide(function(){
						$(this).remove();
					});
				}, 3000);	
			}
		})
	},
	generarAlerta: function(tipo, containerSelector, texto) {
		$(containerSelector).prepend("<div class='alert alert-" + tipo + " alert-dismissable'>" +
				"<button aria-hidden='true' data-dismiss='alert' class='close' type='button'>×</button>" +
				texto + "</div>");
	},
	validacionFormlario: function(formularioSelector) {
		var elementos = $(formularioSelector).find("input[required], select[required]");
		var flag = true;
		var inValid = /([^\s])/;

		elementos.each(function(index) {
			if(!inValid.test($(this).val()) || $(this).val() == null) {
				$(this).parents(".form-group").addClass(" has-error");
				flag = false;
			} else {
				$(this).parents(".form-group").removeClass("has-error");
			}
		});
		
		return flag;
	}
};

$(document).ready(function() {
	table = $('#listaPersonas').DataTable({
		retrieve: true,
		"processing" : false,
		"serverSide" : false,
		"pagingType": "full_numbers",
		"language": {
            "lengthMenu": "Mostrar _MENU_ resultados por página",
            "zeroRecords": "No fueron encontrados resultados.",
            "info": "Pagina _PAGE_ of _PAGES_",
            "infoEmpty": "No hay resultados disponibles.",
            "infoFiltered": "(filtered from _MAX_ total records)",
            "search": "Filtrar por: "
        },
        "columnDefs": [
	       { orderable: false, targets: [8] }
	     ],
	     "order": [[ 0, "desc" ]],
	        "oLanguage": {
	            "sInfoEmpty": "No hay resultados disponibles.",
	            "sSearch": "Filtrar por: ",
	            "sInfo": "Mostrando (_START_ a _END_) de _TOTAL_ resultados",
	            "sZeroRecords": "No fueron encontrados resultados.",
	            "oPaginate": {
	                "sFirst": "Primera",
	                "sLast": "Ultima",
	                "sNext": "Siguiente",
	                "sPrevious": "Previa"
	            }
	          }
	});
	
	$("#listaPersonas_wrapper .row").first().find(".col-sm-6").first().append($("#listaPersonas").parents(".ibox:first").find(".ibox-title"));
	
	$("#listaPersonas_length").remove();

	$("#editarAlumnoDialog").dialog({
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Ok": function() {
				if(usuariosAdmin.validacionFormlario("#editarAlumnoForm")) {
					usuariosAdmin.editarUsuarioAjax();
				}
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#editarAlumnoForm').trigger("reset");
			$("#editarAlumnoForm").find(".form-group").removeClass("has-error");
			
			$('#editarAlumnoForm input[name=userId]').val($("#editarAlumnoDialog").data('userId'));
			$('#editarAlumnoForm input[name=nombre]').val($("#editarAlumnoDialog").data('nombre'));
			$('#editarAlumnoForm input[name=apellido]').val($("#editarAlumnoDialog").data('apellido'));
			$('#editarAlumnoForm input[name=mail]').val($("#editarAlumnoDialog").data('mail'));
			$('#editarAlumnoForm input[name=user]').val($("#editarAlumnoDialog").data('user'));
			$('#editarAlumnoForm select[name=rol]').val($("#editarAlumnoDialog").data('rol'));
			$('#editarAlumnoForm .permisoSelect').show();
			$('#editarAlumnoForm select[name=permiso] option').removeAttr("selected");
			$("#editarAlumnoForm select[name=permiso] option[value=" + $("#editarAlumnoDialog").data('permiso')  + "]").attr("selected", "selected");
			$("#editarAlumnoForm select[name=permiso]").trigger('chosen:updated');
			
			if($("#editarAlumnoDialog").data('rol') == 'alumno'){
				$('#editarAlumnoForm .carreraSelect').show();
				$('#editarAlumnoForm select[name=carrera] option').removeAttr("selected");
				$("#editarAlumnoForm select[name=carrera] option[value=" + $("#editarAlumnoDialog").data('carrera')  + "]").attr("selected", "selected");
				$("#editarAlumnoForm select[name=carrera]").trigger('chosen:updated');
			} else {
				$('#editarAlumnoForm .carreraSelect').hide();
			}
			
			
		},
		close: function(event, ui) {
		}
	});
	
	$("a[name=editUser] button").click(function(){
		$("#editarAlumnoDialog").data('userId', $(this).parent().attr("data-userid"))
			.data('userId', $(this).parents("tr").find("td").get(0).innerHTML)
			.data('nombre', $(this).parents("tr").find("td").get(1).innerHTML)
			.data('apellido', $(this).parents("tr").find("td").get(2).innerHTML)
			.data('user', $(this).parents("tr").find("td").get(3).innerHTML)
			.data('mail', $(this).parents("tr").find("td").get(4).innerHTML)
			.data('rol', $(this).parents("tr").find("td").get(5).innerHTML)
			.data('carrera', $(this).parents("tr").find("td[data-carreraId]").attr("data-carreraId"))
			.data('permiso', $(this).parents("tr").find("td[data-permisoId]").attr("data-permisoId"))
			.dialog("open");
	});
	
	$("select[name=carrera]").chosen({no_results_text:'No hay resultados para: '});
	$("select[name=permiso]").chosen({no_results_text:'No hay resultados para: '});
});