var usuariosAdmin = {
	crearNuevoUsuarioAjax : function() {
		$.ajax({
			url: "admin/nuevoUsuario",
			type: "POST",
			data: {
				
			},
			success: function(result){
				
			}
		})
	}
};

$(document).ready(function() {
	$('#listaPersonas').dataTable({
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
		hide: {effect: "fade", duration: 800},
		buttons: {
			"Crear": function() {
				
				
				setTimeout(function(){
					$("#agregarAlumnoDialog").dialog("close");						
				}, 2000);
			},
			Cancel: function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {

		},
		close: function(event, ui) {
		}
	});
	
	$("#agregarAlumnoButton").click(function() {
		$("#agregarAlumnoDialog").dialog("open");
	});
});