var cursosAdmin = {
		deleteCursoAjax : function(cursoId) {
		$.ajax({
			url: "/repouniversity/alumno/bajaCurso",
			type: "POST",
			data: {"cursoId" : cursoId},
			success: function(data){
				$.gritter.add({
					title:'Curso eliminado',
					text: 'El curso fue elimnado exitosamente.',
					sticky: false
				});
				
				table.row( $("#cursosAlumno a[data-cursoId=" + cursoId + "]").parents('tr') ).remove().draw();
				$("#deleteCursoDialog").dialog("close");						
			},
			error: function(data) {
				$.gritter.add({
					title: 'Eliminar curso',
					text: 'Hubo un problema al tratar de eliminar el curso. Por favor inténtelo mas tarde.',
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
	table = $('#cursosAlumno').DataTable({
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
                       {"width": "15%", "targets": 0},
                       {"width": "30%", "targets": 1},
                       {"width": "15%", "targets": 2},
                       {"width": "20%", "targets": 3},
                       {"width": "20%", "targets": 4},
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
	
	$("#cursosAlumno_wrapper .row").first().find(".col-sm-6").first().append($("#cursosAlumno").parents(".ibox:first").find(".ibox-title"));
	
	$("#cursosAlumno_length").remove();
	$("#cursosAlumno thead").remove();
	
	$("#deleteCursoDialog").dialog({
		resizable: false,
		width:400,
		modal: true,
		autoOpen: false,
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
	

	$("a[name=deleteCurso] button").click(function(){
		$("#deleteCursoDialog").data('cursoId', $(this).parent().attr("data-cursoId")).dialog("open");
	});
	
});