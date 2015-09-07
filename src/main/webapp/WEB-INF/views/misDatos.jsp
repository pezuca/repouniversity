<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="activeTab" value="${'dashboard'}" />
<c:set var="userLog" value="${sessionScope.login}"/>

<html>
<head>
<meta charset="utf-8" />
	<title>Repouniversity</title>
	<%@include file="../components/common-statics-imports.jsp"%>

	<script type="text/javascript"
		src="/repouniversity/resources/js/application/misDatos.js"></script>
	<script src="/repouniversity/resources/js/plugins/chosen/chosen.jquery.js"></script>
	<link rel="stylesheet" type="text/css" 
				href="/repouniversity/resources/css/plugins/chosen/chosen.css" />
</head>
<body class=" pace-done">
	<div id="wrapper">
		<%@include file="../components/static-nav-bar.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
		
		<%@include file="../components/search-nav-bar.jsp"%>
		
		<tag:breadcrumb label="Mis datos"/>
		
		<div class="wrapper wrapper-content animated fadeInRight pre-scrollable">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-content">
							<form action="misdatos/update" class="form-horizontal" role="form"
								id="userUpdate" method="post" name="elformulario">
								<input name="id" type="hidden" value="${usuario.id}" />
								<div class="form-group">
									<label for="nameInput" class="col-sm-2 control-label">
										Nombre</label>
									<div class="col-sm-3">
										<input name="nombre" class="form-control" id="nameInput" type="text"
											value="${usuario.persona.nombre}" required>
									</div>
									<label for="apellidoInput" class="col-sm-1 control-label">
										Apellido</label>
									<div class="col-sm-3">
										<input name="apellido" class="form-control" id="apellidoInput"
											type="text" value="${usuario.persona.apellido}" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="userInput">
											Usuario</label>
										<div class="col-sm-2">
											<input name="user" class="form-control" id="userInput" type="text"
												value="${usuario.user}" disabled>
										</div>
									<label for="mailInput" class="col-sm-1 control-label"> Mail</label>
									<div class="col-sm-4">
										<input name="mail" class="form-control" id="mailInput"
											type="email" value="${usuario.persona.mail}" required>
									</div>
								</div>
								<div class="form-group" ${userLog.rol == 'administrador' or userLog.rol == 'seguridad' or userLog.rol == 'docente' or userLog.rol == 'alumno' ? 'style=display:none' : ''}>
					                <label for="mailInput" class="col-sm-2 control-label"> Carrera</label>
					                <div class="col-sm-4">
					                	<select class="form-control m-b" name="carrera" disabled>
											<c:forEach items="${listacarreras}" var="carrera" varStatus="status">
												<option value="${carrera.id}">${carrera.nombre}</option>
											</c:forEach>
					                     </select>
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
								<div class="form-group" name="repetirPass" >
									<label for="repeatPasswordInput" class="col-sm-2 control-label">
										Confirmar Contraseña</label>
									<div class="col-sm-3">
										<input name="repeatPassword" class="form-control"
											id="repeatPasswordInput" type="password">
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
		</div>
		
<%-- 		<%@include file="../components/footer.jsp"%> --%>
		</div>
	</div>
	
	<div id="errorPass" title="">
		<p>Las contraseñas deben ser iguales</p>
	</div>
	
	<div id="passErrorDailog" title="">
		<p class="message"></p>
	</div>
	
	<script language="JavaScript">
		function ver_password() {
		    var passwd_valor = document.elformulario.newPassword.value;
		 
		    document.getElementById('passwd_sitio').innerHTML
		        = (document.elformulario.input_ver.checked)
		        ? '<input type="text"     name="newPassword">'
		        : '<input type="password" name="newPassword">'
		        ;
		 
		    document.elformulario.newPassword.value = passwd_valor;
		}
</script>
</body>
</html>