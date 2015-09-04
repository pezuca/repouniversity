<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="activeTab" value="${'verUsuarios'}" />
<c:set var="userLog" value="${sessionScope.login}" />

<html>
<head>
	<meta charset="utf-8" />
	<title>Repouniversity</title>
	<%@include file="../components/common-statics-imports.jsp"%>
	<script src="/repouniversity/resources/js/application/verUsuariosAdmin.js"></script>
	<script src="/repouniversity/resources/js/plugins/chosen/chosen.jquery.js"></script>
	<link rel="stylesheet" type="text/css" 
				href="/repouniversity/resources/css/plugins/chosen/chosen.css" />
</head>
<body class=" pace-done">
	
	<div id="wrapper">
	<%@include file="../components/static-nav-bar.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
		<%@include file="../components/search-nav-bar.jsp"%>
		
		<tag:breadcrumb label="Ver usuarios"/>
	
	 	<div class="wrapper wrapper-content animated fadeInRight pre-scrollable">
	         <div class="row">
	             <div class="col-lg-12">
	              <div class="ibox float-e-margins">
	                  <div class="ibox-title">
	                      <h5>Lista de usuarios</h5>
		                  <div class="ibox-tools" id="agregarAlumnoButton">
	                          <a href="#" class="btn btn-primary btn-xs" title="Crear usuario"><i class="fa fa-magic"></i>  Usuario</a>
	                      </div>
	                  </div>
	                  <div class="ibox-content">
	                  	<table id="listaPersonas" class="table table-striped table-hover" >
	                  		<thead class="encabezado">
								<tr>
									<th>Id</th>
									<th>Nombre</th>
									<th>Apellido</th>
									<th>User name</th>
									<th>Mail</th>
									<th>Rol</th>
									<th>Carrera</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${usuarios}" var="usuario" varStatus="status">
									<tr>
										<td>${usuario.id}</td>
										<td>${usuario.persona.nombre}</td>
										<td>${usuario.persona.apellido}</td>
										<td>${usuario.user}</td>
										<td>${usuario.persona.mail}</td>
										<td>${usuario.rol}</td>
										
										<c:set var="carreraName" value="" />
										<c:forEach items="${listacarreras}" var="carrera" varStatus="status">
											<c:if test="${carrera.id == usuario.alumno.idCarrera}">
												<c:set var="carreraName" value="${carrera.nombre}" />
											</c:if>
										</c:forEach>
										
										<td data-carreraId="${usuario.alumno.idCarrera}">${carreraName}</td>
										<td>
											<c:choose>
												<c:when test="${login.permiso == '1'}">
													<a href="#" name="editUser" data-userId="${usuario.id}"><button class="btn btn-primary btn-circle" type="button" title="Editar usuario"><i class="fa fa-pencil"></i></button></a>
													<a href="#" name="deleteUser" data-userId="${usuario.id}" ><button class="btn btn-danger btn-circle" type="button" title="Eliminar usurio"><i class="fa fa-times"></i></button></a>		
												</c:when>
												<c:when test="${login.permiso == '2'}">
													<a href="#" name="editUser" data-userId="${usuario.id}"><button class="btn btn-primary btn-circle" type="button" title="Editar usuario"><i class="fa fa-pencil"></i></button></a>
												</c:when>
											</c:choose>	
										</td>
									</tr>
								</c:forEach>
							</tbody>
	                  	</table>
	                  </div>
	              </div>
	      		</div>
	         </div>
	     </div>
        <div id="hiddenInputs" class="hidden">
				<input type="hidden" name="miPermiso" value="${login.permiso}"/>
		</div>
<%-- 		<%@include file="../components/footer.jsp"%> --%>
	</div>
<!-- 	Ventanas -->
	<div id="agregarAlumnoDialog" title="Nuevo Usuario" class="modal fade in">
		<form id="nuevoAlumnoForm" class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label">Nombre*:</label>
                <div class="col-sm-10"><input name="nombre" type="text" class="form-control" required="required"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Apellido*:</label>
                <div class="col-sm-10"><input name="apellido" type="text" class="form-control" required="required"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Mail*:</label>
                <div class="col-sm-10"><input name="mail" type="mail" class="form-control" required="required"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Username*:</label>
                <div class="col-sm-10"><input name="user" type="text" class="form-control" required="required"></div>
            </div>
			<div class="form-group">
                <label class="col-sm-2 control-label">Contraseña*:</label>
                <div class="col-sm-10"><input name="password" type="password" class="form-control" required="required"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Rol*:</label>
                <div class="col-sm-10">
                	<select class="form-control m-b" name="rol" required="required">
	                	<c:forEach items="${listaRoles}" var="role" varStatus="status">
							<option value="${role.role}">${role.role}</option>
						</c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group carreraSelect">
                <label class="col-sm-2 control-label">Carrera*:</label>
                <div class="col-sm-10">
                	<select class="form-control m-b" name="carrera">
						<c:forEach items="${listacarreras}" var="carrera" varStatus="status">
							<option value="${carrera.id}">${carrera.nombre}</option>
						</c:forEach>
                     </select>
                </div>
            </div>
             <div>
                <small>(*) Datos obligatorios</small>
             </div>
		</form>
	</div>
	
	<div id="editarAlumnoDialog" title="Editar Usuario">
		<form id="editarAlumnoForm" class="form-horizontal">
			<input name="userId" type="hidden">
			<div class="form-group">
				<label class="col-sm-2 control-label">Nombre*:</label>
                <div class="col-sm-10"><input name="nombre" type="text" class="form-control" required="required"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Apellido*:</label>
                <div class="col-sm-10"><input name="apellido" type="text" class="form-control" required="required"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Mail*:</label>
                <div class="col-sm-10"><input name="mail" type="mail" class="form-control" required="required"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Username*:</label>
                <div class="col-sm-10"><input name="user" type="text" class="form-control" required="required"></div>
            </div>
			<div class="form-group">
                <label class="col-sm-2 control-label">Contraseña:</label>
                <div class="col-sm-10"><input name="password" type="password" class="form-control"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Rol*:</label>
                <div class="col-sm-10">
                	<select class="form-control m-b" name="rol" disabled readonly>
	                	<c:forEach items="${listaRoles}" var="role" varStatus="status">
							<option value="${role.role}">${role.role}</option>
						</c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group carreraSelect">
                <label class="col-sm-2 control-label">Carrera*:</label>
                <div class="col-sm-10">
                	<select class="form-control m-b" name="carrera">
						<c:forEach items="${listacarreras}" var="carrera" varStatus="status">
							<option value="${carrera.id}">${carrera.nombre}</option>
						</c:forEach>
                     </select>
                </div>
            </div>
            <div>
                <small>(*) Datos obligatorios</small>
             </div>
		</form>
	</div>
	
	<div id="deleteAlumnoDialog" title="Eliminar Usuario">
		<p>¿Esta seguro que desea eliminar el usuario?</p>
	</div>
	</div>
	
</body>
</html>