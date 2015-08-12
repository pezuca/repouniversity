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
		
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
	             <div class="col-lg-12">

					<div class="usuarioInformation">
						<div class="page-header">
							<h1>Mis Datos</h1>
						</div>
			
						<form action="misdatos/update" class="form-horizontal" role="form"
							id="userUpdate" method="post" onsubmit="return checkForm();">
							<input name="id" type="hidden" value="${usuario.id}" />
							<div class="form-group">
								<label class="col-sm-2 control-label" for="userInput">
									Usuario</label>
								<div class="col-sm-10">
									<input name="user" class="form-control" id="userInput" type="text"
										value="${usuario.user}" disabled>
								</div>
							</div>
							<div class="form-group">
								<label for="passwordInput" class="col-sm-2 control-label">
									Nueva Contraseņa</label>
								<div class="col-sm-10">
									<input name="newPassword" class="form-control" id="passwordInput"
										type="password">
								</div>
							</div>
							<div class="form-group">
								<label for="repeatPasswordInput" class="col-sm-2 control-label">
									Confirmar Contraseņa</label>
								<div class="col-sm-10">
									<input name="repeatPassword" class="form-control"
										id="repeatPasswordInput" type="password">
								</div>
							</div>
							<div class="form-group">
								<label for="nameInput" class="col-sm-2 control-label">
									Nombre</label>
								<div class="col-sm-10">
									<input name="nombre" class="form-control" id="nameInput" type="text"
										value="${usuario.persona.nombre}" required>
								</div>
							</div>
							<div class="form-group">
								<label for="apellidoInput" class="col-sm-2 control-label">
									Apellido</label>
								<div class="col-sm-10">
									<input name="apellido" class="form-control" id="apellidoInput"
										type="text" value="${usuario.persona.apellido}" required>
								</div>
							</div>
							<div class="form-group">
								<label for="mailInput" class="col-sm-2 control-label"> Mail</label>
								<div class="col-sm-10">
									<input name="mail" class="form-control" id="mailInput"
										type="email" value="${usuario.persona.mail}" required>
								</div>
							</div>
							<div class="form-group">
				                <label for="mailInput" class="col-sm-2 control-label"> Carrera</label>
				                <div class="col-sm-10">
				                	<select class="form-control m-b" name="carrera">
										<c:forEach items="${listacarreras}" var="carrera" varStatus="status">
											<option value="${carrera.id}">${carrera.nombre}</option>
										</c:forEach>
				                     </select>
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
		
		<%@include file="../components/footer.jsp"%>
		</div>
	</div>
	
	<div id="errorPass" title="Error">
		<p>Las contraseņas deben ser iguales</p>
	</div>
</body>
</html>