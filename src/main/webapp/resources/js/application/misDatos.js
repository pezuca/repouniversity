$(document).ready(function() {
	$("#menuSettings").addClass("active");
	$("#userUpdate select[name=carrera]").chosen({no_results_text:'No hay resultados para: '});
	
	$("#errorPass").dialog({
		position: "top",
		resizable: false,
		width:400,
		modal: true,
		autoOpen: false,
		hide: {effect: "fade", duration: 300},
		hide: {effect: "fade", duration: 300},
		buttons: {
			"Aceptar": function() {
				$(this).dialog("close");
			}
		}
	});
	
	$("#userUpdate").submit(function(event){
		var newPass = $(this).find("input[name=newPassword]").val();
		var confirmPass = $(this).find("input[name=repeatPassword]").val();
		
		if(newPass != '' && newPass != confirmPass) {
			$("#errorPass").dialog("open");
			event.preventDefault();
			return false;
		}
	});
});