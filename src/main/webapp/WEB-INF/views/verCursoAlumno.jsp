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
		
		<tag:breadcrumb label="Ver curso"/>
		
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
	             <div class="col-lg-12">
					<div class="usuarioInformation">
						<div class="page-header">
							<h1>Detalles curso ${curso.nombre}</h1>
						</div>
					</div>
				<div class="col-lg-2">
                    <div class="widget navy-bg p-lg text-center">
                    	<a href="/repouniversity/alumno/verGrupo?grupoId=${curso.grupoAlumno.id}" name="Ver" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Ver grupo" class="m-b-md">
                            <i class="fa fa-user fa-3x"></i>
							<i class="fa fa-user fa-3x"></i>
                            <h1 class="m-xs">${curso.grupoAlumno.nombre}</h1>
                            <h3 class="font-bold no-margins">
                                
                            </h3>
                            
                         </a>
                       
                    </div>
                </div>
					<tr class="head">
						<th><a data-toggle="modal" href="#fileUpload" class="btn btn-success"><i class="fa fa-upload"></i> Subir Archivo</a></th>
						<th></th>
						<th><a href="/repouniversity/alumno/verGrupo?grupoId=${curso.grupoAlumno.id}&bread=Ver grupo-2" name="Ver" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Ver grupo" class="btn btn-success"><i class="fa fa-upload"></i> Ver Grupo</a></th>
					</tr>
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
										<h5><a  name="dowloadArchivo" data-archivoId="${archivo.id}" href="/repouniversity/vistaPrevia?archivoId=${archivo.id}&bread=Vista previa-3">
												<button class="btn btn-primary btn-circle" type="button"><i class="fa fa-search"></i>
												</button>
											</a>
										</h5>
									</div>
									<div class="col-md-9">
										<h5><a  name="dowloadArchivo" data-archivoId="${archivo.id}" href="/repouniversity/bajarArchivo?archivoId=${archivo.id}" target="_blank">
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
	<div id="hiddenInputs" class="hidden">
		<input type="hidden" name="personaId" value="${userLog.idPersona}"/>
		<input type="hidden" name="cursoId" value="${curso.id}"/>
	</div>
	<%@include file="../components/fileUpload.jsp"%>
</body>
</html>