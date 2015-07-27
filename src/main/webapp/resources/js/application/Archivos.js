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
				
				var celdas = $("#listaArchivos td a[data-archivoid=" + data.id + "]").parents("tr").find("td");
				celdas.get(1).innerHTML = data.descripcion;
				celdas.get(2).innerHTML = data.fechaPublicacion;
				celdas.get(3).innerHTML = data.archivoTipo;
				celdas.get(4).innerHTML = data.tags;
				
				//Agrego el evento de delete
				$("a[name='deleteArchivo'][data-archivoid=" + data.id + "] button").click(function(){
					$("#deleteArchivoDialog").data('archivoId', $(this).parent().attr("data-archivoid")).dialog("open");
				});
				
				$("a[name=editArchivo][data-archivoid=" + data.id + "] button").click(function(){
					$("#editarArchivoDialog").data('archivoId', $(this).parent().attr("data-archivoid"))
						.data('descripcion', $(this).parents("tr").find("td").get(1).innerHTML)
						.data('fechaPublicacion', $(this).parents("tr").find("td").get(2).innerHTML)
						.data('tipo', $(this).parents("tr").find("td").get(3).innerHTML)
						.data('tags', $(this).parents("tr").find("td").get(4).innerHTML)
						.dialog("open");
				});
				
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
			url: "/repouniversity/admin/eliminarArchivo",
			type: "POST",
			data: {"archivoId" : archivoId},
			success: function(data){
				$.gritter.add({
					title:'Archivo eliminada',
					text: 'La archivo fue elimnada exitosamente.',
					sticky: false
				});
				
				table.row($("#listaArchivos a[data-archivoid=" + archivoId + "]").parents('tr')).remove().draw();
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

		elementos.each(function(index) {
			if($(this).val() == '') {
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
	table = $('#listaArchivos').DataTable({
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
	
	table.column(1).visible(false);
	table.column(3).visible(false);
	table.column(6).visible(false);
	table.column(7).visible(false);
	table.column(8).visible(false);
	table.column(10).visible(false);
	table.columns.adjust().draw();

	$("#listaArchivosTable_length").remove();
	$("#listaArchivos_info").remove();
	
	$("#editarArchivoDialog").dialog({
		resizable: false,
		width:700,
		height:350,
		modal: true,
		autoOpen: false,
		autoResize:true,
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
			$('#editarArchivoForm input[name=descripcion]').val($("#editarArchivoDialog").data('descripcion'));
			$('#editarArchivoForm input[name=estadoArchivo]').val($("#editarArchivoDialog").data('estadoArchivo'));
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
		autoResize:true,
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
		$("#editarArchivoDialog").data('archivoId', $(this).parent().attr("data-archivoid"))
			.data('archivoId', $(this).parent("ocultos").find("input[name=archivoId]").val())
			.data('descripcion', $(this).parent("ocultos").find("input[name=descripcion]").val())
			.data('estadoArchivo', $(this).parent("ocultos").find("input[name=estado]").val())
			.data('tags', $(this).parent("ocultos").find("input[name=tags]").val())
			.dialog("open");
		
	});
});



