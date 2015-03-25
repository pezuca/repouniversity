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
	<c:set var="userLog" value="${sessionScope.login}"/>
	
	<div class="container">
		<%@include file="../components/static-nav-bar.jsp"%>
		<div class="usuarioInformation">
			<div class="page-header">
				<h1>Detalles grupo ${grupo.nombre}</h1>
			</div>
			<div class="page-header">
				<h3>Alumnos</h3>
			</div>
		</div>

		<script>
		$(document).ready(function() {
			$('#clientTable').dataTable({
				"processing" : false,
				"serverSide" : false,
				"paging": false,
				"language": {
		            "search": "Búsqueda"
		        }
			});
	
			$("#clientTable_length").remove();
		});
		
		function altaEnCurso(notificacionId) {
			$.ajax({
				  type: "POST",
				  url: "/repouniversity/notificacion/confirmaaltancurso",
				  data: {"notificacionId" : notificacionId},
				  success: function(){ 
					  alert("Good!")
				  }
			});
		}
		
		
		function rechazoAltaEnCurso(notificacionId) {
			$.ajax({
				  type: "POST",
				  url: "/repouniversity/notificion/rechazaaltancurso",
				  data: {"notificacionId" : notificacionId},
				  success: function(){ 
					  alert("Good!")
				  }
			});
		}
		
		</script>
		
		<table id="GruposAlumnos" class="table table-striped hover">
			<thead class="encabezado">
				<tr>
					<th>Id</th>
					<th>Alumno</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${grupo.alumnos}" var="alumno"
					varStatus="status">
					<tr>
						<td>${alumno.persona.id}</td>
						<td>${alumno.persona.apellido}, ${alumno.persona.nombre}</td>
						
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
	<table id="GruposTP" class="table table-striped hover">
			<thead class="encabezado">
				<tr>
					<th>Id</th>
					<th>Numero TP</th>
					<th>Archivo</th>
					<th>Nota</th>
				</tr>
			</thead>
			<tbody>
				
					<tr>
						<td>1</td>
						<td>Trabajo Nro1</td>
						<td><button class="altaNotificacion btn btn-primary" onclick="altaEnCurso(${notificacion.id})">Ver</button>&nbsp;</td>
						<td>8</td>
					</tr>
			</tbody>
			<tfoot>
				<tr class="head">
					<th></th>
					<th></th>
					<th></th>
				</tr>
			</tfoot>
		</table>
	</div>
	<%@include file="../components/footer.jsp"%>
</body>
</html>