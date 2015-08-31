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
</head>
<body class=" pace-done">
	<div id="wrapper">
		<%@include file="../components/static-nav-bar.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
		
		<%@include file="../components/search-nav-bar.jsp"%>
		
		<tag:breadcrumb label="Ver cursos"/>
		
		<div class="wrapper wrapper-content animated fadeInRight pre-scrollable">
	         <div class="row">
	             <div class="col-lg-12">
	              <div class="ibox float-e-margins">
	                  <div class="ibox-title">
	                      <h5>Lista Cursos</h5>
		              </div>
	                  <div class="ibox-content">
							<table id="cursosDocente" class="table table-striped table-hover">
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
										<tr>					
											<td>${cursoMat.codigoCurso}</td>
											<td>${cursoMat.nombreMateria}</td>
											<td>${cursoMat.descripcionCurso}</td>
											<td><a href="/repouniversity/docente/verCurso?cursoId=${cursoMat.id}&bread=Curso-2"><button class="btn btn-primary btn-circle" type="button"><i class="fa fa-arrow-right"></i></button></a></td>
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

	<script>
		$(document).ready(function() {
			table = $('#cursosDocente').DataTable({
				retrieve: true,
				"processing" : false,
				"serverSide" : false,
				"pagingType": "full_numbers",
				"language": {
		            "lengthMenu": "Mostrar _MENU_ resultados por página",
		            "zeroRecords": "No fueron encontrados resultados.",
		            "info": "Pagina _PAGE_ of _PAGES_",
		            "infoEmpty": "No hay resultados disponibles.",
		            "infoFiltered": "(filtered from _MAX_ total records)",
		            "search": "Filtrar por: "
		        },
		        "columnDefs": [
		                       {"width": "20%", "targets": 0},
		                       {"width": "40%", "targets": 1},
		                       {"width": "25%", "targets": 2},
		                       {"width": "15%", "targets": 3},
		                       { orderable: false, targets: [3] }
		                      ],
		                      "order": [[ 0, "desc" ]]
			});
		});
	</script>
</body>
</html>