var tpAdmin = {
	crearNuevoTpAjax : function() {

		var dataFiles = new FormData($("#nuevoTpForm")[0]);
		
		$.ajax({
			url: "/repouniversity/grupo/nuevoTp",
			type: "POST",
			data: dataFiles,
			processData: false,
			contentType: false,
			success: function(data){
				$.gritter.add({
					title:'TP creado',
					text: 'La creacion del TP fue exitosa.',
					sticky: false
				});

				if($('input[name=miPermiso]').val() == '1'){
		               table.row.add([
		                  data.id,
		                  data.descripcion,
		                  data.archivoNombre,
		                  //data.nota,
		                  "          ",
					                                          "<a name='editTp' data-tpgrupoId='" + data.id + "'><button class='btn btn-primary btn-circle' type='button'><i class='fa fa-pencil'></i></button></a> " + 
					  										  "<a name='deleteTp' data-tpgrupoId='" + data.id + "'><button class='btn btn-danger btn-circle' type='button'><i class='fa fa-times'></i></button></a> " +
															  "<a href='/repouniversity/grupo/verTrabajosPracticos?tpGrupoId=" + data.id + "' name='Ver' data-tpgrupoId=" + data.id + "><button class='btn btn-primary btn-circle' type='button' data-toggle='tooltip' data-placement='top' data-original-title='Ver TP'><i class='fa fa-arrow-right'></i></button></a>" +
															  "<a href='/repouniversity/vistaPrevia?archivoId=" + data.archivo + "' name='verArchivo' data-tpgrupoId=" + data.id + "><button class='btn btn-success btn-circle' type='button' data-toggle='tooltip' data-placement='top' data-original-title='Ver Archivo'><i class='fa fa-search'></i></button></a>" +
															  "<a href='/repouniversity/bajarArchivo?archivoId=" + data.archivo + "' name='dowloadArchivo' data-tpgrupoId=" + data.id + "><button class='btn btn-success btn-circle' type='button' data-toggle='tooltip' data-placement='top' data-original-title='Bajar Archivo'><i class='fa fa-download'></i></button></a>"
													  			
						]).draw();
					}
					else if($('input[name=miPermiso]').val() == '2'){
		                table.row.add([
		                  data.id,
		                  data.descripcion,
		                  data.archivoNombre,
		                  //data.nota,
		                  "          ",
					                                          "<a name='editTp' data-tpgrupoId='" + data.id + "'><button class='btn btn-primary btn-circle' type='button'><i class='fa fa-pencil'></i></button></a> " + 
					  										  "<a href='/repouniversity/grupo/verTrabajosPracticos?tpGrupoId=" + data.id + "' name='Ver' data-tpgrupoId=" + data.id + "><button class='btn btn-primary btn-circle' type='button' data-toggle='tooltip' data-placement='top' data-original-title='Ver TP'><i class='fa fa-arrow-right'></i></button></a>" +
															  "<a href='/repouniversity/vistaPrevia?archivoId=" + data.archivo + "' name='verArchivo' data-tpgrupoId=" + data.id + "><button class='btn btn-success btn-circle' type='button' data-toggle='tooltip' data-placement='top' data-original-title='Ver Archivo'><i class='fa fa-search'></i></button></a>" +
															  "<a href='/repouniversity/bajarArchivo?archivoId=" + data.archivo + "' name='dowloadArchivo' data-tpgrupoId=" + data.id + "><button class='btn btn-success btn-circle' type='button' data-toggle='tooltip' data-placement='top' data-original-title='Bajar Archivo'><i class='fa fa-download'></i></button></a>"
													  			
						]).draw();
					}
					else{
						table.row.add([
		                  data.id,
		                  data.descripcion,
		                  data.archivoNombre,
		                  //data.nota,
		                  "          ",
															  "<a href='/repouniversity/grupo/verTrabajosPracticos?tpGrupoId=" + data.id + "' name='Ver' data-tpgrupoId=" + data.id + "><button class='btn btn-primary btn-circle' type='button' data-toggle='tooltip' data-placement='top' data-original-title='Ver TP'><i class='fa fa-arrow-right'></i></button></a>" +
															  "<a href='/repouniversity/vistaPrevia?archivoId=" + data.archivo + "' name='verArchivo' data-tpgrupoId=" + data.id + "><button class='btn btn-success btn-circle' type='button' data-toggle='tooltip' data-placement='top' data-original-title='Ver Archivo'><i class='fa fa-search'></i></button></a>" +
															  "<a href='/repouniversity/bajarArchivo?archivoId=" + data.archivo + "' name='dowloadArchivo' data-tpgrupoId=" + data.id + "><button class='btn btn-success btn-circle' type='button' data-toggle='tooltip' data-placement='top' data-original-title='Bajar Archivo'><i class='fa fa-download'></i></button></a>"
													  			
						]).draw();
		     		}
				
				//Agrego el evento de delete
				$("a[name='deleteTp'][data-tpgrupoId=" + data.id + "] button").click(function(){
					$("#deleteTpDialog").data('tpId', $(this).parent().attr("data-tpgrupoId")).dialog("open");
				});
				
				$("a[name=editTp][data-tpgrupoId=" + data.id + "] button").click(function(){
					$("#editarTpDialog").data('tpId', $(this).parent().attr("data-tpgrupoId"))
						.data('descripcion', $(this).parents("tr").find("td").get(1).innerHTML)
						.data('archivo', $(this).parents("tr").find("td").get(2).innerHTML)
						.data('nota', $(this).parents("tr").find("td").get(3).innerHTML)
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
				celdas.get(0).innerHTML = data.id;
				celdas.get(1).innerHTML = data.descripcion;
				celdas.get(2).innerHTML = data.archivoNombre;
				celdas.get(3).innerHTML = data.nota;
								
				//Agrego el evento de delete
				$("a[name='deleteTp'][data-tpgrupoId=" + data.id + "] button").click(function(){
					$("#deleteTpDialog").data('tpId', $(this).parent().attr("data-tpgrupoId")).dialog("open");
				});
				
				$("a[name=editTp][data-tpgrupoId=" + data.id + "] button").click(function(){
					$("#editarTpDialog").data('tpId', data.id)
						.data('descripcion', $(this).parents("tr").find("td").get(1).innerHTML)
						.data('archivo', $(this).parents("tr").find("td").get(2).innerHTML)
						.data('nota', $(this).parents("tr").find("td").get(3).innerHTML)
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
	deleteTpAjax : function(tpId) {
		$.ajax({
			url: "/repouniversity/grupo/eliminarTp",
			type: "POST",
			data: {"tpId" : tpId},
			success: function(data){
				$.gritter.add({
					title:'Tp eliminado',
					text: 'El Trabajo Practico fue elimnado exitosamente.',
					sticky: false
				});
				
				table.row( $("#GruposTP a[data-tpgrupoId=" + tpId + "]").parents('tr') ).remove().draw();
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
	deleteAlumnoAjax : function(alumnoId, cursoId) {
		$.ajax({
			url: "/repouniversity/grupo/eliminarAlumno",
			type: "POST",
			data: {"alumnoId" : alumnoId, "cursoId" : cursoId},
			success: function(data){
				$.gritter.add({
					title:'Alumno eliminado',
					text: 'El Alumno fue elimnado exitosamente.',
					sticky: false
				});
				
				tableGrupo.row( $("#GruposAlumnos a[data-alumnoId=" + alumnoId + "]").parents('tr') ).remove().draw();
				$("#deleteAlumnoDialog").dialog("close");						
			},
			error: function(data) {
				$.gritter.add({
					title: 'Eliminar Alumno',
					text: 'Hubo un problema al tratar de eliminar el Alumno. Por favor inténtelo mas tarde.',
					class_name: 'gritter-light'
				});	
			}
		})
	},
	crearNuevoAlumnoAjax : function() {
		$.ajax({
			url: "/repouniversity/grupo/agregarAlumnos",
			type: "POST",
			data: $("#nuevoAlumnoForm").serialize(),
			success: function(data){
				$.gritter.add({
					title:'Grupo modificado',
					text: 'El grupo fue modificado de forma exitosa.',
					sticky: false
				});
				
				tableGrupo.clear().draw();
				
				for(var i= 0; i < data.alumnos.length; i++) {
					if($('input[name=miPermiso]').val() == '1'){
			               tableGrupo.row.add([
			                    data.alumnos[i].id,
			                    data.alumnos[i].persona.apellido + ", " + data.alumnos[i].persona.nombre,
			                    data.alumnos[i].persona.mail,
			                   "<a name='deleteAlumno' data-alumnoId='" + data.alumnos[i].id + "'><button class='btn btn-danger btn-circle' type='button'><i class='fa fa-times'></i></button></a> "
				            ]).draw();
						}
						else{
							tableGrupo.row.add([
			                    data.alumnos[i].id,
			                    data.alumnos[i].persona.apellido + ", " + data.alumnos[i].persona.nombre,
			                    data.alumnos[i].persona.mail,
			                   ""
				            ]).draw();
			     	}
					
					//Agrego el evento de delete
					$("a[name='deleteAlumno'][data-alumnoId=" + data.alumnos[i].id + "] button").click(function(){
						$("#deleteAlumnoDialog").data('alumnoId', $(this).parent().attr("data-alumnoId"))
						.data('cursoId', $("input[name=cursoId]").val())
						.dialog("open");
					});
				}
				
				$(".grupo-titulo h5").text("Nombre de grupo: " + data.nombre);
				
				$("#agregarAlumnoDialog").dialog("close");						
			},
			error: function(data) {
				$("#nuevoAlumnoForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de crear el curso, inténtelo mas tarde.</p></div>")
				setTimeout(function(){
					$("#agregarAlumnoDialog .infoDialog").hide(function(){
						$(this).remove();
					});
				}, 3000);	
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
	table = $('#GruposTP').DataTable({
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
                       {"width": "28%", "targets": 1},
                       {"width": "28%", "targets": 2},
                       {"width": "14%", "targets": 3},
                       { orderable: false, targets: [4] }
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
	
	$("#GruposTP_wrapper .row").first().find(".col-sm-6").first().append($("#GruposTP").parents(".ibox:first").find(".ibox-title"));
	
	$("#GruposTP_length").remove();
	$("#GruposTP thead").remove();
	
	tableGrupo = $('#GruposAlumnos').DataTable({
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
                       {"width": "40%", "targets": 2},
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
	
	$("#GruposAlumnos_wrapper .row").first().find(".col-sm-6").first().append($("#GruposAlumnos").parents(".ibox:first").find(".ibox-title"));
	
	$("#GruposAlumnos_length").remove();
	$("#GruposAlumnos thead").remove();

	$("#agregarTpDialog").dialog({
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		position: 'top',
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
	$("#agregarAlumnoDialog").dialog({
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		position: 'top',
		hide: {effect: "fade", duration: 300},
		show: {effect: "fade", duration: 300},
		buttons: {
			"Crear": function() {
				if(tpAdmin.validacionFormlario("#nuevoAlumnoForm")) {
					tpAdmin.crearNuevoAlumnoAjax();
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
			var grupoId = $("#nuevoAlumnoForm input[name=grupoId]").val();
			$("#nuevoAlumnoForm input[name=nombreGrupo]").val($("#agregarAlumnoDialog").data("nombreGrupo"));
			
			$.ajax({
				url: "/repouniversity/docente/alumnosSinGrupo",
				type: "GET",
				data: {"grupoId" : grupoId},
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
	$("#editarTpDialog").dialog({
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		position: 'top',
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
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Eliminar": function() {
				tpAdmin.deleteTpAjax($("#deleteTpDialog").data('tpId'));
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
	$("#deleteAlumnoDialog").dialog({
		resizable: false,
		width:400,
		modal: true,
		autoOpen: false,
		position: 'top',
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Eliminar": function() {
				tpAdmin.deleteAlumnoAjax($("#deleteAlumnoDialog").data('alumnoId'), $("#deleteAlumnoDialog").data('cursoId'));
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
	
	$("#deleteAlumnoValidationDialog").dialog({
		resizable: false,
		width:400,
		modal: true,
		autoOpen: false,
		position: 'top',
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Aceptar": function() {
				$(this).dialog("close");
			}
		}
	});
	
	$("#agregarTpButton").click(function() {
		$("#agregarTpDialog").dialog("open");
	});
	
	$("#agregarAlumnoButton").click(function() {
		$("#agregarAlumnoDialog").data("nombreGrupo", $(".grupo-titulo h5").text().split(": ")[1]).dialog("open");
	});
	$("a[name=deleteTp] button").click(function(){
		$("#deleteTpDialog").data('tpId', $(this).parent().attr("data-tpgrupoId")).dialog("open");
	});
	$("a[name=deleteAlumno] button").click(function(){
		if($("#GruposAlumnos tr").size() > 2) {
			$("#deleteAlumnoDialog").data('alumnoId', $(this).parent().attr("data-alumnoId"))
			.data('cursoId', $("input[name=cursoId]").val())
			.dialog("open");
		} else {
			$("#deleteAlumnoValidationDialog").dialog("open");
		}
	});
	$("a[name=editTp] button").click(function(){
		$("#editarTpDialog").data('tpId', $(this).parent().attr("data-tpgrupoId"))
			.data('tpId', $(this).parents("tr").find("td").get(0).innerHTML)
			.data('descripcion', $(this).parents("tr").find("td").get(1).innerHTML)
			.data('archivo', $(this).parents("tr").find("td").get(2).innerHTML)
			.data('nota', $(this).parents("tr").find("td").get(3).innerHTML)
			.dialog("open");
	});
	
	$("select[name=alumnosIds]").chosen({no_results_text:'No hay resultados para: '});
});

