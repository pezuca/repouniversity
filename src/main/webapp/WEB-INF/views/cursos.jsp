<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8" />
<title>Repouniversity</title>
<%@include file="../components/common-statics-imports.jsp"%>
<script type="text/javascript"
	src="/repouniversity/resources/js/application/misDatos.js"></script>
</head>
<body>
	
		<%@include file="../components/static-nav-bar.jsp"%>
		<div class="usuarioInformation">
			<div class="page-header">
				<h1>Mis Cursos</h1>
			</div>
			
		<table class="table table-hover" id="employee-table"
			style='display: "table"'>
			<thead>
				<tr>
					<th>Id</th>
					<th>Nombre</th>
					<th>Codigo</th>
					<th>Descripcion</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cursos}" var="curso">
					<tr>
						<td>${curso.id}</td>
						<td>${curso.nombre}</td>
						<td>${curso.codigo}</td>
						<td>${curso.descripcion}</td>
						<td><a href="/repouniversity/alumno/verCurso?cursoId=${curso.id}"><button class="btn btn-primary">Ver</button></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
	
	<%@include file="../components/footer.jsp"%>
</body>
</html>