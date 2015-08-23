var usuarioParametroAdmin = {
	editarCursoAjax : function() {
		$.ajax({
			url: "/repouniversity/usuario/editarParametro",
			type: "POST",
			data: $("#editarUsuarioParametroForm").serialize(),
			success: function(data){
				$.gritter.add({
					title:'Usuario Parametro editado',
					text: 'Los datos del Parametro fueron editados exitosamente.',
					sticky: false
				});
				
				var celdas = $("#listaParametros td a[data-ususarioParametroId=" + data.id + "]").parents("tr").find("td");
				celdas.get(0).innerHTML = data.parametro.parametro;
				celdas.get(1).innerHTML = data.orden;
				celdas.get(2).innerHTML = data.color.color;
				celdas.get(3).innerHTML = data.activo == true?'SI':'NO';
				
				
				$("a[name=editUsuarioParametro][data-ususarioParametroId=" + data.id + "] button").click(function(){
					$("#editarUsuarioParametroDialog").data('userParamId', $(this).parent().attr("data-ususarioParametroId"))
					//.data('parametroId', $(this).parents("tr").find("td[data-parametroId]").attr("data-parametroId"))
					.data('orden', $(this).parents("tr").find("td").get(1).innerHTML)
					.data('colorId', $(this).parents("tr").find("td[data-colorId]").attr("data-colorId"))
					.data('activoId', $(this).parents("tr").find("td[data-activoId]").attr("data-activoId"))
						.dialog("open");
				});
				
				$("#editarUsuarioParametroDialog").dialog("close");						
			},
			error: function(data) {
				$("#editarUsuarioParametroForm").after("<div class='infoDialog'><p class='infoPara'>Hubo un error al tratar de editar el parametro, inténtelo mas tarde.</p></div>")
				setTimeout(function(){
					$("#editarUsuarioParametroDialog .infoDialog").hide(function(){
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
	table = $('#listaParametros').DataTable({
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
        }
	});

	$("#clientTable_length").remove();
	
		
	$("#editarUsuarioParametroDialog").dialog({
		position: "top",
		resizable: false,
		width:700,
		modal: true,
		autoOpen: false,
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Ok": function() {
				if(usuarioParametroAdmin.validacionFormlario("#editarUsuarioParametroForm")) {
					usuarioParametroAdmin.editarCursoAjax();
				}
			},
			"Cancelar": function() {
				$(this).dialog("close");
			}
		},
		open: function(event, ui) {
			$(".infoDialog").remove();
			$('#editarUsuarioParametroForm').trigger("reset");
			$("#editarUsuarioParametroForm").find(".form-group").removeClass("has-error");
			$("#editarUsuarioParametroForm select option").removeAttr("selected");
			
			$('#editarUsuarioParametroForm input[name=userParamId]').val($("#editarUsuarioParametroDialog").data('userParamId'));
			//$('#editarUsuarioParametroForm input[name=parametroId]').val($("#editarUsuarioParametroDialog").data('parametroId'));
			$('#editarUsuarioParametroForm input[name=orden]').val($("#editarUsuarioParametroDialog").data('orden'));
			$("#editarUsuarioParametroForm select[name=color] option[value=" + $("#editarUsuarioParametroDialog").data('colorId') + "]").attr("selected", "selected");
			$("#editarUsuarioParametroForm select[name=activo] option[value=" + $("#editarUsuarioParametroDialog").data('activoId') + "]").attr("selected", "selected");
		},
		close: function(event, ui) {
		}
	});
	

	$("a[name=editUsuarioParametro] button").click(function(){
		$("#editarUsuarioParametroDialog").data('userParamId', $(this).parent().attr("data-ususarioParametroId"))
			//.data('cursoId', $(this).parents("tr").find("td").get(0).innerHTML)
	//		.data('parametroId', $(this).parents("tr").find("td[data-parametroId]").attr("data-parametroId"))
			.data('orden', $(this).parents("tr").find("td").get(1).innerHTML)
			.data('colorId', $(this).parents("tr").find("td[data-colorId]").attr("data-colorId"))
			.data('activoId', $(this).parents("tr").find("td[data-activoId]").attr("data-activoId"))
			.dialog("open");
	});
	
    $("#editarUsuarioParametroDialog select[name=color]").chosen({no_results_text:'No hay resultados para: '});
    $("#editarUsuarioParametroDialog select[name=activo]").chosen({no_results_text:'No hay resultados para: '});
});