<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="activeTab" value="${'verErroresArchivos'}" />
<c:set var="userLog" value="${sessionScope.login}" />

<html>
<head>
<meta charset="utf-8" />
<title>Repouniversity</title>
<%@include file="../components/common-statics-imports.jsp"%>
<script src="/repouniversity/resources/js/application/reportarError.js"></script>
</head>
<body class=" pace-done">

	<div id="wrapper">
		<%@include file="../components/static-nav-bar.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<%@include file="../components/search-nav-bar.jsp"%>
			
			<tag:breadcrumb label="Ver errores"/>

			<div class="wrapper wrapper-content animated fadeInRight pre-scrollable">
				<div class="row">
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5>Lista de Errores</h5>
							</div>
							<div class="ibox-content">
								<table id="listaErrores" class="table table-striped table-hover" >
								<thead class="encabezado">
								<tr>
									<th>Error</th>
									<th>Reportado por</th>
									<th>Fecha</th>
									<th>Archivo</th>
									<th></th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${errorArchivo}" var="error" varStatus="status">
									<tr>
										<td>${error.descripcion}</td>
										<td>${error.persona.apellido}, ${error.persona.nombre}</td>
										<td>${error.fechasys}</td>
										<c:if test = "${error.archivo.id != 0 && error.archivo.id != null}" >
											<td>${error.archivo.nombre} <a href="/repouniversity/vistaPrevia?archivoId=${error.archivo.id}&bread=Vista previa-2" name="verArchivo" data-errorId="${error.id}" ><button class="btn btn-success btn-circle" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Ver Archivo"><i class="fa fa-search"></i></button></a></td>						
										</c:if>	
										<c:if test = "${error.archivo.id == 0 || error.archivo.id == null}" >
											<td> Sin archivo </td>						
										</c:if>
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

			<%@include file="../components/footer.jsp"%>
		</div>
		<!-- 	Ventanas -->
		<div id="deleteErrorDialog" title="Eliminar error">
			<p>¿Esta seguro que desea eliminar el error reportado?</p>
		</div>
	</div>

</body>
</html>