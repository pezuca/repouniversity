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
		
		<tag:breadcrumb label="Solicitar curso"/>
		
		<div class="wrapper wrapper-content animated fadeInRight pre-scrollable">
			<div class="row">
	             <div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Solicitud de alta a cursos</h5>
						</div>
						<div class="ibox-content">
							<table id="clientTable" class="table table-striped hover">
								<thead class="encabezado">
									<tr>
										<th>Codigo Mat</th>
										<th>Materia</th>
										<th>Descripcion</th>
										<th>Docente</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${cursosMaterias}" var="cursoMat"
										varStatus="status">
										<tr class="even">
											<td>${cursoMat.codigoCurso}</td>
											<td>${cursoMat.nombreMateria}</td>
											<td>${cursoMat.descripcionCurso}</td>
											<td>${cursoMat.docente.persona.nombre} ${cursoMat.docente.persona.apellido}</td>
											<td>
												<c:choose>
													<c:when test="${cursoMat.tipoNotificacion != 1}">
														<button data-cursoId="${cursoMat.id}" class="btn btn-info btn-circle" type="button" onclick="clickSolicitud(${cursoMat.id}, ${userLog.idAluDoc}, ${cursoMat.docente.id}, 1)"><i class="fa fa-check"></i></button>
													</c:when>
													<c:otherwise>
														<button disabled="disabled" class="btn btn-info btn-circle" type="button"><i class="fa fa-check"></i></button>
													</c:otherwise>
												</c:choose>
											</td>
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
	        </div>
		</div>
		
		<%@include file="../components/footer.jsp"%>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$('#clientTable').dataTable({
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
		            "search": "Búsqueda: "
		        },
		        "columnDefs": [
		                       {"width": "15%", "targets": 0},
		                       {"width": "25%", "targets": 1},
		                       {"width": "25%", "targets": 2},
		                       {"width": "20%", "targets": 3},
		                       {"width": "10%", "targets": 4},
		                       { orderable: false, targets: [4] }
		                      ],
		                      "order": [[ 0, "desc" ]]
			});
		});
		
		function clickSolicitud(cursoId, alumnoId, docenteId, tipoNotif) {
			$.ajax({
				  type: "POST",
				  url: "/repouniversity/alumno/solicitarCurso",
				  data: {"cursoId" : cursoId, "alumnoId" : alumnoId, "docenteId" : docenteId, "tipoNotif" : tipoNotif},
				  success: function(){
						$.gritter.add({
							title:'Solicitud',
							text: 'La solicitud fue enviada correctamente. Aguarde la respuesta del docente.',
							sticky: false
						});
						
						$("button[data-cursoId=" + cursoId + "]").attr("disabled", "disabled");
				  },
				  error: function(){
						$.gritter.add({
							title:'Solicitud',
							text: 'Hubo un problema al enviar su solicitud. Por favor inténtelo mas tarde.',
							sticky: false
						});
				  }
			});
		}
	</script>	
</body>
</html>
