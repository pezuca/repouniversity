<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="activeTab" value="${'verCursos'}" />
<c:set var="userLog" value="${sessionScope.login}" />

<html>
<head>
	<meta charset="utf-8" />
	<title>Repouniversity</title>
	<%@include file="../components/common-statics-imports.jsp"%>
	<script src="/repouniversity/resources/js/application/verCursosAdmin.js"></script>
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
	                      <h5>Lista de cursos</h5>
		                  <div class="ibox-tools" id="agregarCursoButton">
	                          <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-magic"></i>  Curso</a>
	                      </div>
	                  </div>
	                  <div class="ibox-content">
	                  	<table id="listaPersonas" class="table table-striped table-hover" >
	                  		<thead class="encabezado">
							<tr>
								<th>Id</th>
								<th>Nombre</th>
								<th>Codigo</th>
								<th>Descripci�n</th>
								<th>Activo</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${cursos}" var="curso"
								varStatus="status">
								<tr>
									<td>${curso.id}</td>
									<td>${curso.nombre}</td>
									<td>${curso.codigo}</td>
									<td>${curso.descripcion}</td>
									<td>${curso.activo ? 'Si' : 'No'}</td>
									<td>
										<a href="#" name="editCurso" data-cursoId="${curso.id}"><button class="btn btn-primary btn-circle" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Editar curso"><i class="fa fa-pencil"></i></button></a>
										<a href="#" name="deleteCurso" data-cursoId="${curso.id}" ><button class="btn btn-danger btn-circle" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Eliminar curso"><i class="fa fa-times"></i></button></a>
										<a href="#" name="administrarCurso" data-cursoId="${curso.id}" ><button class="btn btn-success btn-circle" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Administrar curso"><i class="fa fa-codepen"></i></button></a>
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
<!-- 	Ventanas -->
	<div id="agregarCursoDialog" title="Nuevo curso">
		<form id="nuevoCursoForm" class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label">Nombre*:</label>
                <div class="col-sm-10"><input name="nombre" type="text" class="form-control" required="required"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Codigo*:</label>
                <div class="col-sm-10"><input name="codigo" type="text" class="form-control" required="required"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Descripcion*:</label>
                <div class="col-sm-10"><input name="descripcion" type="text" class="form-control" required="required"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Activo*:</label>
                <div class="col-sm-10">
                	<select class="form-control m-b" name="activo" required="required">
                         <option value="true">Si</option>
                         <option value="false">No</option>
                     </select>
                </div>
            </div>
		</form>
	</div>
	
	<div id="editarCursoDialog" title="Editar Curso">
		<form id="editarCursoForm" class="form-horizontal">
			<input name="userId" type="hidden">
			<div class="form-group">
				<label class="col-sm-2 control-label">Nombre*:</label>
                <div class="col-sm-10"><input name="nombre" type="text" class="form-control" required="required"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Codigo*:</label>
                <div class="col-sm-10"><input name="codigo" type="text" class="form-control" required="required"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Descripcion*:</label>
                <div class="col-sm-10"><input name="descripcion" type="text" class="form-control" required="required"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Activo*:</label>
                <div class="col-sm-10">
                	<select class="form-control m-b" name="activo" required="required">
                         <option value="true">Si</option>
                         <option value="false">No</option>
                     </select>
                </div>
            </div>
		</form>
	</div>
	
	<div id="deleteCursoDialog" title="Eliminar Curso">
		<p>�Esta seguro que desea eliminar el curso?</p>
	</div>
	</div>
	
</body>
</html>