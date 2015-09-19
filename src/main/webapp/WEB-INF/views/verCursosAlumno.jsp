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
		
		<tag:breadcrumb label="Ver cursos"/>
	
	 	<div class="wrapper wrapper-content animated fadeInRight ">
	         <div class="row">
	             <div class="col-lg-12">
	              <div class="ibox float-e-margins">
	                  <div class="ibox-title">
	                      <h5>Mis cursos</h5>
		              </div>
	                  <div class="ibox-content">
	                  	<table id="cursosAlumno" class="table table-striped table-hover">
	                  		<thead class="encabezado">
								<tr>
									<th>Id</th>
									<th>Nombre</th>
									<th>Codigo</th>
									<th>Descripcion</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${cursos}" var="curso" varStatus="status">
									<tr>
										<td>${curso.id}</td>
										<td>${curso.nombre}</td>
										<td>${curso.codigo}</td>
										<td>${curso.descripcion}</td>
										<td>
											<a href="#" name="deleteCurso" data-cursoId="${curso.id}" ><button class="btn btn-danger btn-circle" type="button" title="Eliminar curso"><i class="fa fa-times"></i></button></a>
											<a href="/repouniversity/alumno/verCurso?cursoId=${curso.id}&bread=Curso-2"><button class="btn btn-primary btn-circle" type="button" title="Editar curso"><i class="fa fa-arrow-right"></i></button></a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
	                  	</table>
	                  </div>
	              </div>
	      		</div>
	         </div>
	     </div>
        
<%-- 		<%@include file="../components/footer.jsp"%> --%>
	</div>
	
	<div id="deleteCursoDialog" title="Eliminar Curso">
		<p>¿Esta seguro que desea darse de baja en el curso?</p>
	</div>
	</div>
	
</body>
</html>