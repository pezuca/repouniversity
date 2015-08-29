<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="activeTab" value="${'verArchivos'}" />
<c:set var="userLog" value="${sessionScope.login}" />
<c:set var="breadcrumbTree" value="${sessionScope.breadcrumbTree}" />

<html>
<head>
<meta charset="utf-8" />
<title>Repouniversity</title>
<%@include file="../../components/common-statics-imports.jsp"%>
<script src="/repouniversity/resources/js/plugins/chosen/chosen.jquery.js"></script>
<link rel="stylesheet" type="text/css" 
			href="/repouniversity/resources/css/plugins/chosen/chosen.css" />
<script
	src="/repouniversity/resources/js/application/admin-panel/verArchivosAdmin.js"></script>
</head>
<body class=" pace-done">
	<div id="wrapper">
		<%@include file="../../components/static-nav-bar.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<%@include file="../../components/search-nav-bar.jsp"%>

			<tag:breadcrumb label="Ver archivos"/>

			<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row">
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5>Lista de archivos</h5>
							</div>
							<div class="ibox-content">
								<table id="listaArchivos"
									class="table table-striped table-hover">
									<thead class="encabezado">
										<tr>
											<th>Id</th>
											<th>Nombre</th>
											<th>Descripcion</th>
											<th>Fecha despublicacion</th>
											<th>Fecha publicacion</th>
											<th>Tipo</th>
											<th>Estado</th>
											<th>Curso</th>
											<th>Persona</th>
											<th>Tags</th>
											<th>Grupo</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${archivos}" var="archivo"
											varStatus="status">
											<tr>
												<td>${archivo.id}</td>
												<td>${archivo.nombre}</td>
												<td>${archivo.descripcion}</td>
												<td>${archivo.fechaDespublicacion}</td>
												<td>${archivo.fechaPublicacion}</td>
												<td>${archivo.archivoTipo.nombre}</td>
												<td>${archivo.estado == 1 ? 'Publico' : 'Privado'}</td>
												<td>${archivo.curso}</td>
												<td>${archivo.persona}</td>
												<td>${archivo.tags}</td>
												<td>${archivo.grupo}</td>
												<td>
												<c:choose>
													<c:when test="${login.permiso == '1'}">
														<a  name="editArchivo"
															data-archivoId="${archivo.id}"><button
																	class="btn btn-info btn-circle" type="button">
																	<i class="fa fa-pencil"></i>
																</button></a> <a  name="deleteArchivo"
															data-archivoId="${archivo.id}"><button
																	class="btn btn-danger btn-circle" type="button">
																	<i class="fa fa-times"></i>
																</button></a>
													</c:when>
													<c:when test="${login.permiso == '2'}">
														<a  name="editArchivo"
															data-archivoId="${archivo.id}"><button
																	class="btn btn-info btn-circle" type="button">
																	<i class="fa fa-pencil"></i>
																</button></a> 
													</c:when>
												</c:choose>
														<a  name="dowloadArchivo"
													data-archivoId="${archivo.id}" href="/repouniversity/vistaPrevia?archivoId=${archivo.id}&bread=Vista previa-2"><button
															class="btn btn-primary btn-circle" type="button">
															<i class="fa fa-search"></i>
														</button></a>
														
														<a  name="dowloadArchivo"
													data-archivoId="${archivo.id}" href="/repouniversity/bajarArchivo?archivoId=${archivo.id}"><button
															class="btn btn-success btn-circle" type="button">
															<i class="fa fa-download"></i>
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
			<div id="hiddenInputs" class="hidden">
				<input type="hidden" name="miPermiso" value="${login.permiso}"/>
			</div>
			<%@include file="../../components/footer.jsp"%>
		</div>
		<!-- 	Ventanas -->
		<div id="editarArchivoDialog" title="Editar Archivo">
			<form id="editarArchivoForm" class="form-horizontal">
				<input name="archivoId" type="hidden">
				<div class="form-group">
					<label class="col-sm-2 control-label">Descripción*:</label>
					<div class="col-sm-10">
						<input name="descripcion" type="text" class="form-control"
							required="required">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Fecha de Publicación*:</label>
					<div class="col-sm-10">
						<input name="fechaPublicacion" type="text" class="form-control" read-only disabled />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Tipo:</label>
					<div class="col-sm-10">
						<input name="tipo" type="text" class="form-control" read-only disabled />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Tags*:</label>
					<div class="col-sm-10">
						<input name="tags" type="text" class="form-control"
							required="required">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Estado*:</label>
					<div class="col-sm-10">
						<select name="estado" class="form-control" required="required">
							<option value="1" selected>Publico</option>
							<option value="2">Privado</option>
						</select>
					</div>
				</div>
			</form>
		</div>

		<div id="deleteArchivoDialog" title="Eliminar Archivo">
			<p>¿Esta seguro que desea eliminar la archivo?</p>
		</div>
		
	</div>

</body>
</html>