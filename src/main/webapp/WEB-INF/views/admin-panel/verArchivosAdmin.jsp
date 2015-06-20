<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="activeTab" value="${'verCarreras'}" />
<c:set var="userLog" value="${sessionScope.login}" />

<html>
<head>
<meta charset="utf-8" />
<title>Repouniversity</title>
<%@include file="../../components/common-statics-imports.jsp"%>
<script src="/repouniversity/resources/js/plugins/chosen/chosen.jquery.js"></script>
<link rel="stylesheet" type="text/css" 
			href="/repouniversity/resources/css/plugins/chosen/chosen.css" />
<script
	src="/repouniversity/resources/js/application/admin-panel/verCarrerasAdmin.js"></script>
</head>
<body class=" pace-done">

	<div id="wrapper">
		<%@include file="../../components/static-nav-bar.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<%@include file="../../components/search-nav-bar.jsp"%>

			<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row">
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5>Lista de archivos</h5>
							</div>
							<div class="ibox-content">
								<table id="listaCarreras"
									class="table table-striped table-hover">
									<thead class="encabezado">
										<tr>
											<th>Id</th>
											<th>Nombre</th>
											<th>Materias</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${archivos}" var="archivo"
											varStatus="status">
											<tr>
												<td>${archivo.id}</td>
												<td>${archivo.nombre}</td>
												<td>${archivo.nombre}</td>
												<td><a href="#" name="editCarrera"
													data-carreraId="${carrera.id}"><button
															class="btn btn-primary btn-circle" type="button">
															<i class="fa fa-pencil"></i>
														</button></a> <a href="#" name="deleteCarrera"
													data-carreraId="${carrera.id}"><button
															class="btn btn-danger btn-circle" type="button">
															<i class="fa fa-times"></i>
														</button></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<%@include file="../../components/footer.jsp"%>
		</div>
		<!-- 	Ventanas -->
		<div id="agregarCarreraDialog" title="Nueva Carrera">
			<form id="nuevoCarreraForm" class="form-horizontal">
				<div class="form-group">
					<label class="col-sm-2 control-label">Nombre*:</label>
					<div class="col-sm-10">
						<input name="nombre" type="text" class="form-control"
							required="required">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">Materias*:</label>
					<div class="col-sm-10">
						<select data-placeholder="Elija una materia" name="materias" multiple class="chosen-select"
							required="required" tabindex="-1">
							<c:forEach items="${materias}" var="materia" varStatus="status">
								<option value="${materia.id}">${materia.nombre}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</form>
		</div>

		<div id="editarCarreraDialog" title="Editar Carrera">
			<form id="editarCarreraForm" class="form-horizontal">
				<input name="carreraId" type="hidden">
				<div class="form-group">
					<label class="col-sm-2 control-label">Nombre*:</label>
					<div class="col-sm-10">
						<input name="nombre" type="text" class="form-control"
							required="required">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Materias*:</label>
					<div class="col-sm-10">
						<select data-placeholder="Elija una materia" name="materias" multiple class="chosen-select"
							required="required" tabindex="-1">
							<c:forEach items="${materias}" var="materia" varStatus="status">
								<option value="${materia.id}">${materia.nombre}</option>
							</c:forEach>
					</select>
					</div>
				</div>
				
			</form>
		</div>

		<div id="deleteCarreraDialog" title="Eliminar Carrera">
			<p>¿Esta seguro que desea eliminar la carrera?</p>
		</div>
	</div>

</body>
</html>