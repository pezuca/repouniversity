<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8" />
<title>Repouniversity</title>
<%@include file="../components/common-statics-imports.jsp"%>
<link rel="stylesheet" type="text/css"
	href="/repouniversity/resources/css/jquery.dataTables_themeroller.css" />
<link rel="stylesheet" type="text/css"
	href="/repouniversity/resources/css/jquery.dataTables.min.css" />
</head>
<body>
	<c:set var="userLog" value="${sessionScope.login}"/>
	
	
		<%@include file="../components/static-nav-bar.jsp"%>
		<div class="usuarioInformation">
			<div class="page-header">
				<h1>Lista Cursos</h1>
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

					<td>${cursoMat.curso.codigo}</td>
					<td>${cursoMat.materia.nombre}</td>
					<td>${cursoMat.curso.descripcion}</td>
					<td><a class="verCurso"
						href="/repouniversity/docente/verCurso?cursoId=${cursoMat.curso.id}"><button class="btn btn-primary">Ver</button></a></td>
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
	
	<%@include file="../components/footer.jsp"%>
</body>
</html>