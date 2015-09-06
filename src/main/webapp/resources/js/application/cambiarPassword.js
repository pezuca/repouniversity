$(document).ready(function() {
	$("#menuSettings").addClass("active");
	
	$("#errorPass").dialog({
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
		var newPass = $(this).find("input[name=newPassword]");
		var confirmPass = $(this).find("input[name=repeatPassword]");
		
		if(newPass.val() != '' && newPass.val() != confirmPass.val()) {
			$("#errorPass").dialog("open");
			event.preventDefault();
			
			newPass.val("");
			confirmPass.val("");
			
			return false;
		}
		
		$.ajax({
			url: "/repouniversity/usuario/cambiarPass/update",
			type: "POST",
			data: $("#userUpdate").serialize(),
			success: function(data){
				window.location.href = "/repouniversity/dashboard?bread=Home-0"	
			},
			error: function(data) {
				$("#passErrorDailog").data("message", data.responseText).dialog("open");
			}
		});
		
		return false;
	});
	
	$("#passErrorDailog").dialog({
		resizable: false,
		width:450,
		modal: true,
		autoOpen: false,
		hide: {effect: "fade", duration: 300},
		show: {effect: "fade", duration: 300},
		buttons: {
			"Aceptar": function() {
				$(this).dialog("close");
				}
		},
		open: function(event, ui) {
			$("#passErrorDailog .message").append($("#passErrorDailog").data('message'));
		},
		close: function(event, ui) {
			$("#passErrorDailog .message").empty();
		}
	});
});