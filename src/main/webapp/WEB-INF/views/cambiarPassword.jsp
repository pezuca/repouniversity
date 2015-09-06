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

<body class=" pace-done">

 <div class="wrapper wrapper-content animated fadeInRight pre-scrollable">
 	<p>Ingrese su nueva Contraseña</p>
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-content">
							<form action="usuario/cambiarPass/update" class="form-horizontal" role="form"
								id="userUpdate" method="post">
								<input name="id" type="hidden" value="${user.id}" />
								<div class="form-group">
									<label class="col-sm-2 control-label" for="userInput">
											Usuario</label>
										<div class="col-sm-2">
											<input name="user" class="form-control" id="userInput" type="text"
												value="${user.user}" disabled>
										</div>
								</div>
								<div class="form-group">
									<label for="passwordInput" class="col-sm-2 control-label">
										Nueva Contraseña</label>
									<div class="col-sm-3">
										<input name="newPassword" class="form-control" id="passwordInput"
											type="password">
									</div>
								</div>
								<div class="form-group">
									<label for="repeatPasswordInput" class="col-sm-2 control-label">
										Confirmar Contraseña</label>
									<div class="col-sm-3">
										<input name="repeatPassword" class="form-control"
											id="repeatPasswordInput" type="password" placeholder="Repetir Contraseña">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="btn btn-primary">Salvar</button>
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
    		$('input[name=newPassword]').replaceWith('<input type="password" name="newPassword" class="form-control" placeholder="Contraseña" required/>');
    		setTimeout("$('#login').trigger('reset')", 100);
    		
    		$('#login input[name=user]').change(function(){
    			$("#login input[name=password]").trigger("reset");
    		});
    	});
    </script>

</body>

</html>