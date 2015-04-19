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
							<h1>Lista Cursos</h1>
						</div>
					</div>
					
					<table id="cursosDocente" class="table table-striped hover">
						<thead class="encabezado">
							<tr>
								<th>Codigo Mat</th>
								<th>Materia</th>
								<th>Descripcion</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${cursosMaterias}" var="cursoMat"
								varStatus="status">
								<c:choose>
									<c:when test="${status.count mod 2 == 0}">
										<tr class="even">
									</c:when>
									<c:otherwise>
										<div class="odd">
									</c:otherwise>
								</c:choose>
			
								<td>${cursoMat.codigoCurso}</td>
								<td>${cursoMat.nombreMateria}</td>
								<td>${cursoMat.descripcionCurso}</td>
								<td><a class="verCurso"
									href="/repouniversity/docente/verCurso?cursoId=${cursoMat.id}"><button class="btn btn-primary">Ver</button></a></td>
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
	</script>
</body>
</html>