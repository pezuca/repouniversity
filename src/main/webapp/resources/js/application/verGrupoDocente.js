var tpAdmin = {
	crearNuevoTpAjax : function() {
		$.ajax({
			url: "/repouniversity/grupo/nuevoTp",
			type: "POST",
			data: $("#nuevoTpForm").serialize(),
			success: function(data){
				$.gritter.add({
					title:'TP creado',
					text: 'La creacion del TP fue exitosa.',
					sticky: false
				});
				
				
				table.row.add([
				                                          data.id,
				                                          data.descripcion,
				                                          data.archivo,
				                                          data.nota,
				                                          "<a href='#' name='editTp' data-cursoId='" + data.id + "'><button class='btn btn-primary btn-circle' type='button'><i class='fa fa-pencil'></i></button></a> " + 
				  										  "<a href='#' name='deleteTp' data-cursoId='" + data.id + "'><button class='btn btn-danger btn-circle' type='button'><i class='fa fa-times'></i></button></a> " +
				  										  "<a href='/repouniversity/docente/verTrabajosPracticos?tpId=" + data.id + "' name='Ver' data-tpgrupoId=" + data.id + "><button class='btn btn-success btn-circle' type='button' data-toggle='tooltip' data-placement='top' data-original-title='Ver TP'><i class='fa fa-codepen'></i></button></a>"
				                                     ]).draw();
				
				//Agrego el evento de delete
				$("a[name='deleteTp'][data-cursoId=" + data.id + "] button").click(function(){
					$("#deleteTpDialog").data('cursoId', $(this).parent().attr("data-cursoId")).dialog("open");
				});
				
				$("a[name=editCurso][data-cursoId=" + data.id + "] button").click(function(){
					$("#editarTpDialog").data('cursoId', $(this).parent().attr("data-cursoId"))
						.data('nombre', $(this).parents("tr").find("td").get(1).innerHTML)
						.data('codigo', $(this).parents("tr").find("td").get(2).innerHTML)
						.data('descripcion', $(this).parents("tr").find("td").get(3).innerHTML)
						.dialog("open");
				});
				
				$("#agregarTpDialog").dialog("close");						
			},
			error: function(data) {
				$("#nuevoTpForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de crear el curso, inténtelo mas tarde.</p></div>")
				setTimeout(function(){
					$("#agregarTpDialog .infoDialog").hide(function(){
						$(this).remove();
					});
				}, 3000);	
			}
		})
	},
	editarTpAjax : function() {
		$.ajax({
			url: "/repouniversity/grupo/editarTp",
			type: "POST",
			data: $("#editarTpForm").serialize(),
			success: function(data){
				$.gritter.add({
					title:'TP editado',
					text: 'Los datos del Trabajo Practico fueron editados exitosamente.',
					sticky: false
				});
				
				var celdas = $("#GruposTP td a[data-tpgrupoId=" + data.id + "]").parents("tr").find("td");
				celdas.get(1).innerHTML = data.id;
				celdas.get(2).innerHTML = data.descripcion;
				celdas.get(3).innerHTML = data.archivo;
				celdas.get(4).innerHTML = data.nota;
								
				//Agrego el evento de delete
				$("a[name='deleteTp'][data-tpgrupoId=" + data.id + "] button").click(function(){
					$("#deleteTpDialog").data('tpId', $(this).parent().attr("data-tpgrupoId")).dialog("open");
				});
				
				$("a[name=editTp][data-tpgrupoId=" + data.id + "] button").click(function(){
					$("#editarTpDialog").data('tpId', data.id)
						.data('descripcion', $(this).parents("tr").find("td").get(2).innerHTML)
						.data('archivo', $(this).parents("tr").find("td").get(3).innerHTML)
						.data('nota', $(this).parents("tr").find("td").get(4).innerHTML)
						.dialog("open");
				});
				
				$("#editarTpDialog").dialog("close");						
			},
			error: function(data) {
				$("#nuevoTpForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de editar el Trabajo Practico, inténtelo mas tarde.</p></div>")
				setTimeout(function(){
					$("#agregarTpDialog .infoDialog").hide(function(){
						$(this).remove();
					});
				}, 3000);	
			}
		})
	},
	deleteCursoAjax : function(tpGrupoId) {
		$.ajax({
			url: "/repouniversity/admin/eliminarCurso",
			type: "POST",
			data: {"tpGrupoId" : tpGrupoId},
			success: function(data){
				$.gritter.add({
					title:'Tp eliminado',
					text: 'El Trabajo Practico fue elimnado exitosamente.',
					sticky: false
				});
				
				table.row( $("#listaCursos a[data-cursoId=" + cursoId + "]").parents('tr') ).remove().draw();
				$("#deleteTpDialog").dialog("close");						
			},
			error: function(data) {
				$.gritter.add({
					title: 'Eliminar Tp',
					text: 'Hubo un problema al tratar de eliminar el Tp. Por favor inténtelo mas tarde.',
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
	table = $('#GruposTP').DataTable({
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
	
	$("#agregarTpDialog").dialog({
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		autoResize:true,
		hide: {effect: "fade", duration: 300},
		show: {effect: "fade", duration: 300},
		buttons: {
			"Crear": function() {
				if(tpAdmin.validacionFormlario("#nuevoTpForm")) {
					tpAdmin.crearNuevoTpAjax();
				}
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#nuevoTpForm').trigger("reset");
			$("#nuevoTpForm").find(".form-group").removeClass("has-error");
		},
		close: function(event, ui) {
		}
	});
	
	$("#editarTpDialog").dialog({
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		autoResize:true,
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Ok": function() {
				if(tpAdmin.validacionFormlario("#editarTpForm")) {
					tpAdmin.editarTpAjax();
				}
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#editarTpForm').trigger("reset");
			$("#editarTpForm").find(".form-group").removeClass("has-error");
			$("#editarTpForm select option").removeAttr("selected");
			
			$('#editarTpForm input[name=tpId]').val($("#editarTpDialog").data('tpId'));
			$('#editarTpForm input[name=descripcion]').val($("#editarTpDialog").data('descripcion'));
			$('#editarTpForm input[name=archivoId]').val($("#editarTpDialog").data('archivo'));
			$('#editarTpForm input[name=nota]').val($("#editarTpDialog").data('nota'));
			
		},
		close: function(event, ui) {
		}
	});
	
	$("#deleteTpDialog").dialog({
		resizable: false,
		width:400,
		modal: true,
		autoOpen: false,
		autoResize:true,
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Eliminar": function() {
				tpAdmin.deleteCursoAjax($("#deleteTpDialog").data('cursoId'));
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#nuevoTpForm').trigger("reset");
		},
		close: function(event, ui) {
		}
	});
	
	$("#agregarTpButton").click(function() {
		$("#agregarTpDialog").dialog("open");
	});
	
	$("a[name=deleteCurso] button").click(function(){
		$("#deleteTpDialog").data('cursoId', $(this).parent().attr("data-tpgrupoId")).dialog("open");
	});
	
	$("a[name=editTp] button").click(function(){
		$("#editarTpDialog").data('tpId', $(this).parent().attr("data-tpgrupoId"))
			.data('tpId', $(this).parents("tr").find("td").get(0).innerHTML)
			.data('descripcion', $(this).parents("tr").find("td").get(1).innerHTML)
			.data('archivo', $(this).parents("tr").find("td").get(2).innerHTML)
			.data('nota', $(this).parents("tr").find("td").get(3).innerHTML)
			.dialog("open");
	});
});