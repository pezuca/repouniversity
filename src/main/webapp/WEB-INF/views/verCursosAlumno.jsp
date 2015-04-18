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
		
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
	             <div class="col-lg-12">
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
	        </div>
		</div>
		
		<%@include file="../components/footer.jsp"%>
		</div>
	</div>	
</body>
</html>