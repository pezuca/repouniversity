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

		<tag:breadcrumb label="Ver notificaciones"/>
		
		<div class="wrapper wrapper-content animated fadeInRight pre-scrollable">
			<div class="row">
	            
			<div class="col-lg-6">
				<c:forEach items="${notificaciones}" var="notificacion" varStatus="status">
                  
							<c:choose>
								<c:when test="${login.rol == 'alumno'}">
		                            <div class="alert alert-info alert-dismissable">
		                                <button aria-hidden="true" data-dismiss="alert" class="close" type="button" onclick="borrarNotificacion(${notificacion.id})">×</button>
		                               	 <p>Curso: ${notificacion.curso.nombre}, ${notificacion.curso.descripcion}</p>
			                         	 <p>${notificacion.tipo.descripcion}</p>
			                             									 
		                            </div>
								</c:when>
								<c:when test="${login.rol == 'docente'}">
									 <div class="alert alert-info alert-dismissable">
			                             <p>El alumno: ${notificacion.alumno.persona.apellido}, ${notificacion.alumno.persona.nombre}</p>
			                         	 <p>${notificacion.tipo.descripcion}</p>
			                             <p>Curso: ${notificacion.curso.nombre}, ${notificacion.curso.descripcion}</p>
										 <button aria-hidden="true" data-dismiss="alert" class="altaNotificacion btn btn-primary"
													onclick="altaEnCurso(${notificacion.id})">Confirmar</button>&nbsp;
										 <button aria-hidden="true" data-dismiss="alert" class="rechazoNotificacion btn btn-danger"
													onclick="rechazoAltaEnCurso(${notificacion.id})">Rechazar</button>
			                         </div>
								</c:when>
				
							</c:choose>
                   
				</c:forEach>
            </div>
	        </div>
		</div>
		
<%-- 		<%@include file="../components/footer.jsp"%> --%>
		</div>
	</div>
	<script>
		$(document).ready(function() {
// 			$('#clientTable').dataTable({
// 				retrieve: true,
// 				"processing" : false,
// 				"serverSide" : false,
// 				"pagingType": "full_numbers",
// 				"language": {
// 		            "search": "Búsqueda"
// 		        },
// 		        "columnDefs": [
// 		                       {"width": "35%", "targets": 0},
// 		                       {"width": "40%", "targets": 1},
// 		                       {"width": "25%", "targets": 2},
// 		                       { orderable: false, targets: [11] }
// 		                      ],
// 		                      "order": [[ 0, "desc" ]]
// 			});
		});

		function borrarNotificacion(notificacionId) {
			$.ajax({
				  type: "POST",
				  url: "/repouniversity/notificacion/borrarNotificacion",
				  data: {"notificacionId" : notificacionId},
				  success: function(){ 
					 
				  }
			});
		}
		
		function altaEnCurso(notificacionId) {
			$.ajax({
				  type: "POST",
				  url: "/repouniversity/notificacion/confirmaaltancurso",
				  data: {"notificacionId" : notificacionId},
				  success: function(){ 
					 
				  }
			});
		}
		
		function rechazoAltaEnCurso(notificacionId) {
			$.ajax({
				  type: "POST",
				  url: "/repouniversity/notificacion/rechazaaltancurso",
				  data: {"notificacionId" : notificacionId},
				  success: function(){ 
					 
				  }
			});
		}
	</script>	
	
</body>
</html>
