var cursosAdmin = {
	crearNuevoCursoAjax : function() {
		$.ajax({
			url: "nuevoUsuario",
			type: "POST",
			data: $("#nuevoCursoForm").serialize(),
			success: function(data){
				$.gritter.add({
					title:'Usuario creado',
					text: 'La creacion del usuario fue exitosa.',
					sticky: false
				});
				
				
				$("#listaPersonas").DataTable().row.add([
				                                          data.id,
				                                          data.persona.nombre,
				                                          data.persona.apellido,
				                                          data.user,
				                                          data.persona.mail,
				                                          data.activo == true ? 'Si':'No',
				                                          data.rol,
				                                          "<a href='#' name='editUser' data-cursoId='" + data.id + "'><button class='btn btn-primary btn-circle' type='button'><i class='fa fa-pencil'></i></button></a>" + 
				  										  "<a href='#' name='deleteUser' data-cursoId='" + data.id + "'><button class='btn btn-danger btn-circle' type='button'><i class='fa fa-times'></i></button></a>"
				                                     ]).draw();
				
				//Agrego el evento de delete
				$("a[name='deleteUser'][data-cursoId=" + data.id + "] button").click(function(){
					$("#deleteCursoDialog").data('cursoId', $(this).parent().attr("data-cursoId")).dialog("open");
				});
				
				$("a[name=editUser][data-cursoId=" + data.id + "] button").click(function(){
					$("#editarCursoDialog").data('cursoId', $(this).parent().attr("data-cursoId"))
						.data('nombre', $(this).parents("tr").find("td").get(1).innerHTML)
						.data('apellido', $(this).parents("tr").find("td").get(2).innerHTML)
						.data('user', $(this).parents("tr").find("td").get(3).innerHTML)
						.data('mail', $(this).parents("tr").find("td").get(4).innerHTML)
						.data('activo', $(this).parents("tr").find("td").get(5).innerHTML)
						.data('rol', $(this).parents("tr").find("td").get(6).innerHTML)
						.dialog("open");
				});
				
				$("#agregarCursoDialog").dialog("close");						
			},
			error: function(data) {
				$("#nuevoCursoForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de crear el usuario, inténtelo mas tarde.</p></div>")
				setTimeout(function(){
					$("#agregarCursoDialog .infoDialog").hide(function(){
						$(this).remove();
					});
				}, 3000);	
			}
		})
	},
	editarCursoAjax : function() {
		$.ajax({
			url: "editarUsuario",
			type: "POST",
			data: $("#editarCursoForm").serialize(),
			success: function(data){
				$.gritter.add({
					title:'Usuario editado',
					text: 'Los datos del usuario fueron editados exitosamente.',
					sticky: false
				});
				
				var celdas = $("#listaPersonas td a[data-cursoId=" + data.id + "]").parents("tr").find("td");
				celdas.get(1).innerHTML = data.persona.nombre;
				celdas.get(2).innerHTML = data.persona.apellido;
				celdas.get(3).innerHTML = data.user;
				celdas.get(4).innerHTML = data.persona.mail;
				celdas.get(5).innerHTML = (data.activo == true ? 'Si':'No');
				celdas.get(6).innerHTML = data.rol;
				
				//Agrego el evento de delete
				$("a[name='deleteUser'][data-cursoId=" + data.id + "] button").click(function(){
					$("#deleteCursoDialog").data('cursoId', $(this).parent().attr("data-cursoId")).dialog("open");
				});
				
				$("a[name=editUser][data-cursoId=" + data.id + "] button").click(function(){
					$("#editarCursoDialog").data('cursoId', $(this).parent().attr("data-cursoId"))
						.data('nombre', $(this).parents("tr").find("td").get(1).innerHTML)
						.data('apellido', $(this).parents("tr").find("td").get(2).innerHTML)
						.data('user', $(this).parents("tr").find("td").get(3).innerHTML)
						.data('mail', $(this).parents("tr").find("td").get(4).innerHTML)
						.data('activo', $(this).parents("tr").find("td").get(5).innerHTML)
						.data('rol', $(this).parents("tr").find("td").get(6).innerHTML)
						.dialog("open");
				});
				
				$("#editarCursoDialog").dialog("close");						
			},
			error: function(data) {
				$("#nuevoCursoForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de crear el usuario, inténtelo mas tarde.</p></div>")
				setTimeout(function(){
					$("#agregarCursoDialog .infoDialog").hide(function(){
						$(this).remove();
					});
				}, 3000);	
			}
		})
	},
	deleteCursoAjax : function(cursoId) {
		$.ajax({
			url: "eliminarCurso",
			type: "POST",
			data: {"cursoId" : cursoId},
			success: function(data){
				$.gritter.add({
					title:'Usuario eliminado',
					text: 'El usuario fue elimnado exitosamente.',
					sticky: false
				});
				
				$("#listaPersonas").DataTable().row( $("#listaPersonas a[data-cursoId=" + cursoId + "]").parents('tr') ).remove().draw();
				$("#deleteCursoDialog").dialog("close");						
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
	$('#listaPersonas').DataTable({
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
	
	$("#agregarCursoDialog").dialog({
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		autoResize:true,
		hide: {effect: "fade", duration: 300},
		show: {effect: "fade", duration: 300},
		buttons: {
			"Crear": function() {
				if(cursosAdmin.validacionFormlario("#nuevoCursoForm")) {
					cursosAdmin.crearNuevoCursoAjax();
				}
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#nuevoCursoForm').trigger("reset");
			$("#nuevoCursoForm").find(".form-group").removeClass("has-error");
		},
		close: function(event, ui) {
		}
	});
	
	$("#editarCursoDialog").dialog({
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		autoResize:true,
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Ok": function() {
				if(cursosAdmin.validacionFormlario("#editarCursoForm")) {
					cursosAdmin.editarUsuarioAjax();
				}
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#editarCursoForm').trigger("reset");
			$("#editarCursoForm").find(".form-group").removeClass("has-error");
			
			$('#editarCursoForm input[name=cursoId]').val($("#editarCursoDialog").data('cursoId'));
			$('#editarCursoForm input[name=nombre]').val($("#editarCursoDialog").data('nombre'));
			$('#editarCursoForm input[name=codigo]').val($("#editarCursoDialog").data('codigo'));
			$('#editarCursoForm input[name=descripcion]').val($("#editarCursoDialog").data('descripcion'));
			$('#editarCursoForm input[name=activo]').val($("#editarCursoDialog").data('activo'));
		},
		close: function(event, ui) {
		}
	});
	
	$("#deleteCursoDialog").dialog({
		resizable: false,
		width:400,
		modal: true,
		autoOpen: false,
		autoResize:true,
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Eliminar": function() {
				cursosAdmin.deleteCursoAjax($("#deleteCursoDialog").data('cursoId'));
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#nuevoCursoForm').trigger("reset");
		},
		close: function(event, ui) {
		}
	});
	
	$("#agregarCursoButton").click(function() {
		$("#agregarCursoDialog").dialog("open");
	});
	
	$("a[name=deleteCurso] button").click(function(){
		$("#deleteCursoDialog").data('cursoId', $(this).parent().attr("data-cursoId")).dialog("open");
	});
	
	$("a[name=editCurso] button").click(function(){
		$("#editarCursoDialog").data('cursoId', $(this).parent().attr("data-cursoId"))
			.data('cursoId', $(this).parents("tr").find("td").get(0).innerHTML)
			.data('nombre', $(this).parents("tr").find("td").get(1).innerHTML)
			.data('codigo', $(this).parents("tr").find("td").get(2).innerHTML)
			.data('descripcion', $(this).parents("tr").find("td").get(3).innerHTML)
			.data('activo', $(this).parents("tr").find("td").get(4).innerHTML)
			.dialog("open");
	});
});