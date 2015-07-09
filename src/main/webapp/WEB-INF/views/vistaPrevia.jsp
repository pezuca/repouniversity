<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="activeTab" value="${'verCursos'}" />
<c:set var="userLog" value="${sessionScope.login}" />

<html>
<head>
	<meta charset="utf-8" />
	<title>Repouniversity</title>
	<%@include file="../components/common-statics-imports.jsp"%>
	<script	src="/repouniversity/resources/js/application/verCursosAlumno.js"></script>
</head>
<body class=" pace-done">
	
	<div id="wrapper">
	<%@include file="../components/static-nav-bar.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
		<%@include file="../components/search-nav-bar.jsp"%>
	
	 	<div class="wrapper wrapper-content animated fadeInRight">
	         <div class="row">
	            <div class="col-lg-3">
					<p>Nombre: ${archivo.nombre}</p>
					<p>Descipcion: ${archivo.descripcion}</p>
					<p>Tipo: ${archivo.tipoArchivo}</p>
					<p>Estado: ${archivo.estadoArchivo}</p>
					<p>Materia: ${archivo.materia}</p>
					<p>Curso: ${archivo.curso} (${archivo.descripcionCurso})</p>
	      		</div>
	      		<div class="col-lg-9">
					<iframe style="width: 100%;height: 500px;" src="/repouniversity/resources/js/ViewerJS/index.html#documents/previews/${archivo.path}" allowfullscreen webkitallowfullscreen></iframe>
	      		</div>
	         </div>
	     </div>
        
		<%@include file="../components/footer.jsp"%>
	</div>
	
	<div id="deleteCursoDialog" title="Eliminar Curso">
		<p>¿Esta seguro que desea darse de baja en el curso?</p>
	</div>
	</div>
	
</body>
</html>