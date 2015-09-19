$(document).ready(function() {
	table = $('#notificaciones').DataTable({
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
                       {"width": "5%", "targets": 1},
                       {"width": "15%", "targets": 2},
                       {"width": "15%", "targets": 3},
                       {"width": "20%", "targets": 4},
                       {"width": "20%", "targets": 5},
                       { orderable: false, targets: [0] }
                      ],
        "order": [[ 1, "desc" ]],
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
          },
          dom: 'T<"clear">lfrtip',
          tableTools: {
              "sRowSelect": "multi",
              aButtons:     [ 'select_all', 'select_none' ]
          }
	});
	
	$("#notificaciones_wrapper").first().find(".col-sm-6").first().append($("#notificaciones").parents(".ibox:first").find(".ibox-title"));
	
	$("#notificaciones_length").remove();
	$("#notificaciones thead").remove();
	
	if($("input[name=rolName]").val() == 'docente') {
		$(".DTTT_container").first().append("<a id='aceptarTodo' data-toggle='modal' class='btn btn-outline btn-primary'><i class='fa fa-upload'></i> Aceptar</a><a id='rechazarTodo' data-toggle='modal' class='btn btn-outline btn-danger'><i class='fa fa-upload'></i> Rechazar</a>");				
	} else {
		$(".DTTT_container").first().append("<a id='borrarTodo' data-toggle='modal' class='btn btn-outline btn-danger'><i class='fa fa-upload'></i> Borrar</a>");
	}
	
	$("#aceptarTodo").click(function() {
		var datos = table.rows('.selected').data();
		var idsDatos = "";
		
		if(datos.length > 0) {
			for(var i = 0; i< datos.length; i++){
				idsDatos = idsDatos + datos[i][1];
				
				if(datos.length - 1 != i) {
					idsDatos = idsDatos + ",";
				}
			}
			
			altaEnCurso(idsDatos);
			
		}
	});
	
	$("#rechazarTodo").click(function() {
		var datos = table.rows('.selected').data();
		var idsDatos = "";
		
		if(datos.length > 0) {
			for(var i = 0; i< datos.length; i++){
				idsDatos = idsDatos + datos[i][1];
				
				if(datos.length - 1 != i) {
					idsDatos = idsDatos + ",";
				}
			}
			rechazoAltaEnCurso(idsDatos);
		}
		
	});
	
	$("#borrarTodo").click(function() {
		var datos = table.rows('.selected').data();
		var idsDatos = "";
		
		if(datos.length > 0) {
			for(var i = 0; i< datos.length; i++){
				idsDatos = idsDatos + datos[i][1];
				
				if(datos.length - 1 != i) {
					idsDatos = idsDatos + ",";
				}
			}
			borrarNotificacion(idsDatos);
		}
		
	});
	
	$("#successDialog").dialog({
		resizable: false,
		width:450,
		modal: true,
		autoOpen: false,
		closeOnEscape: false,
		hide: {effect: "fade", duration: 300},
		show: {effect: "fade", duration: 300},
		buttons: {
			"Aceptar": function() {
				$(this).dialog("close");
				window.location.href = "/repouniversity/dashboard?bread=Home-0";
			}
		},
		open: function(event, ui) {
			$(".ui-dialog-titlebar-close").hide();
			$("#successDialog .message").append($("#successDialog").data('message'));
		},
		close: function(event, ui) {
			$("#errorDialog .message").empty();
		}
	});
	
	$("#errorDialog").dialog({
		resizable: false,
		width:450,
		modal: true,
		autoOpen: false,
		closeOnEscape: false,
		hide: {effect: "fade", duration: 300},
		show: {effect: "fade", duration: 300},
		buttons: {
			"Aceptar": function() {
				$(this).dialog("close");
				window.location.href = window.location.href;
			}
		},
		open: function(event, ui) {
			$(".ui-dialog-titlebar-close").hide();
			$("#errorDialog .message").append($("#errorDialog").data('message'));
		},
		close: function(event, ui) {
			$("#errorDailog .message").empty();
		}
	});
	
	$("#ToolTables_notificaciones_0 span").text("Seleccionar todo");
	$("#ToolTables_notificaciones_1 span").text("Deseleccionar todo");
	
	$("#ToolTables_notificaciones_0, #ToolTables_notificaciones_1").hide();
	
	$('input[name=selectAll]').change(function() {
        if($(this).is(":checked")) {
        	$("#ToolTables_notificaciones_0").trigger( "click" );
        } else {
        	$("#ToolTables_notificaciones_1").trigger( "click" );
        }
    });
});

function borrarNotificacion(notificacionId) {
	$.ajax({
		  type: "POST",
		  url: "/repouniversity/notificacion/borrarNotificacion",
		  data: {"notificacionId" : notificacionId},
		  success: function(){ 
			  $("#successDialog").data("message","Las notificaciones se procesaron correctamente.").dialog("open");
		  },
		  error: function(){ 
			  $("#errorDialog").data("message","Hubo un error al procesar las notificaciones.").dialog("open");
		  }
	});
}

function altaEnCurso(notificacionIds) {
	$.ajax({
		  type: "POST",
		  url: "/repouniversity/notificacion/confirmaaltancurso",
		  data: {"notificacionId" : notificacionIds},
		  success: function(data){ 
			  $("#successDialog").data("message", "Las notificaciones se procesaron correctamente.").dialog("open");
		  },
		  error: function(data){ 
			  $("#errorDialog").data("message", "Hubo un error al procesar las notificaciones.").dialog("open");
		  }
	});
}

function rechazoAltaEnCurso(notificacionId) {
	$.ajax({
		  type: "POST",
		  url: "/repouniversity/notificacion/rechazaaltancurso",
		  data: {"notificacionId" : notificacionId},
		  success: function(){ 
			  $("#successDialog").data("message","Las notificaciones se procesaron correctamente.").dialog("open");
		  },
		  error: function(){ 
			  $("#errorDialog").data("message","Hubo un error al procesar las notificaciones.").dialog("open");
		  }
	});
}