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
		
		<tag:breadcrumb label="Lista de resultados"/>
		
			<div class="wrapper wrapper-content animated fadeInRight">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="ibox float-e-margins">
	                        <div class="ibox-content">
	                        	<c:choose>
	                        		<c:when test="${listaResultados.size() == 1 and not parametroBusqueda.isEmpty()}">
								        <h2>
			                                Se encontro ${listaResultados.size()} resultado con: <span class="text-navy">${parametroBusqueda}</span>
			                            </h2>
								    </c:when>
								    <c:when test="${listaResultados.size() == 1 and parametroBusqueda.isEmpty()}">
								        <h2>
			                                Se encontro ${listaResultados.size()} resultado con: <span class="text-navy">${parametroBusqueda}</span>
			                            </h2>
								    </c:when>    
								    <c:when test="${listaResultados.size() > 0 and not parametroBusqueda.isEmpty()}">
								        <h2>
			                                Se encontraron ${listaResultados.size()} resultados con: <span class="text-navy">${parametroBusqueda}</span>
			                            </h2>
								    </c:when>
								    <c:when test="${listaResultados.size() > 0 and not parametroBusqueda.isEmpty()}">
								        <h2>
			                                Se encontraron ${listaResultados.size()} resultados con: <span class="text-navy">${parametroBusqueda}</span>
			                            </h2>
								    </c:when>
								    <c:when test="${listaResultados.size()>0 and parametroBusqueda.isEmpty()}">
								        <h2>
			                                Se encontraron ${listaResultados.size()} resultados con: <span class="text-navy">${parametroBusqueda}</span>
			                            </h2>
								    </c:when>    
								    <c:otherwise>
								        <h2>
			                                No se encontraron resultados  para su busqueda <span class="text-navy">${parametroBusqueda}</span>
			                            </h2>
								    </c:otherwise>
								</c:choose>
	                        	<c:forEach items="${listaResultados}" var="result" varStatus="status">
									<div class="search-result">
		                                <h3><a href="#">${result.nombre}</a></h3>
		                                <h5><a href="#">fecha publicacion: ${result.fechaPublicacion}</a></h5>
		                                <p>
		                                    ${result.descripcion}<br><br><button class="btn btn-primary btn-xs" type="button">vista previa</button>
		                                </p>
		                            </div>
		                            <div class="hr-line-dashed"></div>
								</c:forEach>
	                        </div>
	                    </div>
	            	</div>
	        	</div>
			
			<%@include file="../components/footer.jsp"%>
			</div>
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