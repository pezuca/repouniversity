<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8" />
<title>Repouniversity</title>
<%@include file="../components/common-statics-imports.jsp"%>
<link rel="stylesheet" type="text/css"
	href="/repouniversity/resources/css/jquery.dataTables_themeroller.css" />
<link rel="stylesheet" type="text/css"
	href="/repouniversity/resources/css/jquery.dataTables.min.css" />
</head>
<body>
	<c:set var="userLog" value="${sessionScope.login}" />


	<%@include file="../components/static-nav-bar.jsp"%>
	<div class="usuarioInformation">
		<div class="page-header">
			<h1>Lista de Personas</h1>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$('#listaPersonas').dataTable({
				"processing" : false,
				"serverSide" : false,
				"paging" : false,
				"language" : {
					"search" : "Búsqueda"
				}
			});

			$("#clientTable_length").remove();
		});}
	</script>
	<table id="listaPersonas" class="table table-striped hover">
		<thead class="encabezado">
			<tr>
				<th>Id</th>
				<th>Nombre</th>
				<th>Apellido</th>
				<th>Rol</th>
				<th>Mail</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${listaDatosPersona}" var="datos"
				varStatus="status">
				<tr>
					<td>${datos.id}</td>
					<td>${datos.persona.nombre}</td>
					<td>${datos.persona.apellido}</td>
					<td>${datos.rol}</td>
					<td>${datos.persona.mail}</td>
					<td><a class="verCurso" href="#"><button
								class="btn btn-primary">Editar</button></a></td>
					<td><a class="verCurso" href="#"><button
								class="btn btn-primary">Eliminar</button></a></td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr class="head">
				<th></th>
				<th></th>
				<th></th>
			</tr>
		</tfoot>
	</table>

	<%@include file="../components/footer.jsp"%>
</body>
</html>