var archivosAdmin = {
	editarArchivoAjax : function() {
		$("#editarArchivoForm input[name=tags]").val($("#editarArchivoForm input[name=tags]").val().replace(/\,/g, ';'));
		$.ajax({
			url: "/repouniversity/modificarArchivo",
			type: "POST",
			data: $("#editarArchivoForm").serialize(),
			success: function(data){
				$.gritter.add({
					title:'Archivo editada',
					text: 'Los datos de la archivo fueron editados exitosamente.',
					sticky: false
				});
				
				$(".archivoInfo." + data.id).empty();
				$(".archivoInfo." + data.id).parent().find(".botones .ocultos").empty();
				
				var archivoInfo = "<h4><strong>Materia: " + data.materia + "</strong></h4>" +
									"<p><i class='fa fa-clock-o'></i> Publicado en " + data.fechaPublicacion + "</p>" +
									"<h5>Tipo de Archivo: " + data.tipoArchivo + "</h5>" +
									"<p>" + data.descripcion + "<br><br><small>Publicado por " + data.apellidoPersona + ", " + data.nombrePersona + "</small>" +
									"<br><br>Estado archivo: " + data.estado + "</p>";
				
				var inputsOcultos = "<input name=archivoId value='" + data.id + "' type=hidden />" +
									"<input name=descripcion value='" + data.descripcion + "' type=hidden />" + 
									"<input name=estado value='" + data.estado + "' type=hidden />" +
									"<input name=tags value='" + data.tags + "' type=hidden />";
				
				$(".archivoInfo." + data.id).append(archivoInfo);
				$(".archivoInfo." + data.id).parent().find(".botones .ocultos").append(inputsOcultos);
				
				$("#editarArchivoDialog").dialog("close");						
			},
			error: function(data) {
				$("#nuevaArchivoForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de crear el usuario, inténtelo mas tarde.</p></div>")
				setTimeout(function(){
					$("#agregarArchivoDialog .infoDialog").hide(function(){
						$(this).remove();
					});
				}, 3000);	
			}
		})
	},
	deleteArchivoAjax : function(archivoId) {
		$.ajax({
			url: "/repouniversity/eliminarArchivo",
			type: "POST",
			data: {"archivoId" : archivoId},
			success: function(data){
				$.gritter.add({
					title:'Archivo eliminada',
					text: 'La archivo fue elimnada exitosamente.',
					sticky: false
				});
				
				$(".archivoInfo." + archivoId).parents(".archivoPlaca").remove();
				
				$("#deleteArchivoDialog").dialog("close");						
			},
			error: function(data) {
				$.gritter.add({
					title: 'Eliminar usuario',
					text: 'Hubo un problema al tratar de eliminar al usuario. Por favor inténtelo mas tarde.',
					class_name: 'gritter-light'
				});	
			}
		})
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
	listaArchivos = $('#listaArchivos').DataTable({
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
	       { orderable: false, targets: [3] }
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
	$("#listaArchivos_wrapper .row").first().find(".col-sm-6").first().append($("#listaArchivos").parents(".ibox:first").find(".ibox-title"));
	$("#listaArchivos_length").remove();
	
	listaArchivos.column(1).visible(false);
	listaArchivos.column(3).visible(false);
	listaArchivos.column(6).visible(false);
	listaArchivos.column(7).visible(false);
	listaArchivos.column(8).visible(false);
	listaArchivos.column(10).visible(false);
	listaArchivos.columns.adjust().draw();
	
	$("#editarArchivoDialog").dialog({
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Ok": function() {
				if(archivosAdmin.validacionFormlario("#editarArchivoForm")) {
					archivosAdmin.editarArchivoAjax();
				}
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#editarArchivoForm').trigger("reset");
			$("#editarArchivoForm").find(".form-group").removeClass("has-error");
			
			$('#editarArchivoForm input[name=archivoId]').val($("#editarArchivoDialog").data('archivoId'));
			
			if($("#editarArchivoDialog").data('descripcion') != null) {
				$('#editarArchivoForm input[name=descripcion]').val($("#editarArchivoDialog").data('descripcion'));				
			}
			
			var estado = $("#editarArchivoDialog").data('estadoArchivo');
			if(estado == 1) {
				$('#editarArchivoForm select[name=estadoArchivo] option[value=1]').attr("selected", "selected");				
			} else {
				$('#editarArchivoForm select[name=estadoArchivo] option[value=2]').attr("selected", "selected");
			}
			$('#editarArchivoForm input[name=tags]').val($("#editarArchivoDialog").data('tags'));
		},
		close: function(event, ui) {
		}
	});
	
	$("#deleteArchivoDialog").dialog({
		resizable: false,
		width:400,
		modal: true,
		autoOpen: false,
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Eliminar": function() {
				archivosAdmin.deleteArchivoAjax($("#deleteArchivoDialog").data('archivoId'));
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#nuevaArchivoForm').trigger("reset");
		},
		close: function(event, ui) {
		}
	});
	
	$("a[name=deleteArchivo] button").click(function(){
		$("#deleteArchivoDialog").data('archivoId', $(this).parent().attr("data-archivoid")).dialog("open");
	});
	
	$("a[name=editArchivo] button").click(function(){
		$("#editarArchivoDialog").data('archivoId', $(this).parents(".botones").find(".ocultos input[name=archivoId]").val())
			.data('descripcion', $(this).parents(".botones").find(".ocultos input[name=descripcion]").val())
			.data('estadoArchivo', $(this).parents(".botones").find(".ocultos input[name=estado]").val())
			.data('tags', $(this).parents(".botones").find(".ocultos input[name=tags]").val())
			.dialog("open");
	});
});