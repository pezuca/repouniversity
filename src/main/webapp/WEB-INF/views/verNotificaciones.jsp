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
		
		<tag:breadcrumb label="Ver notificaciones"/>
		
		<div id="page-wrapper" class="gray-bg dashbard-1">
		
		<%@include file="../components/search-nav-bar.jsp"%>
		
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
	            
			<div class="col-lg-6">
				<c:forEach items="${notificaciones}" var="notificacion" varStatus="status">
                  
                            <div class="alert alert-info alert-dismissable">
                                <button aria-hidden="true" data-dismiss="alert" class="close" type="button" onclick="borrarNotificacion(${notificacion.id})">×</button>
                               	<p>Curso: ${notificacion.curso.nombre}, ${notificacion.curso.descripcion}</p>
								<p>${notificacion.tipo.descripcion}</p>
                            </div>
                   
				</c:forEach>
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

		function borrarNotificacion(notificacionId) {
			$.ajax({
				  type: "POST",
				  url: "/repouniversity/notificacion/borrarNotificacion",
				  data: {"notificacionId" : notificacionId},
				  success: function(){ 
					  alert("Good!")
				  }
			});
		}
		

	</script>	
</body>
</html>
