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
				
				$("#cursosGrupos").DataTable().row.add([
                      data.nombre,
                      data.fechasys,
					  "<a href='#' name='deleteGrupo' data-grupoid='" + data.id + "'><button class='btn btn-danger btn-circle' type='button'><i class='fa fa-times'></i></button></a>" +
					  "<a class='verCurso' href='/repouniversity/docente/verGrupo?grupoId=" + data.id + "&bread=Ver grupo-3'><button class='btn btn-primary btn-circle'><i class='fa fa-arrow-right'></i></button></a>"
                 ]).draw();
				
				//Agrego el evento de delete
				$("a[name='deleteGrupo'][data-grupoid=" + data.id + "] button").click(function(){
					$("#deleteGrupoDialog").data('grupoId', $(this).parent().attr("data-grupoid")).dialog("open");
				});
			
				$("#crearGrupoDialog").dialog("close");						
			},
			error: function(data) {
				$("#nuevoGrupoForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de crear el grupo, inténtelo mas tarde.</p></div>")
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
	
	deleteGrupoAjax : function(grupoId) {
		$.ajax({
			url: "/repouniversity/docente/eliminarGrupo",
			type: "POST",
			data: {"grupoId" : grupoId},
			success: function(data){
				$.gritter.add({
					title:'Grupo eliminado',
					text: 'El grupo fue elimnado exitosamente.',
					sticky: false
				});
				
				$("#cursosGrupos").DataTable().row( $("#cursosGrupos a[data-grupoid=" + grupoId + "]").parents('tr') ).remove().draw();
				$("#deleteGrupoDialog").dialog("close");						
			},
			error: function(data) {
				$.gritter.add({
					title: 'Eliminar grupo',
					text: 'Hubo un problema al tratar de eliminar al grupo. Por favor inténtelo mas tarde.',
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
	gruposTable = $('#cursosGrupos').DataTable({
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
                       {"width": "40%", "targets": 0},
                       {"width": "40%", "targets": 1},
                       {"width": "20%", "targets": 2},
                       { orderable: false, targets: [2] }
                      ],
                      "order": [[ 0, "desc" ]]
	});
	
	notificacionesTable = $('#notificaciones').DataTable({
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
                       {"width": "35%", "targets": 0},
                       {"width": "40%", "targets": 1},
                       {"width": "25%", "targets": 2},
                       { orderable: false, targets: [2] }
                      ],
                      "order": [[ 0, "desc" ]]
	});
	
	$("#crearGrupoDialog").dialog({
		position: "top",
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		position: 'top',
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
			
			var cursoId = $("#crearGrupoDialog input[name=idcurso]").val();
			
			$.ajax({
				url: "/repouniversity/docente/alumnosSinGrupo",
				type: "GET",
				data: {"cursoId" : cursoId},
				success: function(data){
					$("select[name=alumnosIds]").empty();
					
					for(var i = 0; i < data.length; i++) {
						$("select[name=alumnosIds]").append("<option value='" + data[i].id + "'>" + 
								data[i].persona.nombre + ", " + data[i].persona.apellido + "</option>");
					}
					
					$("select[name=alumnosIds]").trigger("chosen:updated");
				}
			})
		},
		close: function(event, ui) {
		}
	});
	
	$("#crearGrupoButton").click(function() {
		$("#crearGrupoDialog").dialog("open");
	});
	
		
	$("#deleteGrupoDialog").dialog({
		position: "top",
		resizable: false,
		width:400,
		modal: true,
		autoOpen: false,
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Eliminar": function() {
				GruposAdmin.deleteGrupoAjax($("#deleteGrupoDialog").data('grupoId'));
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
	
	$("a[name=deleteGrupo] button").click(function(){
		$("#deleteGrupoDialog").data('grupoId', $(this).parent().attr("data-grupoid")).dialog("open");
	});
	
	$("select[name=alumnosIds]").chosen({no_results_text:'No hay resultados para: '});
});