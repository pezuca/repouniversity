var tpEntregaAdmin = {
	crearNuevoEntregaTpAjax : function() {
		
		var dataFiles = new FormData($("#nuevoEntregaTpForm")[0]);
		
		$.ajax({
			url: "/repouniversity/tpgrupo/nuevoEntregaTp",
			type: "POST",
			data: dataFiles,
			processData: false,
			contentType: false,
			success: function(data){
				$.gritter.add({
					title:'Entrega creada',
					text: 'La creacion de la entrega fue exitosa.',
					sticky: false
				});

				if($('input[name=miPermiso]').val() == '1'){
	                table.row.add([
				                   data.id,
				                   data.descripcion,
				                   data.archivoNombre,
				                   "<a name='editEntregaTp' data-tpentregaId='" + data.id + "'><button class='btn btn-primary btn-circle' type='button'><i class='fa fa-pencil'></i></button></a> " + 
				  				   "<a name='deleteEntregaTp' data-tpentregaId='" + data.id + "'><button class='btn btn-danger btn-circle' type='button'><i class='fa fa-times'></i></button></a> " +
				  				   "<a href='/repouniversity/tpgrupo/verEntregasTP?tpEntregaId=" + data.id + "' name='Ver' data-tpentregaId=" + data.id + "><button class='btn btn-primary btn-circle' type='button' data-toggle='tooltip' data-placement='top' data-original-title='Ver TP'><i class='fa fa-arrow-right'></i></button></a>" + 
				  				   "<a href='/repouniversity/vistaPrevia?archivoId=" + data.archivo + "' name='verArchivo' data-tpentregaId=" + data.id + "><button class='btn btn-success btn-circle' type='button' data-toggle='tooltip' data-placement='top' data-original-title='Ver Archivo'><i class='fa fa-search'></i></button></a>" +
				  				   "<a href='/repouniversity/bajarArchivo?archivoId=" + data.archivo + "' name='dowloadArchivo' data-tpentregaId=" + data.id + "><button class='btn btn-success btn-circle' type='button' data-toggle='tooltip' data-placement='top' data-original-title='Bajar Archivo'><i class='fa fa-download'></i></button></a>"
					]).draw();
				}
				else if($('input[name=miPermiso]').val() == '2'){
	                table.row.add([
				                   data.id,
				                   data.descripcion,
				                   data.archivoNombre,
				                   "<a name='editEntregaTp' data-tpentregaId='" + data.id + "'><button class='btn btn-primary btn-circle' type='button'><i class='fa fa-pencil'></i></button></a> " + 
				  				   "<a href='/repouniversity/tpgrupo/verEntregasTP?tpEntregaId=" + data.id + "' name='Ver' data-tpentregaId=" + data.id + "><button class='btn btn-primary btn-circle' type='button' data-toggle='tooltip' data-placement='top' data-original-title='Ver TP'><i class='fa fa-arrow-right'></i></button></a>" + 
				  				   "<a href='/repouniversity/vistaPrevia?archivoId=" + data.archivo + "' name='verArchivo' data-tpentregaId=" + data.id + "><button class='btn btn-success btn-circle' type='button' data-toggle='tooltip' data-placement='top' data-original-title='Ver Archivo'><i class='fa fa-search'></i></button></a>" +
				  				   "<a href='/repouniversity/bajarArchivo?archivoId=" + data.archivo + "' name='dowloadArchivo' data-tpentregaId=" + data.id + "><button class='btn btn-success btn-circle' type='button' data-toggle='tooltip' data-placement='top' data-original-title='Bajar Archivo'><i class='fa fa-download'></i></button></a>"
					]).draw();
				}
				else{
					table.row.add([
				                   data.id,
				                   data.descripcion,
				                   data.archivoNombre,
				                   "<a href='/repouniversity/tpgrupo/verEntregasTP?tpEntregaId=" + data.id + "' name='Ver' data-tpentregaId=" + data.id + "><button class='btn btn-primary btn-circle' type='button' data-toggle='tooltip' data-placement='top' data-original-title='Ver TP'><i class='fa fa-arrow-right'></i></button></a>" + 
				  				   "<a href='/repouniversity/vistaPrevia?archivoId=" + data.archivo + "' name='verArchivo' data-tpentregaId=" + data.id + "><button class='btn btn-success btn-circle' type='button' data-toggle='tooltip' data-placement='top' data-original-title='Ver Archivo'><i class='fa fa-search'></i></button></a>" +
				  				   "<a href='/repouniversity/bajarArchivo?archivoId=" + data.archivo + "' name='dowloadArchivo' data-tpentregaId=" + data.id + "><button class='btn btn-success btn-circle' type='button' data-toggle='tooltip' data-placement='top' data-original-title='Bajar Archivo'><i class='fa fa-download'></i></button></a>"
					]).draw();
	     		}
				
				//Agrego el evento de delete
				$("a[name='deleteEntregaTp'][data-tpentregaId=" + data.id + "] button").click(function(){
					$("#deleteEntregaTpDialog").data('tpEntregaId', $(this).parent().attr("data-tpentregaId")).dialog("open");
				});
				
				$("a[name=editEntregaTp][data-tpentregaId=" + data.id + "] button").click(function(){
					$("#editarEntregaTpDialog").data('tpEntregaId', $(this).parent().attr("data-tpentregaId"))
						.data('descripcion', $(this).parents("tr").find("td").get(1).innerHTML)
						.dialog("open");
				});
				
				$("#agregarEntregaTpDialog").dialog("close");						
			},
			error: function(data) {
				$("#nuevoEntregaTpForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de crear el curso, inténtelo mas tarde.</p></div>")
				setTimeout(function(){
					$("#agregarEntregaTpDialog .infoDialog").hide(function(){
						$(this).remove();
					});
				}, 3000);	
			}
		})
	},
	editarEntregaTpAjax : function() {
		$.ajax({
			url: "/repouniversity/tpgrupo/editarEntregaTp",
			type: "POST",
			data: $("#editarEntregaTpForm").serialize(),
			success: function(data){
				$.gritter.add({
					title:'Entrega editada',
					text: 'Los datos de la entrega fueron editados exitosamente.',
					sticky: false
				});
				
				var celdas = $("#EntregaTP td a[data-tpentregaId=" + data.id + "]").parents("tr").find("td");
				celdas.get(0).innerHTML = data.id;
				celdas.get(1).innerHTML = data.descripcion;
				celdas.get(2).innerHTML = data.archivoNombre;
												
				//Agrego el evento de delete
				$("a[name='deleteEntregaTp'][data-tpentregaId=" + data.id + "] button").click(function(){
					$("#deleteEntregaTpDialog").data('tpEntregaId', $(this).parent().attr("data-tpentregaId")).dialog("open");
				});
				
				$("a[name=editEntregaTp][data-tpentregaId=" + data.id + "] button").click(function(){
					$("#editarEntregaTpDialog").data('tpEntregaId', data.id)
						.data('descripcion', $(this).parents("tr").find("td").get(1).innerHTML)
						.dialog("open");
				});
				
				$("#editarEntregaTpDialog").dialog("close");						
			},
			error: function(data) {
				$("#nuevoEntregaTpForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de editar el Trabajo Practico, inténtelo mas tarde.</p></div>")
				setTimeout(function(){
					$("#agregarEntregaTpDialog .infoDialog").hide(function(){
						$(this).remove();
					});
				}, 3000);	
			}
		})
	},
	deleteEntregaTpAjax : function(tpEntregaId) {
		$.ajax({
			url: "/repouniversity/tpgrupo/eliminarEntregaTp",
			type: "POST",
			data: {"tpEntregaId" : tpEntregaId},
			success: function(data){
				$.gritter.add({
					title:'Entrega eliminada',
					text: 'La entrega fue elimnado exitosamente.',
					sticky: false
				});
				
				table.row( $("#EntregaTP a[data-tpentregaId=" + tpEntregaId + "]").parents('tr') ).remove().draw();
				$("#deleteEntregaTpDialog").dialog("close");						
			},
			error: function(data) {
				$.gritter.add({
					title: 'Eliminar Entrega',
					text: 'Hubo un problema al tratar de eliminar la entrega. Por favor inténtelo mas tarde.',
					class_name: 'gritter-light'
				});	
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
	table = $('#EntregaTP').DataTable({
		retrieve: true,
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
	
	$("#agregarEntregaTpDialog").dialog({
		position: "top",
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		hide: {effect: "fade", duration: 300},
		show: {effect: "fade", duration: 300},
		buttons: {
			"Crear": function() {
				if(tpEntregaAdmin.validacionFormlario("#nuevoEntregaTpForm")) {
					tpEntregaAdmin.crearNuevoEntregaTpAjax();
				}
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#nuevoEntregaTpForm').trigger("reset");
			$("#nuevoEntregaTpForm").find(".form-group").removeClass("has-error");
		},
		close: function(event, ui) {
		}
	});
	
	$("#editarEntregaTpDialog").dialog({
		position: "top",
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Ok": function() {
				if(tpEntregaAdmin.validacionFormlario("#editarEntregaTpForm")) {
					tpEntregaAdmin.editarEntregaTpAjax();
				}
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#editarEntregaTpForm').trigger("reset");
			$("#editarEntregaTpForm").find(".form-group").removeClass("has-error");
			$("#editarEntregaTpForm select option").removeAttr("selected");
			
			$('#editarEntregaTpForm input[name=tpEntregaId]').val($("#editarEntregaTpDialog").data('tpEntregaId'));
			$('#editarEntregaTpForm input[name=descripcion]').val($("#editarEntregaTpDialog").data('descripcion'));
			
			
		},
		close: function(event, ui) {
		}
	});
	
	$("#deleteEntregaTpDialog").dialog({
		position: "top",
		resizable: false,
		width:400,
		modal: true,
		autoOpen: false,
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Eliminar": function() {
				tpEntregaAdmin.deleteEntregaTpAjax($("#deleteEntregaTpDialog").data('tpEntregaId'));
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#nuevoEntregaTpForm').trigger("reset");
		},
		close: function(event, ui) {
		}
	});
	
	$("#agregarEntregaTpButton").click(function() {
		$("#agregarEntregaTpDialog").dialog("open");
	});
	
	$("a[name=deleteEntregaTp] button").click(function(){
		$("#deleteEntregaTpDialog").data('tpEntregaId', $(this).parent().attr("data-tpentregaId")).dialog("open");
	});
	
	$("a[name=editEntregaTp] button").click(function(){
		$("#editarEntregaTpDialog").data('tpEntregaId', $(this).parent().attr("data-tpentregaId"))
			.data('tpEntregaId', $(this).parents("tr").find("td").get(0).innerHTML)
			.data('descripcion', $(this).parents("tr").find("td").get(1).innerHTML)
			.dialog("open");
	});
	$("#enviarComentario").click(function() {
		$.ajax({
			type: "POST",
			url: "/repouniversity/comentario/nuevoComentario",
			data: {"tpGrupoId" : $("input[name=tpGrupoIdGlobal]").val(), "comentario" : $("textarea[name=mensaje]").val()},
			success: function(data){
				$.gritter.add({
					title: 'Comentario',
					text: 'Su comentario fue agregado correctamente',
					sticky: false
				});	
				$(".chat-activity-list").append("<div class='media-body'><strong>" + data.persona.nombre + " " + data.persona.apellido + "</strong>"
						+ "<p class='m-b-xs'>" + data.descripcion + "</p><small class='text-muted'>" + data.fechasys + "</small></div>");
				$("textarea[name=mensaje]").val("");
			},
			error: function() {
				$.gritter.add({
					title: 'Comentario',
					text: 'Hubo un problema al agregar su comentario, por favor intentelo mas tarde.',
					sticky: false
				});	
			}
		});
	});
});