<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<c:set var="userLog" value="${sessionScope.login}"/>
<head>
<meta charset="utf-8" />


    <title>Repouniversity | Cambiar Pass</title>
	<%@include file="../components/common-statics-imports.jsp"%>

	<script src="/repouniversity/resources/js/plugins/chosen/chosen.jquery.js"></script>
	<link rel="stylesheet" type="text/css" 
				href="/repouniversity/resources/css/plugins/chosen/chosen.css" />
	<script type="text/javascript"
		src="/repouniversity/resources/js/application/cambiarPassword.js"></script>
		
</head>

<body class=" gray-bg">

 <div class="wrapper wrapper-content animated fadeInRight ">
 	<p>Ingrese su nueva Contraseña</p>
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-content">
							<form class="form-horizontal" id="userUpdate" method="post" name="elformulario">
								<input name="id" type="hidden" value="${user.id}" />
								<div class="form-group">
									<label class="col-sm-2 control-label" for="userInput">
											Usuario</label>
										<div class="col-sm-2">
											<input name="user" id="userInput" type="text"
												value="${user.user}" disabled>
										</div>
								</div>
								<div class="form-group">
									<label for="passwordInput" class="col-sm-2 control-label">
										Nueva Contraseña</label>
									<div class="col-sm-3">
										<span id="passwd_sitio"><input type="password" name="newPassword" id="passwordInput" value=""></span>&nbsp;&nbsp;
										<input type="checkbox" title = "Mostrar Pass" name="input_ver" value="ver" onclick="ver_password();">
									</div>
								</div>
								<div class="form-group" id="repetirPass">
									<label for="repeatPasswordInput" class="col-sm-2 control-label">
										Confirmar Contraseña</label>
									<div class="col-sm-3">
										<input name="repeatPassword" 
											id="repeatPasswordInput" type="password" placeholder="Repetir Contraseña" required>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="btn btn-primary" onclick="mandarLaPass();">Salvar</button>
									</div>
								</div>
							</form>
						</div>
					</div>
	             </div>
	        </div>
	<div id="errorPass" title="">
		<p>Las contraseñas deben ser iguales</p>
	</div>
	
	<div id="passErrorDailog" title="">
		<p class="message"></p>
	</div>
		</div>
	
    
    <script>
    	$(document).ready(function(){
    		$('input[name=newPassword]').replaceWith('<input type="password" name="newPassword" placeholder="Contraseña" required/>');
    		setTimeout("$('#login').trigger('reset')", 100);
    		
    		$('#login input[name=user]').change(function(){
    			$("#login input[name=password]").trigger("reset");
    		});
    	});
    </script>
    <script language="JavaScript">
		function ver_password() {
		    var passwd_valor = document.elformulario.newPassword.value;
		 
		    document.getElementById('passwd_sitio').innerHTML
		        = (document.elformulario.input_ver.checked)
		        ? '<input type="text"     name="newPassword" required>'
		        : '<input type="password" name="newPassword" required>'
		        ;
		 
		        if(document.elformulario.input_ver.checked == true){
		        	document.getElementById('repetirPass').style.display = 'none';
		        } else {
		        	document.getElementById('repetirPass').style.display = 'block';
		        }
		        
		    	document.elformulario.newPassword.value = passwd_valor;
		}
		function mandarLaPass() {
		    var passwd_valor = document.elformulario.newPassword.value;
		         if(document.elformulario.input_ver.checked == true){
		        	document.elformulario.repeatPassword.value = passwd_valor;
		        }
		        
		    	document.elformulario.newPassword.value = passwd_valor;
		}
	</script>

</body>

</html>