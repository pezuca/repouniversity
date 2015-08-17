var materiasAdmin = {
	crearNuevaMateriaAjax : function() {
		$.ajax({
			url: "/repouniversity/admin/nuevoMateria",
			type: "POST",
			data: $("#nuevoMateriaForm").serialize(),
			success: function(data){
				$.gritter.add({
					title:'Materia creada',
					text: 'La creacion de la materia fue exitosa.',
					sticky: false
				});
				
				
				table.row.add([
				                                          data.id,
				                                          data.nombre,
				                                          data.descripcion,
				                                          "<a href='#' name='editMateria' data-materiaid='" + data.id + "'><button class='btn btn-primary btn-circle' type='button'><i class='fa fa-pencil'></i></button></a>" + 
				  										  "<a href='#' name='deleteMateria' data-materiaid='" + data.id + "'><button class='btn btn-danger btn-circle' type='button'><i class='fa fa-times'></i></button></a>"
				                                     ]).draw();
				
				//Agrego el evento de delete
				$("a[name='deleteMateria'][data-materiaid=" + data.id + "] button").click(function(){
					$("#deleteMateriaDialog").data('materiaId', $(this).parent().attr("data-materiaid")).dialog("open");
				});
				
				$("a[name=editMateria][data-materiaid=" + data.id + "] button").click(function(){
					$("#editarMateriaDialog").data('materiaId', $(this).parent().attr("data-materiaid"))
						.data('nombre', $(this).parents("tr").find("td").get(1).innerHTML)
						.data('descripcion', $(this).parents("tr").find("td").get(2).innerHTML)
						.dialog("open");
				});
				
				$("#agregarMateriaDialog").dialog("close");						
			},
			error: function(data) {
				$("#nuevoMateriaForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de crear la materia, inténtelo mas tarde.</p></div>")
				setTimeout(function(){
					$("#agregarMateriaDialog .infoDialog").hide(function(){
						$(this).remove();
					});
				}, 3000);	
			}
		})
	},
	editarMateriaAjax : function() {
		$.ajax({
			url: "/repouniversity/admin/editarMateria",
			type: "POST",
			data: $("#editarMateriaForm").serialize(),
			success: function(data){
				$.gritter.add({
					title:'Materia editada',
					text: 'Los datos de la materia fueron editados exitosamente.',
					sticky: false
				});
				
				var celdas = $("#listaMaterias td a[data-materiaid=" + data.id + "]").parents("tr").find("td");
				celdas.get(1).innerHTML = data.nombre;
				celdas.get(2).innerHTML = data.descripcion;
				
				//Agrego el evento de delete
				$("a[name='deleteUser'][data-materiaid=" + data.id + "] button").click(function(){
					$("#deleteMateriaDialog").data('materiaId', $(this).parent().attr("data-materiaid")).dialog("open");
				});
				
				$("a[name=editUser][data-materiaid=" + data.id + "] button").click(function(){
					$("#editarMateriaDialog").data('materiaId', $(this).parent().attr("data-materiaid"))
						.data('nombre', $(this).parents("tr").find("td").get(1).innerHTML)
						.data('descripcion', $(this).parents("tr").find("td").get(2).innerHTML)
						.dialog("open");
				});
				
				$("#editarMateriaDialog").dialog("close");						
			},
			error: function(data) {
				$("#nuevoMateriaForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de crear el usuario, inténtelo mas tarde.</p></div>")
				setTimeout(function(){
					$("#agregarMateriaDialog .infoDialog").hide(function(){
						$(this).remove();
					});
				}, 3000);	
			}
		})
	},
	deleteMateriaAjax : function(materiaId) {
		$.ajax({
			url: "/repouniversity/admin/eliminarMateria",
			type: "POST",
			data: {"materiaId" : materiaId},
			success: function(data){
				$.gritter.add({
					title:'Usuario eliminado',
					text: 'El usuario fue elimnado exitosamente.',
					sticky: false
				});
				
				table.row($("#listaMaterias a[data-materiaid=" + materiaId + "]").parents('tr')).remove().draw();
				$("#deleteMateriaDialog").dialog("close");						
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
	generarAlerta: function(tipo, containerSelector, texto) {
		$(containerSelector).prepend("<div class='alert alert-" + tipo + " alert-dismissable'>" +
				"<button aria-hidden='true' data-dismiss='alert' class='close' type='button'>×</button>" +
				texto + "</div>");
	},
	validacionFormlario: function(formularioSelector) {
		var elementos = $(formularioSelector).find("input[required], select[required]");
		var flag = true;
		var inValid = new RegExp("[\\s]");

		elementos.each(function(index) {
			if(inValid.test($(this).val())) {
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
	table = $('#listaMaterias').DataTable({
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
	
	
	$("#agregarMateriaDialog").dialog({
		position: "top",
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		hide: {effect: "fade", duration: 300},
		show: {effect: "fade", duration: 300},
		buttons: {
			"Crear": function() {
				if(materiasAdmin.validacionFormlario("#nuevoMateriaForm")) {
					materiasAdmin.crearNuevaMateriaAjax();
				}
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#nuevoMateriaForm').trigger("reset");
			$("#nuevoMateriaForm").find(".form-group").removeClass("has-error");
		},
		close: function(event, ui) {
		}
	});
	
	$("#editarMateriaDialog").dialog({
		position: "top",
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Ok": function() {
				if(materiasAdmin.validacionFormlario("#editarMateriaForm")) {
					materiasAdmin.editarMateriaAjax();
				}
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#editarMateriaForm').trigger("reset");
			$("#editarMateriaForm").find(".form-group").removeClass("has-error");
			
			$('#editarMateriaForm input[name=materiaId]').val($("#editarMateriaDialog").data('materiaId'));
			$('#editarMateriaForm input[name=nombre]').val($("#editarMateriaDialog").data('nombre'));
			$('#editarMateriaForm input[name=descripcion]').val($("#editarMateriaDialog").data('descripcion'));
		},
		close: function(event, ui) {
		}
	});
	
	$("#deleteMateriaDialog").dialog({
		position: "top",
		resizable: false,
		width:400,
		modal: true,
		autoOpen: false,
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Eliminar": function() {
				materiasAdmin.deleteMateriaAjax($("#deleteMateriaDialog").data('materiaId'));
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#nuevoMateriaForm').trigger("reset");
		},
		close: function(event, ui) {
		}
	});
	
	$("#agregarMateriaButton").click(function() {
		$("#agregarMateriaDialog").dialog("open");
	});
	
	$("a[name=deleteMateria] button").click(function(){
		$("#deleteMateriaDialog").data('materiaId', $(this).parent().attr("data-materiaid")).dialog("open");
	});
	
	$("a[name=editMateria] button").click(function(){
		$("#editarMateriaDialog").data('materiaId', $(this).parent().attr("data-materiaid"))
			.data('materiaId', $(this).parents("tr").find("td").get(0).innerHTML)
			.data('nombre', $(this).parents("tr").find("td").get(1).innerHTML)
			.data('descripcion', $(this).parents("tr").find("td").get(2).innerHTML)
			.dialog("open");
	});
});