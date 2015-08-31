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
				var tresMaterias = "";
				
				for (var j = 0; j < data.materias.length; j++) {
					var element = data.materias[j];
					materias = materias + element.nombre + "  |  ";
					 if (j <3){
						 tresMaterias = tresMaterias + element.nombre + "  |  ";
					 }
						 
				}
				materias = materias.trim().substring(0, materias.length - 4)
				tresMaterias = tresMaterias.trim().substring(0, tresMaterias.length - 4)
				
				
				if($('input[name=miPermiso]').val() == '1'){
	                table.row.add([
	                      data.id,
	                      data.nombre,
	                      tresMaterias + "<a href='#' name='verCarrera' data-carreraId='" + data.id + "'><button class='btn btn-primary btn-circle' type='button'><i class='fa fa-search'></i></button></a>",
	                      materias,
	                      "<a href='#' name='editCarrera' data-carreraid='" + data.id + "'><button class='btn btn-primary btn-circle' type='button'><i class='fa fa-pencil'></i></button></a>" + 
						  "<a href='#' name='deleteCarrera' data-carreraid='" + data.id + "'><button class='btn btn-danger btn-circle' type='button'><i class='fa fa-times'></i></button></a>"
						  
	                 ]).draw();
				}
				else if($('input[name=miPermiso]').val() == '2'){
	                table.row.add([
	                      data.id,
	                      data.nombre,
	                      tresMaterias + "<a href='#' name='verCarrera' data-carreraId='" + data.id + "'><button class='btn btn-primary btn-circle' type='button'><i class='fa fa-search'></i></button></a>",
	                      materias,
	                      "<a href='#' name='editCarrera' data-carreraid='" + data.id + "'><button class='btn btn-primary btn-circle' type='button'><i class='fa fa-pencil'></i></button></a>" 
						  ]).draw();
				}
				else{
	                table.row.add([
	     	                      data.id,
	     	                      data.nombre,
	     	                      tresMaterias + "<a href='#' name='verCarrera' data-carreraId='" + data.id + "'><button class='btn btn-primary btn-circle' type='button'><i class='fa fa-search'></i></button></a>",
	     	                      materias,
	     	                      ""
	     	                 ]).draw();
	     				}
				
				var celdas = $("#listaCarreras td a[data-carreraid=" + data.id + "]").parents("tr").find("td");
				celdas.get(3).setAttribute('style', 'display: none;');
				
				//Agrego el evento de delete
				$("a[name='deleteCarrera'][data-carreraid=" + data.id + "] button").click(function(){
					$("#deleteCarreraDialog").data('carreraId', $(this).parent().attr("data-carreraid")).dialog("open");
				});
				
				$("a[name=editCarrera][data-carreraid=" + data.id + "] button").click(function(){
					$("#editarCarreraDialog").data('carreraId', $(this).parent().attr("data-carreraid"))
						.data('nombre', $(this).parents("tr").find("td").get(1).innerHTML)
						.data('materias', $(this).parents("tr").find("td").get(3).innerHTML)
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
				var tresMaterias = "";
				
				for (var i = 0; i < data.materias.length; i++) {
					var element = data.materias[i];
					materias = materias + element.nombre + "  |  ";
					 if (i <3){
						 tresMaterias = tresMaterias + element.nombre + "  |  ";
					 }
						 
				}
				materias = materias.trim().substring(0, materias.length - 4)
				tresMaterias = tresMaterias.trim().substring(0, tresMaterias.length - 4)
				
				celdas.get(3).innerHTML = materias;
				celdas.get(2).innerHTML = tresMaterias;
				
				//Agrego el evento de delete
				$("a[name='deleteCarrera'][data-carreraid=" + data.id + "] button").click(function(){
					$("#deleteCarreraDialog").data('carreraId', $(this).parent().attr("data-carreraid")).dialog("open");
				});
				
				$("a[name=editCarrera][data-carreraid=" + data.id + "] button").click(function(){
					$("#editarCarreraDialog").data('carreraId', $(this).parent().attr("data-carreraid"))
						.data('nombre', $(this).parents("tr").find("td").get(1).innerHTML)
						.data('materias', $(this).parents("tr").find("td").get(3).innerHTML)
						.dialog("open");
				});
				
				$("#editarCarreraDialog").dialog("close");						
			},
			error: function(data) {
				$("#nuevoCarreraForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de crear el usuario, inténtelo mas tarde.</p></div>")
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
	table = $('#listaCarreras').DataTable({
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
           {"width": "5%", "targets": 0},
           {"width": "20%", "targets": 1},
           {"width": "60%", "targets": 2},
           {"width": "15%", "targets": 3},
           { orderable: false, targets: [3] }
          ],
        "order": [[ 0, "desc" ]]
	});

	$("#agregarCarreraDialog").dialog({
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		hide: {effect: "fade", duration: 300},
		show: {effect: "fade", duration: 300},
		buttons: {
			"Crear": function() {
				if(carrerasAdmin.validacionFormlario("#nuevoCarreraForm")) {
					carrerasAdmin.crearNuevaCarreraAjax();
				}
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#nuevoCarreraForm').trigger("reset");
			$('#nuevoCarreraForm select[name=materias]').trigger("chosen:updated");
			$("#nuevoCarreraForm").find(".form-group").removeClass("has-error");
		},
		close: function(event, ui) {
		}
	});
	
	$("#editarCarreraDialog").dialog({
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
	$("#verCarreraDialog").dialog({
		resizable: false,
		width:900,
		modal: true,
		autoOpen: false,
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Ok": function() {
				$(this).dialog("close");
			}
		
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#verCarreraForm').trigger("reset");
			$("#verCarreraForm").find(".form-group").removeClass("has-error");
			
			$('#verCarreraForm input[name=carreraId]').val($("#verCarreraDialog").data('carreraId'));
			$('#verCarreraForm input[name=nombre]').val($("#verCarreraDialog").data('nombre'));
			
			var materias = $("#verCarreraDialog").data('materias').split("|");
			var arrayMat = [];
			
			for (var int = 0; int < materias.length; int++) {
				var element = materias[int];
				$('#verCarreraForm select[name=materias] option').each(function(index){
					if($(this).text() == element.trim()) {
						arrayMat.push($(this).val());
					}
				});
			}
			
			$('#verCarreraForm select[name=materias]').val(arrayMat);
			$('#verCarreraForm select[name=materias]').trigger("chosen:updated");
		},
		close: function(event, ui) {
		}
	});
	
	$("#deleteCarreraDialog").dialog({
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
			$('#nuevoCarreraForm').trigger("reset");
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
			.data('materias', $(this).parents("tr").find("td").get(3).innerHTML)
			.dialog("open");
	});
	
	$("a[name=verCarrera] button").click(function(){
		$("#verCarreraDialog").data('carreraId', $(this).parent().attr("data-carreraid"))
			.data('carreraId', $(this).parents("tr").find("td").get(0).innerHTML)
			.data('nombre', $(this).parents("tr").find("td").get(1).innerHTML)
			.data('materias', $(this).parents("tr").find("td").get(3).innerHTML)
			.dialog("open");
	});
	
	$("select[name=materias]").chosen({no_results_text:'No hay resultados para: '});
});