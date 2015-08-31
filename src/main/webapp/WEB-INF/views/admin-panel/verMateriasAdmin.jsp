<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="activeTab" value="${'verMaterias'}" />
<c:set var="userLog" value="${sessionScope.login}" />

<html>
<head>
<meta charset="utf-8" />
<title>Repouniversity</title>
<%@include file="../../components/common-statics-imports.jsp"%>
<script
	src="/repouniversity/resources/js/application/admin-panel/verMateriasAdmin.js"></script>
</head>
<body class=" pace-done">
	<div id="wrapper">
		<%@include file="../../components/static-nav-bar.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<%@include file="../../components/search-nav-bar.jsp"%>
			
			<tag:breadcrumb label="Ver materias"/>

			<div class="wrapper wrapper-content animated fadeInRight pre-scrollable">
				<div class="row">
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5>Lista de materias</h5>
								<div class="ibox-tools" id="agregarMateriaButton">
									<a href="#" class="btn btn-primary btn-xs"><i
										class="fa fa-magic"></i> Materia</a>
								</div>
							</div>
							<div class="ibox-content">
								<table id="listaMaterias"
									class="table table-striped table-hover">
									<thead class="encabezado">
										<tr>
											<th>Id</th>
											<th>Nombre</th>
											<th>Descripción</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${materias}" var="materia"
											varStatus="status">
											<tr>
												<td>${materia.id}</td>
												<td>${materia.nombre}</td>
												<td>${materia.descripcion}</td>
												<td><a href="#" name="editMateria"
													data-materiaId="${materia.id}"><button
															class="btn btn-primary btn-circle" type="button">
															<i class="fa fa-pencil"></i>
														</button></a> <a href="#" name="deleteMateria"
													data-materiaId="${materia.id}"><button
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
		<div id="agregarMateriaDialog" title="Nueva Materia">
			<form id="nuevoMateriaForm" class="form-horizontal">
				<div class="form-group">
					<label class="col-sm-2 control-label">Nombre*:</label>
					<div class="col-sm-10">
						<input name="nombre" type="text" class="form-control"
							required="required">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Descripcion*:</label>
					<div class="col-sm-10">
						<input name="descripcion" type="text" class="form-control"
							required="required">
					</div>
				</div>
			</form>
		</div>

		<div id="editarMateriaDialog" title="Editar Usuario">
			<form id="editarMateriaForm" class="form-horizontal">
				<input name="materiaId" type="hidden">
				<div class="form-group">
					<label class="col-sm-2 control-label">Nombre*:</label>
					<div class="col-sm-10">
						<input name="nombre" type="text" class="form-control"
							required="required">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Descripcion*:</label>
					<div class="col-sm-10">
						<input name="descripcion" type="text" class="form-control"
							required="required">
					</div>
				</div>
			</form>
		</div>

		<div id="deleteMateriaDialog" title="Eliminar Materia">
			<p>¿Esta seguro que desea eliminar la materia?</p>
		</div>
	</div>

</body>
</html>