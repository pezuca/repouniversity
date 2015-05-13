<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="activeTab" value="${'verCursoDocente'}" />
<c:set var="userLog" value="${sessionScope.login}"/>

<html>
<head>
<meta charset="utf-8" />
<title>Repouniversity</title>
<%@include file="../components/common-statics-imports.jsp"%>

<script type="text/javascript" src="resources/js/application/dashboard.js"></script>
<script src="/repouniversity/resources/js/application/verCursoDocente.js"></script>
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
								<th></th>
								<th></th>
								<th></th>
							</tr>
						</tfoot>
					</table>
					<div class="ibox-title">
	                      <h5>Grupos</h5>
		                  <div class="ibox-tools" id="crearGrupoButton">
	                          <a href="#crearGrupoButton" class="btn btn-primary btn-xs"><i class="fa fa-magic"></i>  Grupo</a>
	                      </div>
	                </div>
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
					
				</div>
	        </div>
		</div>
		<!-- 	Ventanas -->
	<div id="crearGrupoDialog" title="Nuevo Grupo" class="modal fade in">
		<form id="nuevoGrupoForm" class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label">Nombre Grupo*:</label>
                <div class="col-sm-10"><input name="nombre" type="text" class="form-control" required="required"></div>
                <div class="col-sm-10"><input name="idcurso" type="hiden" class="form-control" required="required" value = "${curso.id}"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Lista de Alumnos*:</label>
                <div class="col-sm-10">
                	<table id="cursoGruposAlumnos" class="table table-striped hover">
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
									<td><input name="cursosGruposAlumnos" type="checkbox" value="${alumno.persona.id}"/>
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
            </div>
		</form>
	</div>
		<%@include file="../components/footer.jsp"%>
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
				  url: "/repouniversity/notificacion/rechazaaltancurso",
				  data: {"notificacionId" : notificacionId},
				  success: function(){ 
					  alert("Good!")
				  }
			});
		}
	</script>
</body>
</html>