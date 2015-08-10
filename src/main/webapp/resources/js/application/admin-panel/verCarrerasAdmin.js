var carrerasAdmin = {
	crearNuevaCarreraAjax : function() {
		$.ajax({
			url: "/repouniversity/admin/nuevoCarrera",
			type: "POST",
			data: $("#nuevoCarreraForm").serialize(),
			success: function(data){
				$.gritter.add({
					title:'Carrera creada',
					text: 'La creacion de la carrera fue exitosa.',
					sticky: false
				});
				
				var materias = "";
				for (var int = 0; int < data.materias.length; int++) {
					var element = data.materias[int];
					materias = materias + element.nombre + "  |  ";
				}
				materias = materias.trim().substring(0, materias.length - 4)
				
				table.row.add([
                      data.id,
                      data.nombre,
                      materias,
                      "<a href='#' name='editCarrera' data-carreraid='" + data.id + "'><button class='btn btn-primary btn-circle' type='button'><i class='fa fa-pencil'></i></button></a>" + 
					  "<a href='#' name='deleteCarrera' data-carreraid='" + data.id + "'><button class='btn btn-danger btn-circle' type='button'><i class='fa fa-times'></i></button></a>"
                 ]).draw();
				
				//Agrego el evento de delete
				$("a[name='deleteCarrera'][data-carreraid=" + data.id + "] button").click(function(){
					$("#deleteCarreraDialog").data('carreraId', $(this).parent().attr("data-carreraid")).dialog("open");
				});
				
				$("a[name=editCarrera][data-carreraid=" + data.id + "] button").click(function(){
					$("#editarCarreraDialog").data('carreraId', $(this).parent().attr("data-carreraid"))
						.data('nombre', $(this).parents("tr").find("td").get(1).innerHTML)
						.data('materias', $(this).parents("tr").find("td").get(2).innerHTML)
						.dialog("open");
				});
				
				$("#agregarCarreraDialog").dialog("close");						
			},
			error: function(data) {
				$("#nuevoCarreraForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de crear la carrera, inténtelo mas tarde.</p></div>")
				setTimeout(function(){
					$("#agregarCarreraDialog .infoDialog").hide(function(){
						$(this).remove();
					});
				}, 3000);	
			}
		})
	},
	editarCarreraAjax : function() {
		$.ajax({
			url: "/repouniversity/admin/editarCarrera",
			type: "POST",
			data: $("#editarCarreraForm").serialize(),
			success: function(data){
				$.gritter.add({
					title:'Carrera editada',
					text: 'Los datos de la carrera fueron editados exitosamente.',
					sticky: false
				});
				
				var celdas = $("#listaCarreras td a[data-carreraid=" + data.id + "]").parents("tr").find("td");
				celdas.get(1).innerHTML = data.nombre;
				
				var materias = "";
				for (var int = 0; int < data.materias.length; int++) {
					var element = data.materias[int];
					materias = materias + element.nombre + "  |  ";
				}
				materias = materias.trim().substring(0, materias.length - 4)
				
				celdas.get(2).innerHTML = materias;
				
				//Agrego el evento de delete
				$("a[name='deleteCarrera'][data-carreraid=" + data.id + "] button").click(function(){
					$("#deleteCarreraDialog").data('carreraId', $(this).parent().attr("data-carreraid")).dialog("open");
				});
				
				$("a[name=editCarrera][data-carreraid=" + data.id + "] button").click(function(){
					$("#editarCarreraDialog").data('carreraId', $(this).parent().attr("data-carreraid"))
						.data('nombre', $(this).parents("tr").find("td").get(1).innerHTML)
						.data('materias', $(this).parents("tr").find("td").get(2).innerHTML)
						.dialog("open");
				});
				
				$("#editarCarreraDialog").dialog("close");						
			},
			error: function(data) {
				$("#nuevaCarreraForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de crear el usuario, inténtelo mas tarde.</p></div>")
				setTimeout(function(){
					$("#agregarCarreraDialog .infoDialog").hide(function(){
						$(this).remove();
					});
				}, 3000);	
			}
		})
	},
	deleteCarreraAjax : function(carreraId) {
		$.ajax({
			url: "/repouniversity/admin/eliminarCarrera",
			type: "POST",
			data: {"carreraId" : carreraId},
			success: function(data){
				$.gritter.add({
					title:'Carrera eliminada',
					text: 'La carrera fue elimnada exitosamente.',
					sticky: false
				});
				
				table.row($("#listaCarreras a[data-carreraid=" + carreraId + "]").parents('tr')).remove().draw();
				$("#deleteCarreraDialog").dialog("close");						
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
	table = $('#listaCarreras').DataTable({
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
        },
        "columnDefs": [
                       {"width": "5%", "targets": 0},
                       {"width": "20%", "targets": 1},
                       {"width": "60%", "targets": 2},
                       {"width": "15%", "targets": 3}
                      ]
	});

	$("#listaCarrerasTable_length").remove();
	$("#listaCarreras_info").remove();
	
	
	
	$("#agregarCarreraDialog").dialog({
		position: "top",
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		hide: {effect: "fade", duration: 300},
		show: {effect: "fade", duration: 300},
		buttons: {
			"Crear": function() {
				if(carrerasAdmin.validacionFormlario("#nuevaCarreraForm")) {
					carrerasAdmin.crearNuevaCarreraAjax();
				}
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#nuevaCarreraForm').trigger("reset");
			$("#nuevaCarreraForm").find(".form-group").removeClass("has-error");
		},
		close: function(event, ui) {
		}
	});
	
	$("#editarCarreraDialog").dialog({
		position: "top",
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Ok": function() {
				if(carrerasAdmin.validacionFormlario("#editarCarreraForm")) {
					carrerasAdmin.editarCarreraAjax();
				}
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#editarCarreraForm').trigger("reset");
			$("#editarCarreraForm").find(".form-group").removeClass("has-error");
			
			$('#editarCarreraForm input[name=carreraId]').val($("#editarCarreraDialog").data('carreraId'));
			$('#editarCarreraForm input[name=nombre]').val($("#editarCarreraDialog").data('nombre'));
			
			var materias = $("#editarCarreraDialog").data('materias').split("|");
			var arrayMat = [];
			
			for (var int = 0; int < materias.length; int++) {
				var element = materias[int];
				$('#editarCarreraForm select[name=materias] option').each(function(index){
					if($(this).text() == element.trim()) {
						arrayMat.push($(this).val());
					}
				});
			}
			
			$('#editarCarreraForm select[name=materias]').val(arrayMat);
			$('#editarCarreraForm select[name=materias]').trigger("chosen:updated");
		},
		close: function(event, ui) {
		}
	});
	
	$("#deleteCarreraDialog").dialog({
		position: "top",
		resizable: false,
		width:400,
		modal: true,
		autoOpen: false,
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Eliminar": function() {
				carrerasAdmin.deleteCarreraAjax($("#deleteCarreraDialog").data('carreraId'));
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#nuevaCarreraForm').trigger("reset");
		},
		close: function(event, ui) {
		}
	});
	
	$("#agregarCarreraButton").click(function() {
		$("#agregarCarreraDialog").dialog("open");
	});
	
	$("a[name=deleteCarrera] button").click(function(){
		$("#deleteCarreraDialog").data('carreraId', $(this).parent().attr("data-carreraid")).dialog("open");
	});
	
	$("a[name=editCarrera] button").click(function(){
		$("#editarCarreraDialog").data('carreraId', $(this).parent().attr("data-carreraid"))
			.data('carreraId', $(this).parents("tr").find("td").get(0).innerHTML)
			.data('nombre', $(this).parents("tr").find("td").get(1).innerHTML)
			.data('materias', $(this).parents("tr").find("td").get(2).innerHTML)
			.dialog("open");
	});
	
	$("select[name=materias]").chosen({no_results_text:'No hay resultados para: '});
});