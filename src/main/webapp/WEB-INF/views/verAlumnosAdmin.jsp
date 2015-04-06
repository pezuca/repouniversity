<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="activeTab" value="${'verAlumnos'}" />
<c:set var="userLog" value="${sessionScope.login}" />

<html>
<head>
	<meta charset="utf-8" />
	<title>Repouniversity</title>
	<%@include file="../components/common-statics-imports.jsp"%>
</head>
<body class=" pace-done">
	
	<div id="wrapper">
	<%@include file="../components/static-nav-bar.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
		<script>
			$(document).ready(function() {
				$('#listaPersonas').dataTable({
					"processing" : false,
					"serverSide" : false,
					"paging" : false,
					"language" : {
						"search" : "B�squeda"
					}
				});
	
				$("#clientTable_length").remove();
			});
		</script>
		<%@include file="../components/search-nav-bar.jsp"%>
	
	 	<div class="wrapper wrapper-content animated fadeInRight">
	         <div class="row">
	             <div class="col-lg-12">
	              <div class="ibox float-e-margins">
	                  <div class="ibox-title">
	                      <h5>Lista de alumnos</h5>
	                  </div>
	                  <div class="ibox-content">
	                  	<table id="listaPersonas" class="table table-striped table-bordered table-hover dataTables-example" >
	                  		<thead class="encabezado">
							<tr>
								<th>Id</th>
								<th>Nombre</th>
								<th>Apellido</th>
								<th>Mail</th>
								<th>Activo</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${alumnos}" var="alumno"
								varStatus="status">
								<tr>
									<td>${alumno.id}</td>
									<td>${alumno.persona.nombre}</td>
									<td>${alumno.persona.apellido}</td>
									<td>${alumno.persona.mail}</td>
									<td>${alumno.activo ? 'Si' : 'No'}</td>
									<td><a class="verCurso" href="#"><button
												class="btn btn-primary">Editar</button></a></td>
									<td><a class="verCurso" href="#"><button
												class="btn btn-primary">Eliminar</button></a></td>
								</tr>
							</c:forEach>
						</tbody>
	                  	</table>
	                  </div>
	              </div>
	      		</div>
	         </div>
	     </div>
        
		<%@include file="../components/footer.jsp"%>
	</div>
<!-- 	Fin del del div page-wrapper -->
	</div>
</body>
</html>