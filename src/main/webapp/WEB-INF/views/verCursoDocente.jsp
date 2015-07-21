<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="activeTab" value="${'verCursoDocente'}" />
<c:set var="userLog" value="${sessionScope.login}" />

<html>
<head>
<meta charset="utf-8" />
<title>Repouniversity</title>
<%@include file="../components/common-statics-imports.jsp"%>
<script
	src="/repouniversity/resources/js/plugins/chosen/chosen.jquery.js"></script>
<script
	src="/repouniversity/resources/js/application/verCursoDocente.js"></script>
	<script
	src="/repouniversity/resources/js/application/Archivos.js"></script>
<link rel="stylesheet" type="text/css"
	href="/repouniversity/resources/css/plugins/chosen/chosen.css" />
</head>
<body class="pace-done">
	<div id="wrapper">
		<%@include file="../components/static-nav-bar.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">

			<%@include file="../components/search-nav-bar.jsp"%>
			
			<tag:breadcrumb label="Ver curso"/>

			<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row">
					<div class="col-lg-12">
						<h2>Detalles curso ${curso.nombre}</h2>
					</div>
				</div>
				<div class="row">
				<a data-toggle="modal" href="#fileUpload" class="btn btn-success"><i class="fa fa-upload"></i> Subir Archivo</a>
					<div class="col-lg-6">
						<c:forEach items="${curso.notificaciones}" var="notificacion" varStatus="status">
	                  
	                            <div class="alert alert-info alert-dismissable">
	                                <p>Curso: ${notificacion.curso.nombre}, ${notificacion.curso.descripcion}</p>
									<p>${notificacion.tipo.descripcion}</p>
									<button aria-hidden="true" data-dismiss="alert" class="altaNotificacion btn btn-primary"
											onclick="altaEnCurso(${notificacion.id})">Confirmar</button>&nbsp;
									<button aria-hidden="true" data-dismiss="alert" class="rechazoNotificacion btn btn-danger"
											onclick="rechazoAltaEnCurso(${notificacion.id})">Rechazar</button>
	                            </div>
	                   
						</c:forEach>
            		</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5>Lista de Grupos</h5>
								<div class="ibox-tools" id="crearGrupoButton">
									<a class="btn btn-primary btn-xs"><i class="fa fa-magic"></i>
										Grupo</a>
								</div>
							</div>
							<div class="ibox-content">
								<table id="cursosGrupos" class="table table-striped table-hover">
									<thead class="encabezado">
										<tr>
											<th>Grupo</th>
											<th>Fecha Modificacion</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${curso.grupos}" var="grupo"
											varStatus="status">
											<tr>
												<td>${grupo.nombre}</td>
												<td>${grupo.fechasys}</td>
												<td><a class="verCurso"
													href="/repouniversity/docente/verGrupo?grupoId=${grupo.id}"><button
															class="btn btn-primary">Ver</button></a></td>
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
	<div class="row">
			<div class="col-lg-12">
	        	<c:forEach items="${archivos}" var="archivo" varStatus="status">
            	<c:if test = "${status.count mod 2 != 0}" >
            	<div class="row">
            	</c:if>
            	<div class="col-lg-6">
                    <div class="ibox float-e-margins">

							<div class="ibox-title">
								<h5>${archivo.nombre}</h5>
								<div class="ibox-tools">
									<a class="collapse-link">
										<i class="fa fa-chevron-up"></i>
									</a>
									<a class="close-link">
										<i class="fa fa-times"></i>
									</a>
								</div>
							</div>
							<div class="ibox-content profile-content">
								<h4><strong>Materia: ${archivo.materia}</strong></h4>
								<p><i class="fa fa-clock-o"></i> Publicado en ${archivo.fechaPublicacion}</p>
								<h5>
								   Tipo de Archivo: ${archivo.tipoArchivo}
								</h5>
								<p>
									${archivo.descripcion}
									<br>
									<br>
									<small>Publicado por ${archivo.apellidoPersona}, ${archivo.nombrePersona}</small>
									<br>
									<br>
									Estado archivo: ${archivo.estadoArchivo}</p>
								<div class="row m-t-md">
									<div class="col-md-3">
										<h5>
										<a  name="editArchivo" data-archivoId="${archivo.id}"><button class="btn btn-info btn-circle" type="button"><i class="fa fa-pencil"></i></button></a>
										<a  name="deleteArchivo" data-archivoId="${archivo.id}"><button class="btn btn-danger btn-circle" type="button"><i class="fa fa-times"></i> </button></a>
										</h5>
									</div>
									<div class="col-md-9">
										<h5>
											<a  name="verArchivo" data-archivoId="${archivo.id}" href="/repouniversity/vistaPrevia?archivoId=${archivo.id}">
												<button class="btn btn-primary btn-circle" type="button"><i class="fa fa-search"></i>
												</button>
											</a>
			
											<a  name="dowloadArchivo" data-archivoId="${archivo.id}" href="/repouniversity/bajarArchivo?archivoId=${archivo.id}" target="_blank">
												<button class="btn btn-success btn-circle" type="button"><i class="fa fa-download"></i>
												</button>
											</a>
										</h5>
									</div>
								</div>
							</div>
					</div>
					</div>
					<c:if test = "${status.count mod 2 == 0}" >
            			</div>
            		</c:if>	
                    </c:forEach>
				</div>
				</div>
				</div>

				<!-- 	Ventanas -->
				<div id="crearGrupoDialog" title="Nuevo Grupo" class="modal fade in">
					<form id="nuevoGrupoForm" class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">Nombre Grupo*:</label>
							<div class="col-sm-10">
								<input name="nombre" type="text" class="form-control"
									required="required" />
							</div>
							<div class="col-sm-10">
								<input name="idcurso" type="hidden" class="form-control"
									required="required" value="${curso.id}" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Lista de Alumnos*:</label>
							<div class="col-sm-10">
								<select data-placeholder="Elija un alumno" name="alumnosIds"
									multiple class="chosen-select" required="required"
									tabindex="-1">
									<c:forEach items="${curso.alumnosSinGrupo}" var="alumno"
										varStatus="status">
										<option value="${alumno.id}">${alumno.persona.apellido},
											${alumno.persona.nombre}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</form>
				</div>
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
			                <label class="col-sm-2 control-label">Estado*:</label>
			                <div class="col-sm-10">
			                	<select name="estadoArchivo" class="form-control" required="required">
			                		<option value="1" selected>Publico</option>
			                		<option value="2">Privado</option>
			                	</select>
			                </div>
			            </div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">Tags*:</label>
							<div class="col-sm-10">
								<input name="tags" type="text" class="form-control"
									required="required">
							</div>
						</div>
					</form>
				</div>
		
				<div id="deleteArchivoDialog" title="Eliminar Archivo">
					<p>¿Esta seguro que desea eliminar la archivo?</p>
				</div>
						
				<%@include file="../components/footer.jsp"%>
			</div>
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