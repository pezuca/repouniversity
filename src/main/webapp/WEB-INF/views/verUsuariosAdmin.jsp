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
</head>
<body class=" pace-done">
	
	<div id="wrapper">
	<%@include file="../components/static-nav-bar.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
		<%@include file="../components/search-nav-bar.jsp"%>
	
	 	<div class="wrapper wrapper-content animated fadeInRight">
	         <div class="row">
	             <div class="col-lg-12">
	              <div class="ibox float-e-margins">
	                  <div class="ibox-title">
	                      <h5>Lista de alumnos</h5>
		                  <div class="ibox-tools" id="agregarAlumnoButton">
	                          <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-magic"></i>  Usuario</a>
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
								<th>Activo</th>
								<th>Rol</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${usuarios}" var="usuario"
								varStatus="status">
								<tr>
									<td>${usuario.id}</td>
									<td>${usuario.persona.nombre}</td>
									<td>${usuario.persona.apellido}</td>
									<td>${usuario.user}</td>
									<td>${usuario.persona.mail}</td>
									<td>${usuario.activo ? 'Si' : 'No'}</td>
									<td>${usuario.rol}</td>
									<td>
										<a href="#" name="editUser" data-userId="${usuario.id}"><button class="btn btn-primary btn-circle" type="button"><i class="fa fa-pencil"></i></button></a>
										<a href="#" name="deleteUser" data-userId="${usuario.id}" ><button class="btn btn-danger btn-circle" type="button"><i class="fa fa-times"></i></button></a>
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
        
		<%@include file="../components/footer.jsp"%>
	</div>
	</div>
	
<!-- 	Ventanas -->
	<div id="agregarAlumnoDialog" title="Nuevo Usuario">
		<form id="nuevoAlumnoForm" class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label">Nombre*:</label>
                <div class="col-sm-10"><input name="nombre" type="text" class="form-control"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Apellido*:</label>
                <div class="col-sm-10"><input name="apellido" type="text" class="form-control"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Mail*:</label>
                <div class="col-sm-10"><input name="mail" type="text" class="form-control"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Username*:</label>
                <div class="col-sm-10"><input name="user" type="text" class="form-control"></div>
            </div>
			<div class="form-group">
                <label class="col-sm-2 control-label">Contrase�a*:</label>
                <div class="col-sm-10"><input name="password" type="text" class="form-control"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Activo*:</label>
                <div class="col-sm-10">
                	<select class="form-control m-b" name="activo">
                         <option value="true">Si</option>
                         <option value="false">No</option>
                     </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Rol*:</label>
                <div class="col-sm-10">
                	<select class="form-control m-b" name="rol">
                         <option value="alumno">Alumno</option>
                         <option value="docente">Docente</option>
                         <option value="administrador">Administrador</option>
                     </select>
                </div>
            </div>
		</form>
	</div>
	
	<div id="editarAlumnoDialog" title="Editar Usuario">
		<form id="editarAlumnoForm" class="form-horizontal">
			<input name="userId" type="hidden">
			<div class="form-group">
				<label class="col-sm-2 control-label">Nombre*:</label>
                <div class="col-sm-10"><input name="nombre" type="text" class="form-control"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Apellido*:</label>
                <div class="col-sm-10"><input name="apellido" type="text" class="form-control"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Mail*:</label>
                <div class="col-sm-10"><input name="mail" type="text" class="form-control"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Username*:</label>
                <div class="col-sm-10"><input name="user" type="text" class="form-control"></div>
            </div>
			<div class="form-group">
                <label class="col-sm-2 control-label">Contrase�a*:</label>
                <div class="col-sm-10"><input name="password" type="text" class="form-control"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Activo*:</label>
                <div class="col-sm-10">
                	<select class="form-control m-b" name="activo">
                         <option value="true">Si</option>
                         <option value="false">No</option>
                     </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Rol*:</label>
                <div class="col-sm-10">
                	<select class="form-control m-b" name="rol" disabled readonly>
                         <option value="alumno">Alumno</option>
                         <option value="docente">Docente</option>
                         <option value="administrador">Administrador</option>
                     </select>
                </div>
            </div>
		</form>
	</div>
	
	<div id="deleteAlumnoDialog" title="Eliminar Usuario">
		<p>�Esta seguro que desea eliminar el usuario?</p>
	</div>
</body>
</html>