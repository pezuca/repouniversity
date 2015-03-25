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
				<h1>Detalles curso ${curso.nombre}</h1>
			</div>
			<div class="page-header">
				<h3>Notificaciones</h3>
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
		<table id="cursosDocente" class="table table-striped hover">
			<thead class="encabezado">
				<tr>
					<th>Tipo notificacion</th>
					<th>Nombre alumno</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${curso.notificaciones}" var="notificacion"
					varStatus="status">
					<tr>
						<td>${notificacion.tipo.descripcion}</td>
						<td>${notificacion.alumno.persona.apellido}, ${notificacion.alumno.persona.nombre}</td>
<!-- 						<td>Federico Selacome Paradela</td> -->
						<td><button class="altaNotificacion btn btn-primary" onclick="altaEnCurso(${notificacion.id})">Confirmar</button>&nbsp;
							<button class="rechazoNotificacion btn btn-danger" onclick="rechazoAltaEnCurso(${notificacion.id})">Rechazar</button>
						</td>
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
		<button class="altaNotificacion btn btn-primary" onclick="altaEnCurso(${notificacion.id})">Crear Grupo</button>&nbsp;
		<table id="cursosGrupos" class="table table-striped hover">
			<thead class="encabezado">
				<tr>
					<th>Grupo</th>
					<th>Fecha Modificacion</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${curso.grupos}" var="grupo"
					varStatus="status">
					<tr>
						<td>${grupo.nombre}</td>
						<td>${grupo.fechasys}</td>
						<td><a class="verCurso"
						href="/repouniversity/docente/verGrupo?grupoId=${grupo.id}"><button class="btn btn-primary">Ver</button></a></td>
					</tr>
<!-- 						<td> -->
<%-- 						<button class="verGrupo btn btn-primary" onclick="verGrupo(${curso.grupo.id})">Ver</button>&nbsp; --%>
<%-- 							<button class="rechazoNotificacion btn btn-danger" onclick="rechazoAltaEnCurso(${notificacion.id})">Eliminar</button> --%>
<!-- 						</td> -->
<!-- 					</tr> -->
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
		<table id="cursosGruposAlumnos" class="table table-striped hover">
			<thead class="encabezado">
				<tr>
					<th>Id</th>
					<th>Alumno</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${curso.alumnos}" var="alumno"
					varStatus="status">
					<tr>
						<td>${alumno.persona.id}</td>
						<td>${alumno.persona.apellido}, ${alumno.persona.nombre}</td>
						<td><input name="cbGrupo" type="checkbox" />
						</td>
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
	</div>
	<%@include file="../components/footer.jsp"%>
</body>
</html>