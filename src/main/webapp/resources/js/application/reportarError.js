var errorAdmin = {
				crearNuevoErrorAjax : function() {
					$.ajax({
						url: "/repouniversity/errorArchivo/reportarError",
						type: "POST",
						data: $("#nuevoErrorForm").serialize(),
						success: function(data){
							$.gritter.add({
								title:'Error reportado',
								text: 'El error fue reportado de forma exitosa.',
								sticky: false
							});
							
							
							$("#agregarErrorDialog").dialog("close");						
						},
						error: function(data) {
							$.gritter.add({
								title: 'Reportar Error',
								text: 'Hubo un problema al tratar de reportar el error. Por favor inténtelo mas tarde.',
								class_name: 'gritter-light'
							});	
						}
					})
				},
	deleteErrorAjax : function(errorId) {
		$.ajax({
			url: "/repouniversity/errorArchivo/eliminarError",
			type: "POST",
			data: {"errorArchivoId" : errorId},
			success: function(data){
				$.gritter.add({
					title:'Reporte de error eliminado',
					text: 'El error fue elimnado exitosamente.',
					sticky: false
				});
				
				table.row( $("#listaErrores a[data-errorid=" + errorId + "]").parents('tr') ).remove().draw();
				$("#deleteErrorDialog").dialog("close");						
			},
			error: function(data) {
				$.gritter.add({
					title: 'Eliminar Error',
					text: 'Hubo un problema al tratar de eliminar al error. Por favor inténtelo mas tarde.',
					class_name: 'gritter-light'
				});	
			}
		})
	}
	};

$(document).ready(function() {
	table = $('#listaErrores').DataTable({
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
	
	
	$("#agregarErrorDialog").dialog({
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		autoResize:true,
		hide: {effect: "fade", duration: 300},
		show: {effect: "fade", duration: 300},
		buttons: {
			"Crear": function() {
				if(errorAdmin.validacionFormlario("#nuevoErrorForm")) {
					errorAdmin.crearNuevoErrorAjax();
				}
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#nuevoErrorForm').trigger("reset");
			$("#nuevoErrorForm").find(".form-group").removeClass("has-error");
		},
		close: function(event, ui) {
		}
	});
	
	$("#agregarErrorButton").click(function() {
		$("#agregarErrorDialog").dialog("open");
	});
	
		
	$("#deleteErrorDialog").dialog({
		resizable: false,
		width:400,
		modal: true,
		autoOpen: false,
		autoResize:true,
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Eliminar": function() {
				errorAdmin.deleteErrorAjax($("#deleteErrorDialog").data('errorId'));
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#nuevoErrorForm').trigger("reset");
		},
		close: function(event, ui) {
		}
	});
	
	$("a[name=deleteError] button").click(function(){
		$("#deleteErrorDialog").data('errorId', $(this).parent().attr("data-errorid")).dialog("open");
	});
	
	
});