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
		
			<div class="wrapper wrapper-content animated fadeInRight pre-scrollable">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="ibox float-e-margins">
	                        <div class="ibox-content">
	                        	<c:choose>
	                        		<c:when test="${listaResultados.size() == 1 and not parametroBusqueda.isEmpty()}">
								        <h2>
			                                Se encontro ${listaResultados.size()} resultado
			                            </h2>
								    </c:when>
								    <c:when test="${listaResultados.size() == 1 and parametroBusqueda.isEmpty()}">
								        <h2>
			                                Se encontro ${listaResultados.size()} resultado 
			                            </h2>
								    </c:when>    
								    <c:when test="${listaResultados.size() > 0 and not parametroBusqueda.isEmpty()}">
								        <h2>
			                                Se encontraron ${listaResultados.size()} resultados
			                            </h2>
								    </c:when>
								    <c:when test="${listaResultados.size() > 0 and not parametroBusqueda.isEmpty()}">
								        <h2>
			                                Se encontraron ${listaResultados.size()} resultados
			                            </h2>
								    </c:when>
								    <c:when test="${listaResultados.size()>0 and parametroBusqueda.isEmpty()}">
								        <h2>
			                                Se encontraron ${listaResultados.size()} resultados
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
		                                <h3>${result.nombre}</h3>
		                                <h5>Fecha publicacion: ${result.fechaPublicacion}</h5>
		                                <p>
		                                    ${result.descripcion}<br><br>
		                                    <a  name="verArchivo" data-archivoId="${result.id}" href="/repouniversity/vistaPrevia?archivoId=${result.id}&bread=Vista previa-1">
												<button class="btn btn-primary btn-xs" type="button">vista previa</button>
											</a>
		                                </p>
		                            </div>
		                            <div class="hr-line-dashed"></div>
								</c:forEach>
	                        </div>
	                    </div>
	            	</div>
	        	</div>
			
			</div>
<%-- 			<%@include file="../components/footer.jsp"%> --%>
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