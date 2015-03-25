<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8" />
<title>Repouniversity</title>
</head>
<body class="login">
	<div id="main">
		<div id="content">
			<div id="login-form">
				<form action="newAlumno" method="post" class="login" id="newAlumno">
					<h4>Crear un Alumno</h4>
					<input name="nombre" type="text" class="campo"
						placeholder="&#xf007  Usuario" /><br /> <input name="apellido"
						 class="campo" placeholder="&#xf023  Password" />
						 <br /> <input name="mail"
						 class="campo" placeholder="&#xf023  Password" />
						 <br /> <input name="apellido"
						 class="campo" placeholder="&#xf023  Password" />
					<button type="submit" class="btn-default">entrar</button>
				</form>
				<c:if test="${not empty loginexception}">
					<label style="color: red">Usuario o password son incorrectos</label>
				</c:if>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#login").validate({
				rules : {
					'userName' : {
						required : true,
					},
					'password' : {
						required : true
					},
				},
				submitHandler : function(form) {
					form.submit();
				},
				messages : {
					'userName' : {
						required : "Por favor, ingrese un nombre de usuario",
					},
					'password' : {
						required : "Por favor, ingrese una contrase&ntilde;a",
					},
				}
			});
		});
	</script>

</body>
</html>