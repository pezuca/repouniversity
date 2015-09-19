var tpEntregaAdmin = {
	crearNuevoEntregaTpAjax : function() {
		$.ajax({
			url: "/repouniversity/tpgrupo/nuevoEntregaTp",
			type: "POST",
			data: $("#NuevoEntregaTpForm").serialize(),
			success: function(data){
				$.gritter.add({
					title:'Entrega creada',
					text: 'La creacion de la entrega fue exitosa.',
					sticky: false
				});
				
				
				table.row.add([
				                                          data.id,
				                                          data.descripcion,
				                                          data.archivo,
				                                          "<a href='#' name='editEntregaTp' data-tpentregaId='" + data.id + "'><button class='btn btn-primary btn-circle' type='button'><i class='fa fa-pencil'></i></button></a> " + 
				  										  "<a href='#' name='deleteEntregaTp' data-tpentregaId='" + data.id + "'><button class='btn btn-danger btn-circle' type='button'><i class='fa fa-times'></i></button></a> " +
				  										  "<a href='/repouniversity/tpgrupo/verEntregasTP?tpEntregaId=" + data.id + "' name='Ver' data-tpentregaId=" + data.id + "><button class='btn btn-primary btn-circle' type='button' data-toggle='tooltip' data-placement='top' data-original-title='Ver TP'><i class='fa fa-arrow-right'></i></button></a>" +
				  										  "<a href='/repouniversity/vistaPrevia?archivoId=" + data.archivo + "' name='verArchivo' data-tpentregaId=" + data.id + "><button class='btn btn-success btn-circle' type='button' data-toggle='tooltip' data-placement='top' data-original-title='Ver Archivo'><i class='fa fa-search'></i></button></a>" +
				  										  "<a href='/repouniversity/bajarArchivo?archivoId=" + data.archivo + "' name='dowloadArchivo' data-tpentregaId=" + data.id + "><button class='btn btn-success btn-circle' type='button' data-toggle='tooltip' data-placement='top' data-original-title='Bajar Archivo'><i class='fa fa-download'></i></button></a>"
												  										  
				                                     ]).draw();
				//Agrego el evento de delete
				$("a[name='deleteEntregaTp'][data-tpentregaId=" + data.id + "] button").click(function(){
					$("#deleteEntregaTpDialog").data('tpEntregaId', $(this).parent().attr("data-tpentregaId")).dialog("open");
				});
				
				$("a[name=editEntregaTp][data-tpentregaId=" + data.id + "] button").click(function(){
					$("#editarEntregaTpDialog").data('tpEntregaId', $(this).parent().attr("data-tpentregaId"))
						.data('descripcion', $(this).parents("tr").find("td").get(1).innerHTML)
						.data('archivo', $(this).parents("tr").find("td").get(2).innerHTML)
						.dialog("open");
				});
				
				$("#agregarEntregaTpDialog").dialog("close");						
			},
			error: function(data) {
				$("#NuevoEntregaTpForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de crear el curso, inténtelo mas tarde.</p></div>")
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
				celdas.get(2).innerHTML = data.archivo;
												
				//Agrego el evento de delete
				$("a[name='deleteEntregaTp'][data-tpentregaId=" + data.id + "] button").click(function(){
					$("#deleteEntregaTpDialog").data('tpEntregaId', $(this).parent().attr("data-tpentregaId")).dialog("open");
				});
				
				$("a[name=editEntregaTp][data-tpentregaId=" + data.id + "] button").click(function(){
					$("#editarEntregaTpDialog").data('tpEntregaId', data.id)
						.data('descripcion', $(this).parents("tr").find("td").get(1).innerHTML)
						.data('archivo', $(this).parents("tr").find("td").get(2).innerHTML)
						.dialog("open");
				});
				
				$("#editarEntregaTpDialog").dialog("close");						
			},
			error: function(data) {
				$("#NuevoEntregaTpForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de editar el Trabajo Practico, inténtelo mas tarde.</p></div>")
				setTimeout(function(){
					$("#agregarEntregaTpDialog .infoDialog").hide(function(){
						$(this).remove();
					});
				}, 3000);	
			}
		})
	},
	crearNuevoComentarioAjax : function() {
		$.ajax({
			url: "/repouniversity/comentario/nuevoComentario",
			type: "POST",
			data: $("#nuevoComentarioForm").serialize(),
			success: function(data){
				$.gritter.add({
					title:'Comentario creada',
					text: 'La creacion del comentario fue exitosa.',
					sticky: false
				});
				
				
				tableComentario.row.add([
				                                          data.descripcion,
				                                          data.idPersona,
				                                          data.fechasys,
														  "<a href='#' name='deleteComentario' data-comentarioId='" + data.id + "'><button class='btn btn-danger btn-circle' type='button'><i class='fa fa-times'></i></button></a> " 
													]).draw();
													 
				//Agrego el evento de delete
				$("a[name='deleteComentario'][data-comentarioId=" + data.id + "] button").click(function(){
					$("#deleteComentarioDialog").data('comentarioId', $(this).parent().attr("data-comentarioId")).dialog("open");
				});
								
				$("#agregarComentarioDialog").dialog("close");						
			},
			error: function(data) {
				$("#NuevoComentarioForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de crear el comentario, inténtelo mas tarde.</p></div>")
				setTimeout(function(){
					$("#agregarComentarioDialog .infoDialog").hide(function(){
						$(this).remove();
					});
				}, 3000);	
			}
		})
	},
	deleteComentarioAjax : function(comentarioId) {
		$.ajax({
			url: "/repouniversity/comentario/eliminarComentario",
			type: "POST",
			data: {"comentarioId" : comentarioId},
			success: function(data){
				$.gritter.add({
					title:'Comentario eliminado',
					text: 'El comentario fue elimnado exitosamente.',
					sticky: false
				});
				
				tableComentario.row( $("#Comentario a[data-comentarioId=" + comentarioId + "]").parents('tr') ).remove().draw();
				$("#deleteComentarioDialog").dialog("close");						
			},
			error: function(data) {
				$.gritter.add({
					title: 'Eliminar Comentario',
					text: 'Hubo un problema al tratar de eliminar el comentario. Por favor inténtelo mas tarde.',
					class_name: 'gritter-light'
				});	
			}
		})
	},
	deleteEntregaTpAjax : function(tpEntregaId) {
		$.ajax({
			url: "/repouniversity/tpgrupo/eliminarTp",
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
		"pagingType": "full_numbers",
        deferRender:    true,
        scrollY:        280,
        scrollCollapse: false,
        scroller:       true,
		"language": {
            "lengthMenu": "Mostrar _MENU_ resultados por página",
            "zeroRecords": "No fueron encontrados resultados.",
            "info": "Pagina _PAGE_ of _PAGES_",
            "infoEmpty": "No hay resultados disponibles.",
            "infoFiltered": "(filtered from _MAX_ total records)",
            "search": "Filtrar por: "
        },
        "columnDefs": [
                       {"width": "10%", "targets": 0},
                       {"width": "40%", "targets": 1},
                       {"width": "30%", "targets": 2},
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
	
	$("#EntregaTP_wrapper .row").first().find(".col-sm-6").first().append($("#EntregaTP").parents(".ibox:first").find(".ibox-title"));
	
	$("#EntregaTP_length").remove();
	$("#EntregaTP thead").remove();
	
	tableComentario = $('#ComentarioTP').DataTable({
		retrieve: true,
		"processing" : false,
		"serverSide" : false,
		"pagingType": "full_numbers",
        deferRender:    true,
        scrollY:        280,
        scrollCollapse: false,
        scroller:       true,
		"language": {
            "lengthMenu": "Mostrar _MENU_ resultados por página",
            "zeroRecords": "No fueron encontrados resultados.",
            "info": "Pagina _PAGE_ of _PAGES_",
            "infoEmpty": "No hay resultados disponibles.",
            "infoFiltered": "(filtered from _MAX_ total records)",
            "search": "Filtrar por: "
        },
        "columnDefs": [
                       {"width": "35%", "targets": 0},
                       {"width": "40%", "targets": 1},
                       {"width": "25%", "targets": 2},
                       { orderable: false, targets: [11] }
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
	
	$("#ComentarioTP_wrapper .row").first().find(".col-sm-6").first().append($("#ComentarioTP").parents(".ibox:first").find(".ibox-title"));
	
	$("#ComentarioTP_length").remove();
	$("#ComentarioTP thead").remove();
	
	$("#agregarEntregaTpDialog").dialog({
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
			$('#NuevoEntregaTpForm').trigger("reset");
			$("#NuevoEntregaTpForm").find(".form-group").removeClass("has-error");
		},
		close: function(event, ui) {
		}
	});
	
	$("#agregarComentarioDialog").dialog({
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		hide: {effect: "fade", duration: 300},
		show: {effect: "fade", duration: 300},
		buttons: {
			"Crear": function() {
				if(tpEntregaAdmin.validacionFormlario("#nuevoComentarioForm")) {
					tpEntregaAdmin.crearNuevoComentarioAjax();
				}
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#nuevoComentarioForm').trigger("reset");
			$("#nuevoComentarioForm").find(".form-group").removeClass("has-error");
		},
		close: function(event, ui) {
		}
	});
	$("#editarEntregaTpDialog").dialog({
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
			$('#editarEntregaTpForm input[name=archivoId]').val($("#editarEntregaTpDialog").data('archivo'));
			
		},
		close: function(event, ui) {
		}
	});
	$("#deleteComentarioDialog").dialog({
		resizable: false,
		width:400,
		modal: true,
		autoOpen: false,
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Eliminar": function() {
				tpEntregaAdmin.deleteComentarioAjax($("#deleteComentarioDialog").data('comentarioId'));
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#NuevoComentarioForm').trigger("reset");
		},
		close: function(event, ui) {
		}
	});
	
	$("#deleteEntregaTpDialog").dialog({
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
			$('#NuevoEntregaTpForm').trigger("reset");
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
	$("#agregarComentarioButton").click(function() {
		$("#agregarComentarioDialog").dialog("open");
	});
	
	$("a[name=deleteComentario] button").click(function(){
		$("#deleteComentarioDialog").data('comentarioId', $(this).parent().attr("data-comentarioId")).dialog("open");
	});
	
	$("a[name=editEntregaTp] button").click(function(){
		$("#editarEntregaTpDialog").data('tpEntregaId', $(this).parent().attr("data-tpentregaId"))
			.data('tpEntregaId', $(this).parents("tr").find("td").get(0).innerHTML)
			.data('descripcion', $(this).parents("tr").find("td").get(1).innerHTML)
			.data('archivo', $(this).parents("tr").find("td").get(2).innerHTML)
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