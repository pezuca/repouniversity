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
<script	src="/repouniversity/resources/js/application/Archivos.js"></script>
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
							<h3><b>${curso.nombre}</b></h3>
						
					</div>
				
					<tr class="head">
						<th><a data-toggle="modal" href="#fileUpload" class="btn btn-success"><i class="fa fa-upload"></i> Subir Archivo</a></th>
						<th></th>
						<c:choose>
							<c:when test="${curso.grupoAlumno.id != 1}">
								<th><a href="/repouniversity/alumno/verGrupo?grupoId=${curso.grupoAlumno.id}&bread=Ver grupo-2" name="Ver" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Ver grupo" class="btn btn-success"><i class="fa fa-upload"></i> Ver Grupo (${curso.grupoAlumno.nombre}) </a></th>
							</c:when>
							<c:otherwise>
								<th><a href="/repouniversity/alumno/verGrupo?grupoId=${curso.grupoAlumno.id}&bread=Ver grupo-2" name="Ver" type="button" disabled="disabled" data-toggle="tooltip" data-placement="top" data-original-title="Ver grupo" class="btn btn-success"><i class="fa fa-upload"></i> Ver Grupo (${curso.grupoAlumno.nombre}) </a></th>
							</c:otherwise>
						</c:choose>

						
					</tr>
				</div>
<div class="row">
			<div class="col-lg-12">
	        	<c:forEach items="${archivos}" var="archivo" varStatus="status">
            	<c:if test = "${status.count mod 2 != 0}" >
            	<div class="row">
            	</c:if>
            	<div class="col-lg-6 archivoPlaca">
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
								<div class="archivoInfo ${archivo.id}">
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
								</div>
								<div class="row m-t-md">
									<div class="col-md-6 botones">
									 	<div class="ocultos">
					            	    	<input type="hidden" value="${archivo.id}" name="archivoId" />
					            	    	<input type="hidden" value="${archivo.descripcion}" name="descripcion" />
					            	    	<input type="hidden" value="${archivo.estado}" name="estado" />
					            	    	<input type="hidden" value="${archivo.tags}" name="tags" />
					            	    </div>
										<h5>
											<c:if test="${archivo.idPersona == login.idPersona}">
												<a  name="editArchivo" data-archivoId="${archivo.id}"><button class="btn btn-info btn-circle" type="button"><i class="fa fa-pencil"></i></button></a>
												<a  name="deleteArchivo" data-archivoId="${archivo.id}"><button class="btn btn-danger btn-circle" type="button"><i class="fa fa-times"></i> </button></a>
											</c:if>
											<a  name="verArchivo" data-archivoId="${archivo.id}" href="/repouniversity/vistaPrevia?archivoId=${archivo.id}">
												<button class="btn btn-primary btn-circle" type="button"><i class="fa fa-search"></i>
												</button>
											</a>
											<a  name="dowloadArchivo" data-archivoId="${archivo.id}" href="/repouniversity/bajarArchivo?archivoId=${archivo.id}">
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
			<!-- 	Ventanas -->
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
							<label class="col-sm-2 control-label">Tags:</label>
							<div class="col-sm-10">
								<input name="tags" type="text" class="form-control" >
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
	<script>
		$(document).ready(function() {
			$('#clientTable').dataTable({
				retrieve: true,
				"processing" : false,
				"serverSide" : false,
				"paging": false,
				"language": {
		            "search": "Búsqueda"
		        }
			});
	
			$("#clientTable_length").remove();
			
			$('#fileUpload').on('hidden.bs.modal', function () {
				var success = $("#fileUpload input[name=atLestOneSuccess]").val();
				
				if(success == "1") {
					location.reload();
				}
			})
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