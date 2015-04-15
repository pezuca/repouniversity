var usuariosAdmin = {
	crearNuevoUsuarioAjax : function() {
		$.ajax({
			url: "nuevoUsuario",
			type: "POST",
			data: $("#nuevoAlumnoForm").serialize(),
			success: function(data){
				$.gritter.add({
					text: 'La creacion del usuario fue exitosa.',
					class_name: 'gritter-light'
				});
				
				$("#agregarAlumnoDialog").dialog("close");						
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
	deleteUsuarioAjax : function(userId) {
		$.ajax({
			url: "eliminarUsuario",
			type: "POST",
			data: {"userId" : userId},
			success: function(data){
				$.gritter.add({
					title: 'Eliminar usuario',
					text: 'La eliminación del usuario fue exitosa.',
					class_name: 'gritter-light'
				});
				
				$("#listaPersonas").DataTable().row( $("#listaPersonas a[data-userId=" + userId + "]").parents('tr') ).remove().draw();
				$("#deleteAlumnoDialog").dialog("close");						
			},
			error: function(data) {
				$.gritter.add({
					title: 'Eliminar usuario',
					text: 'Hubo un problema al tratar de eliminar al usuario. Por favor inténtelo mas tarde.',
					class_name: 'gritter-light'
				});	
			}
		})
	}
};

$(document).ready(function() {
	$('#listaPersonas').DataTable({
		"processing" : false,
		"serverSide" : false,
		"paging" : false,
		"language": {
            "lengthMenu": "Mostrar _MENU_ resultados por página",
            "zeroRecords": "No fueron encontrados resultados.",
            "info": "Pagina _PAGE_ of _PAGES_",
            "infoEmpty": "No hay resultados disponibles.",
            "infoFiltered": "(filtered from _MAX_ total records)",
            "search": "Búsqueda: "
        }
	});

	$("#clientTable_length").remove();
	
	
	$("#agregarAlumnoDialog").dialog({
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		autoResize:true,
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Crear": function() {
				usuariosAdmin.crearNuevoUsuarioAjax();
			},
			Cancel: function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#nuevoAlumnoForm').trigger("reset");
		},
		close: function(event, ui) {
		}
	});
	
	$("#agregarAlumnoButton").click(function() {
		$("#agregarAlumnoDialog").dialog("open");
	});
	
	$("#deleteAlumnoDialog").dialog({
		resizable: false,
		width:400,
		modal: true,
		autoOpen: false,
		autoResize:true,
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Eliminar": function() {
				usuariosAdmin.deleteUsuarioAjax($("#deleteAlumnoDialog").data('userId'));
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#nuevoAlumnoForm').trigger("reset");
		},
		close: function(event, ui) {
		}
	});
	
	$("a[name=deleteUser] button").click(function(){
		$("#deleteAlumnoDialog").data('userId', $(this).parent().attr("data-userId")).dialog("open");
	});
});