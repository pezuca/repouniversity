<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
dfbhdsfhgczx ageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="activeTab" value="${'verErroresArchivos'}" />
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

			<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row">
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5>Lista de Errores</h5>
							</div>
							<div class="ibox-content">
								<table id="GruposAlumnos" class="table table-striped table-hover" >
								<thead class="encabezado">
								<tr>
									<th>Error</th>
									<th>Reportado por</th>
									<th>Fecha</th>
									<th></th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${errorArchivo}" var="error" varStatus="status">
									<tr>
										<td>${error.descripcion}</td>
										<td>${error.persona.apellido}, ${error.persona.nombre}</td>
										<td>${error.fechasys}</td>
										<td>
											<a name="deleteError" data-errorId="${error.id}" ><button class="btn btn-danger btn-circle" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Eliminar Error"><i class="fa fa-times"></i></button></a>
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

			<%@include file="../../components/footer.jsp"%>
		</div>
		<!-- 	Ventanas -->
		<div id="deleteErrorDialog" title="Eliminar error">
			<p>¿Esta seguro que desea eliminar el error reportado?</p>
		</div>
	</div>

</body>
</html>