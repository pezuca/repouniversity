var usuariosAdmin = {
	crearNuevoUsuarioAjax : function() {
		$.ajax({
			url: "nuevoUsuario",
			type: "POST",
			data: $("#nuevoAlumnoForm").serialize(),
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
				
				$("#agregarAlumnoDialog").dialog("close");						
			},
			error: function(data) {
				$("#nuevoAlumnoForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de crear el usuario, inténtelo mas tarde.</p></div>")
				setTimeout(function(){
					$("#agregarAlumnoDialog .infoDialog").hide(function(){
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
				
//				usuariosAdmin.generarAlerta("success", ".wrapper-content", "Los datos del usuario fueron editados exitosamente.");
				
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
				$("#nuevoAlumnoForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de crear el usuario, inténtelo mas tarde.</p></div>")
				setTimeout(function(){
					$("#agregarAlumnoDialog .infoDialog").hide(function(){
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
	
	
	$("#agregarAlumnoDialog").dialog({
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		autoResize:true,
		hide: {effect: "fade", duration: 300},
		show: {effect: "fade", duration: 300},
		buttons: {
			"Crear": function() {
				usuariosAdmin.crearNuevoUsuarioAjax();
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#nuevoAlumnoForm').trigger("reset");
		},
		close: function(event, ui) {
		}
	});
	
	$("#agregarAlumnoButton").click(function() {
		$("#agregarAlumnoDialog").dialog("open");
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
				usuariosAdmin.editarUsuarioAjax();
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#editarAlumnoForm').trigger("reset");
			
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
				usuariosAdmin.deleteUsuarioAjax($("#deleteAlumnoDialog").data('userId'));
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#nuevoAlumnoForm').trigger("reset");
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