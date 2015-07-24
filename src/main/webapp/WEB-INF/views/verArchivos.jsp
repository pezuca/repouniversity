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

<script type="text/javascript" src="resources/js/application/dashboard.js"></script>
</head>
<body class=" pace-done">
	<div id="wrapper">
		<%@include file="../components/static-nav-bar.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
		
		<%@include file="../components/search-nav-bar.jsp"%>
		
		<tag:breadcrumb label="Mis archivos"/>
		
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
	             <div class="col-lg-12">
			
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
		
	}
	</script>	
</body>
</html>
