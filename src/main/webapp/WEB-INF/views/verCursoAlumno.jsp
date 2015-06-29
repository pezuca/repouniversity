<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="activeTab" value="${'dashboard'}" />
<c:set var="userLog" value="${sessionScope.login}"/>

<html>
<head>
<meta charset="utf-8" />
<title>Repouniversity</title>
<%@include file="../components/common-statics-imports.jsp"%>

<script type="text/javascript" src="/repouniversity/resources/js/application/dashboard.js"></script>
</head>
<body class=" pace-done">
	<div id="wrapper">
		<%@include file="../components/static-nav-bar.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
		
		<%@include file="../components/search-nav-bar.jsp"%>
		
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
	             <div class="col-lg-12">
					<div class="usuarioInformation">
						<div class="page-header">
							<h1>Detalles curso ${curso.nombre}</h1>
						</div>
						<div class="page-header">
							<h3>Notificaciones</h3>
						</div>
					</div>

					<table id="cursosDocente" class="table table-striped hover">
						<thead class="encabezado">
							<tr>
								<th>Tipo notificacion</th>
								<th>Nombre alumno</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${curso.notificaciones}" var="notificacion" varStatus="status">
								<tr>
									<td>${notificacion.tipo.descripcion}</td>
									<td>${notificacion.alumno.persona.nombre} ${notificacion.alumno.persona.apellido}</td>
									<td>
										<button class="altaNotificacion btn btn-primary" onclick="altaEnCurso(${notificacion.id})">Confirmar</button>&nbsp;
										<button class="rechazoNotificacion btn btn-danger" onclick="rechazoAltaEnCurso(${notificacion.id})">Rechazar</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr class="head">
								<th><a data-toggle="modal" href="#fileUpload" class="btn btn-success"><i class="fa fa-upload"></i> Subir Archivo</a></th>
								<th></th>
								<th><a href="/repouniversity/alumno/verGrupo?grupoId=${curso.grupoAlumno.id}" name="Ver" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Ver grupo" class="btn btn-success"><i class="fa fa-upload"></i> Ver Grupo</a></th>
							</tr>
						</tfoot>
					</table>
				</div>
	        </div>
		</div>
		<%@include file="../components/footer.jsp"%>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$('#clientTable').dataTable({
				"processing" : false,
				"serverSide" : false,
				"paging": false,
				"language": {
		            "search": "B�squeda"
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
				  url: "/repouniversity/notificacion/rechazaaltancurso",
				  data: {"notificacionId" : notificacionId},
				  success: function(){ 
					  alert("Good!")
				  }
			});
		}
		
	</script>
	<div id="hiddenInputs" class="hidden">
		<input type="hidden" name="personaId" value="${userLog.idPersona}"/>
		<input type="hidden" name="cursoId" value="${curso.id}"/>
	</div>
	<%@include file="../components/fileUpload.jsp"%>
</body>
</html>