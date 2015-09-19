var usuariosAdmin = {
	crearNuevoUsuarioAjax : function() {
		$.ajax({
			url: "/repouniversity/admin/nuevoUsuario",
			type: "POST",
			data: $("#nuevoAlumnoForm").serialize(),
			success: function(data){
				$.gritter.add({
					title:'Usuario creado',
					text: 'La creacion del usuario fue exitosa.',
					sticky: false
				});
				
				var options = $("#nuevoAlumnoForm select[name=carrera] option");
				var carreraNuevo = "";
				for(var i = 0; i < options.size(); i++) {
					if(data.rol == 'alumno' && options.get(i).getAttribute("value") == data.alumno.idCarrera) {
						carreraNuevo = options.get(i).innerHTML;
						break;
					}
				}
				
				if($('input[name=miPermiso]').val() == '1'){
	                table.row.add([
	                      data.id,
	                      data.persona.nombre,
	                      data.persona.apellido,
	                      data.user,
	                      data.persona.mail,
	                      data.rol,
	                      carreraNuevo,
	                      "<a href='#' name='editUser' data-userid='" + data.id + "'><button class='btn btn-primary btn-circle' type='button'><i class='fa fa-pencil'></i></button></a>" + 
						  "<a href='#' name='deleteUser' data-userid='" + data.id + "'><button class='btn btn-danger btn-circle' type='button'><i class='fa fa-times'></i></button></a>"
					]).draw();
				}
				else if($('input[name=miPermiso]').val() == '2'){
	                table.row.add([
	                      data.id,
	                      data.persona.nombre,
	                      data.persona.apellido,
	                      data.user,
	                      data.persona.mail,
	                      data.rol,
	                      carreraNuevo,
	                      "<a href='#' name='editUser' data-userid='" + data.id + "'><button class='btn btn-primary btn-circle' type='button'><i class='fa fa-pencil'></i></button></a>"
					]).draw();
				}
				else{
	                table.row.add([
	                      data.id,
	                      data.persona.nombre,
	                      data.persona.apellido,
	                      data.user,
	                      data.persona.mail,
	                      data.rol,
	                      carreraNuevo,
	                      ""
					]).draw();
	     		}
				
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
						.data('rol', $(this).parents("tr").find("td").get(5).innerHTML)
						.data('carrera', $(this).parents("tr").find("td").get(6).innerHTML)
						.dialog("open");
				});
				
				$("#agregarAlumnoDialog").dialog("close");						
			},
			error: function(data) {		
				$("#nuevoAlumnoForm").after("<div class='infoDialog'><p class='infoPara'>" + data.responseText + "</p></div>")
				setTimeout(function(){
					$("#nuevoAlumnoForm .infoDialog").hide(function(){
						$(this).remove();
					});
				}, 5000);	
			}
		})
	},
	editarUsuarioAjax : function() {
		$.ajax({
			url: "/repouniversity/admin/editoUsuario",
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
				celdas.get(5).innerHTML = data.rol;
				
				var options = $("#editarAlumnoForm select[name=carrera] option");
				for(var i = 0; i < options.size(); i++) {
					if(data.rol == 'alumno' && options.get(i).getAttribute("value") == data.alumno.idCarrera) {
						celdas.get(6).setAttribute("data-carreraId", data.alumno.idCarrera);
						celdas.get(6).innerHTML = options.get(i).innerHTML;
						break;
					}
				}
				
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
						.data('rol', $(this).parents("tr").find("td").get(5).innerHTML)
						.data('carrera', $(this).parents("tr").find("td[data-carreraId]").attr("data-carreraId"))
						.dialog("open");
				});
				
				$("#editarAlumnoDialog").dialog("close");						
			},
			error: function(data) {
				$("#editarAlumnoForm").after("<div class='infoDialog'><p class='infoPara'>" + data.responseText + "</p></div>")
				setTimeout(function(){
					$("#editarAlumnoDialog .infoDialog").hide(function(){
						$(this).remove();
					});
				}, 5000);	
			}
		})
	},
	deleteUsuarioAjax : function(userId) {
		$.ajax({
			url: "/repouniversity/admin/eliminarUsuario",
			type: "POST",
			data: {"userId" : userId},
			success: function(data){
				$.gritter.add({
					title:'Usuario eliminado',
					text: 'El usuario fue elimnado exitosamente.',
					sticky: false
				});
				
				table.row( $("#listaPersonas a[data-userid=" + userId + "]").parents('tr') ).remove().draw();
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
		var inValid = /([^\s])/;

		elementos.each(function(index) {
			if(!inValid.test($(this).val()) || $(this).val() == null || ($(this).attr("type") == "mail" && !usuariosAdmin.validateEmail($(this).val()))) {
				$(this).parents(".form-group").addClass(" has-error");
				flag = false;
			} else {
				$(this).parents(".form-group").removeClass("has-error");
			}
		});
		
		return flag;
	}
	,
	validateEmail : function(email) {
	    var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	    return re.test(email);
	}
};

$(document).ready(function() {
	table = $('#listaPersonas').DataTable({
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
                       {"width": "5%", "targets": 0},
                       {"width": "10%", "targets": 1},
                       {"width": "15%", "targets": 2},
                       {"width": "10%", "targets": 3},
                       {"width": "20%", "targets": 4},
                       {"width": "8%", "targets": 5},
                       {"width": "15%", "targets": 6},
                       { orderable: false, targets: [7] }
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
	
	$("#listaPersonas_wrapper .row").first().find(".col-sm-6").first().append($("#listaPersonas").parents(".ibox:first").find(".ibox-title"));
	
	$("#listaPersonas_length").remove();
	$("#listaPersonas thead").remove();
	
	$("#agregarAlumnoDialog").dialog({
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		hide: {effect: "fade", duration: 300},
		show: {effect: "fade", duration: 300},
		buttons: {
			"Crear": function() {
				if(usuariosAdmin.validacionFormlario("#nuevoAlumnoForm")) {
					usuariosAdmin.crearNuevoUsuarioAjax();
				}
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#nuevoAlumnoForm').trigger("reset");
			$("#nuevoAlumnoForm").find(".form-group").removeClass("has-error");
			
			if($('#nuevoAlumnoForm .carreraSelect').val() == 'alumno'){
				$('#nuevoAlumnoForm .carreraSelect').show();
			} else {
				$('#nuevoAlumnoForm .carreraSelect').hide();
			}
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
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Ok": function() {
				if(usuariosAdmin.validacionFormlario("#editarAlumnoForm")) {
					usuariosAdmin.editarUsuarioAjax();
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
			$('#editarAlumnoForm select[name=rol]').val($("#editarAlumnoDialog").data('rol'));
			
			if($("#editarAlumnoDialog").data('rol') == 'alumno'){
				$('#editarAlumnoForm .carreraSelect').show();
				$('#editarAlumnoForm select[name=carrera] option').removeAttr("selected");
				$("#editarAlumnoForm select[name=carrera] option[value=" + $("#editarAlumnoDialog").data('carrera')  + "]").attr("selected", "selected");
				$("#editarAlumnoForm select[name=carrera]").trigger('chosen:updated');
			} else {
				$('#editarAlumnoForm .carreraSelect').hide();
			}
		},
		close: function(event, ui) {
		}
	});
	
	$("#deleteAlumnoDialog").dialog({
		position: "top",
		resizable: false,
		width:400,
		modal: true,
		autoOpen: false,
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
			.data('rol', $(this).parents("tr").find("td").get(5).innerHTML)
			.data('carrera', $(this).parents("tr").find("td[data-carreraId]").attr("data-carreraId"))
			.dialog("open");
	});
	
	$("select[name=carrera]").chosen({no_results_text:'No hay resultados para: '});
	
	$('#nuevoAlumnoForm select[name=rol]').change(function(){
		if($(this).val() != 'alumno') {
			$('#nuevoAlumnoForm .carreraSelect').hide();
		} else {
			$('#nuevoAlumnoForm .carreraSelect').show();
		}
	});
	
});