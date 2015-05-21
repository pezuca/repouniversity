var GruposAdmin = {
	crearNuevoGrupoAjax : function() {
		$.ajax({
			url: "/repouniversity/docente/crearGrupo",
			type: "POST",
			data: $("#nuevoGrupoForm").serialize(),
			success: function(data){
				$.gritter.add({
					title:'Grupo creado',
					text: 'La creacion del Grupo fue exitosa.',
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
				                                          "<a href='#' name='editUser' data-userid='" + data.id + "'><button class='btn btn-primary btn-circle' type='button'><i class='fa fa-pencil'></i></button></a>" + 
				  										  "<a href='#' name='deleteUser' data-userid='" + data.id + "'><button class='btn btn-danger btn-circle' type='button'><i class='fa fa-times'></i></button></a>"
				                                     ]).draw();
				
				//Agrego el evento de delete
				$("a[name='deleteUser'][data-userid=" + data.id + "] button").click(function(){
					$("#deleteAlumnoDialog").data('userId', $(this).parent().attr("data-userid")).dialog("open");
				});
				
				$("a[name=editUser][data-userid=" + data.id + "] button").click(function(){
					$("#editarAlumnoDialog").data('userId', $(this).parent().attr("data-userid"))
						.data('nombre', $(this).parents("tr").find("td").get(1).innerHTML)
						.data('apellido', $(this).parents("tr").find("td").get(2).innerHTML)
						.data('user', $(this).parents("tr").find("td").get(3).innerHTML)
						.data('mail', $(this).parents("tr").find("td").get(4).innerHTML)
						.data('activo', $(this).parents("tr").find("td").get(5).innerHTML)
						.data('rol', $(this).parents("tr").find("td").get(6).innerHTML)
						.dialog("open");
				});
				
				$("#crearGrupoDialog").dialog("close");						
			},
			error: function(data) {
				$("#nuevoGrupoForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de crear el usuario, inténtelo mas tarde.</p></div>")
				setTimeout(function(){
					$("#crearGrupoDialog .infoDialog").hide(function(){
						$(this).remove();
					});
				}, 3000);	
			}
		})
	},
	obtenerAlumnosSinGrupoAjax : function() {
		$.ajax({
			url: "/repouniversity/curso/alumnoSinGrupo",
			type: "GET",
			data: $("#editarAlumnoForm").serialize(),
			success: function(data){
				$.gritter.add({
					title:'Usuario editado',
					text: 'Los datos del usuario fueron editados exitosamente.',
					sticky: false
				});
				
				var celdas = $("#listaPersonas td a[data-userid=" + data.id + "]").parents("tr").find("td");
				celdas.get(1).innerHTML = data.persona.nombre;
				celdas.get(2).innerHTML = data.persona.apellido;
				celdas.get(3).innerHTML = data.user;
				celdas.get(4).innerHTML = data.persona.mail;
				celdas.get(5).innerHTML = (data.activo == true ? 'Si':'No');
				celdas.get(6).innerHTML = data.rol;
				
				//Agrego el evento de delete
				$("a[name='deleteUser'][data-userid=" + data.id + "] button").click(function(){
					$("#deleteAlumnoDialog").data('userId', $(this).parent().attr("data-userid")).dialog("open");
				});
				
				$("a[name=editUser][data-userid=" + data.id + "] button").click(function(){
					$("#editarAlumnoDialog").data('userId', $(this).parent().attr("data-userid"))
						.data('nombre', $(this).parents("tr").find("td").get(1).innerHTML)
						.data('apellido', $(this).parents("tr").find("td").get(2).innerHTML)
						.data('user', $(this).parents("tr").find("td").get(3).innerHTML)
						.data('mail', $(this).parents("tr").find("td").get(4).innerHTML)
						.data('activo', $(this).parents("tr").find("td").get(5).innerHTML)
						.data('rol', $(this).parents("tr").find("td").get(6).innerHTML)
						.dialog("open");
				});
				
				$("#editarAlumnoDialog").dialog("close");						
			},
			error: function(data) {
				$("#nuevoGrupoForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de crear el usuario, inténtelo mas tarde.</p></div>")
				setTimeout(function(){
					$("#crearGrupoDialog .infoDialog").hide(function(){
						$(this).remove();
					});
				}, 3000);	
			}
		})
	},

	editarUsuarioAjax : function() {
		$.ajax({
			url: "editarUsuario",
			type: "POST",
			data: $("#editarAlumnoForm").serialize(),
			success: function(data){
				$.gritter.add({
					title:'Usuario editado',
					text: 'Los datos del usuario fueron editados exitosamente.',
					sticky: false
				});
				
				var celdas = $("#listaPersonas td a[data-userid=" + data.id + "]").parents("tr").find("td");
				celdas.get(1).innerHTML = data.persona.nombre;
				celdas.get(2).innerHTML = data.persona.apellido;
				celdas.get(3).innerHTML = data.user;
				celdas.get(4).innerHTML = data.persona.mail;
				celdas.get(5).innerHTML = (data.activo == true ? 'Si':'No');
				celdas.get(6).innerHTML = data.rol;
				
				//Agrego el evento de delete
				$("a[name='deleteUser'][data-userid=" + data.id + "] button").click(function(){
					$("#deleteAlumnoDialog").data('userId', $(this).parent().attr("data-userid")).dialog("open");
				});
				
				$("a[name=editUser][data-userid=" + data.id + "] button").click(function(){
					$("#editarAlumnoDialog").data('userId', $(this).parent().attr("data-userid"))
						.data('nombre', $(this).parents("tr").find("td").get(1).innerHTML)
						.data('apellido', $(this).parents("tr").find("td").get(2).innerHTML)
						.data('user', $(this).parents("tr").find("td").get(3).innerHTML)
						.data('mail', $(this).parents("tr").find("td").get(4).innerHTML)
						.data('activo', $(this).parents("tr").find("td").get(5).innerHTML)
						.data('rol', $(this).parents("tr").find("td").get(6).innerHTML)
						.dialog("open");
				});
				
				$("#editarAlumnoDialog").dialog("close");						
			},
			error: function(data) {
				$("#nuevoGrupoForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de crear el usuario, inténtelo mas tarde.</p></div>")
				setTimeout(function(){
					$("#crearGrupoDialog .infoDialog").hide(function(){
						$(this).remove();
					});
				}, 3000);	
			}
		})
	},
	deleteUsuarioAjax : function(userId) {
		$.ajax({
			url: "eliminarUsuario",
			type: "POST",
			data: {"userId" : userId},
			success: function(data){
				$.gritter.add({
					title:'Usuario eliminado',
					text: 'El usuario fue elimnado exitosamente.',
					sticky: false
				});
				
				$("#listaPersonas").DataTable().row( $("#listaPersonas a[data-userid=" + userId + "]").parents('tr') ).remove().draw();
				$("#deleteAlumnoDialog").dialog("close");						
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
	
	
	$("#crearGrupoDialog").dialog({
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		autoResize:true,
		hide: {effect: "fade", duration: 300},
		show: {effect: "fade", duration: 300},
		buttons: {
			"Crear": function() {
				if(GruposAdmin.validacionFormlario("#nuevoGrupoForm")) {
					GruposAdmin.crearNuevoGrupoAjax();
				}
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#nuevoGrupoForm').trigger("reset");
			$("#nuevoGrupoForm").find(".form-group").removeClass("has-error");
		},
		close: function(event, ui) {
		}
	});
	
	$("#crearGrupoButton").click(function() {
		$("#crearGrupoDialog").dialog("open");
	});
	
	$("#editarAlumnoDialog").dialog({
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		autoResize:true,
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Ok": function() {
				if(GruposAdmin.validacionFormlario("#editarAlumnoForm")) {
					GruposAdmin.editarUsuarioAjax();
				}
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#editarAlumnoForm').trigger("reset");
			$("#editarAlumnoForm").find(".form-group").removeClass("has-error");
			
			$('#editarAlumnoForm input[name=userId]').val($("#editarAlumnoDialog").data('userId'));
			$('#editarAlumnoForm input[name=nombre]').val($("#editarAlumnoDialog").data('nombre'));
			$('#editarAlumnoForm input[name=apellido]').val($("#editarAlumnoDialog").data('apellido'));
			$('#editarAlumnoForm input[name=mail]').val($("#editarAlumnoDialog").data('mail'));
			$('#editarAlumnoForm input[name=user]').val($("#editarAlumnoDialog").data('user'));
			$('#editarAlumnoForm input[name=activo]').val($("#editarAlumnoDialog").data('activo'));
			$('#editarAlumnoForm select[name=rol]').val($("#editarAlumnoDialog").data('rol'));
		},
		close: function(event, ui) {
		}
	});
	
	$("#deleteAlumnoDialog").dialog({
		resizable: false,
		width:400,
		modal: true,
		autoOpen: false,
		autoResize:true,
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Eliminar": function() {
				GruposAdmin.deleteUsuarioAjax($("#deleteAlumnoDialog").data('userId'));
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#nuevoGrupoForm').trigger("reset");
		},
		close: function(event, ui) {
		}
	});
	
	$("a[name=deleteUser] button").click(function(){
		$("#deleteAlumnoDialog").data('userId', $(this).parent().attr("data-userid")).dialog("open");
	});
	
	$("a[name=editUser] button").click(function(){
		$("#editarAlumnoDialog").data('userId', $(this).parent().attr("data-userid"))
			.data('userId', $(this).parents("tr").find("td").get(0).innerHTML)
			.data('nombre', $(this).parents("tr").find("td").get(1).innerHTML)
			.data('apellido', $(this).parents("tr").find("td").get(2).innerHTML)
			.data('user', $(this).parents("tr").find("td").get(3).innerHTML)
			.data('mail', $(this).parents("tr").find("td").get(4).innerHTML)
			.data('activo', $(this).parents("tr").find("td").get(5).innerHTML)
			.data('rol', $(this).parents("tr").find("td").get(6).innerHTML)
			.dialog("open");
	});
});