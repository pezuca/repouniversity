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

</head>
<body class=" pace-done">
	<div id="wrapper">
		<%@include file="../components/static-nav-bar.jsp"%>
		
		<div id="page-wrapper" class="gray-bg dashbard-1">
		
		<%@include file="../components/search-nav-bar.jsp"%>

		<tag:breadcrumb label="Ver notificaciones"/>
		
		<div class="wrapper wrapper-content animated fadeInRight pre-scrollable">
	         <div class="row">
	             <div class="col-lg-12">
	              <div class="ibox float-e-margins">
	                  <div class="ibox-content">
	                  	<table id="notificaciones" class="table">
	                  		<thead class="encabezado">
								<tr>
									<th><input type="checkbox" name="selectAll"/></th>
									<th>Id</th>
									<th>Nombre</th>
									<th>Notificacion</th>
									<th>Curso</th>
									<th>Descripcion</th>
<!-- 									<th></th> -->
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${notificaciones}" var="notificacion" varStatus="status">
									<tr>
										<td></td>
										<td>${notificacion.id}</td>
										<td>${notificacion.alumno.persona.apellido}, ${notificacion.alumno.persona.nombre}</td>
										<td>${notificacion.tipo.descripcion}</td>
										<td>${notificacion.curso.nombre}</td>
										<td>${notificacion.curso.descripcion}</td>
<!-- 										<td> -->
<%-- 											<c:choose> --%>
<%-- 												<c:when test="${login.rol == 'alumno'}"> --%>
<%-- 													<a href="#" onclick="borrarNotificacion(${notificacion.id})"><button class="btn btn-danger btn-circle" type="button" title="Eliminar curso"><i class="fa fa-times"></i></button></a> --%>
<%-- 												</c:when> --%>
<%-- 												<c:when test="${login.rol == 'docente'}"> --%>
<%-- 													<a href="#" onclick="altaEnCurso(${notificacion.id})"><button class="btn btn-primary btn-circle" type="button" title="Editar curso"><i class="fa fa-arrow-right"></i></button></a> --%>
<%-- 													<a href="#" onclick="rechazoAltaEnCurso(${notificacion.id})"><button class="btn btn-danger btn-circle" type="button" title="Eliminar curso"><i class="fa fa-times"></i></button></a> --%>
<%-- 												</c:when> --%>
<%-- 											</c:choose> --%>
<!-- 										</td> -->
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
	</div>
	<div id="successDialog" title="">
		<p class="message"></p>
	</div>
	<div id="errorDialog" title="">
		<p class="message"></p>
	</div>
	<script>
		$(document).ready(function() {
			table = $('#notificaciones').DataTable({
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
		                       {"width": "5%", "targets": 0},
		                       {"width": "5%", "targets": 1},
		                       {"width": "15%", "targets": 2},
		                       {"width": "15%", "targets": 3},
		                       {"width": "20%", "targets": 4},
		                       {"width": "20%", "targets": 5},
// 		                       {"width": "15%", "targets": 6},
		                       { orderable: false, targets: [0] }
		                      ],
		        "order": [[ 1, "desc" ]],
		        "oLanguage": {
		            "sInfoEmpty": "No hay resultados disponibles.",
		            "sSearch": "Filtrar por: ",
		            "sInfo": "Mostrando (_START_ a _END_) de _TOTAL_ resultados",
		            "sZeroRecords": "No fueron encontrados resultados.",
		            "oPaginate": {
		                "sFirst": "Primera",
		                "sLast": "Ultima",
		                "sNext": "Siguiente",
		                "sPrevious": "Previa"
		            }
		          },
		          dom: 'T<"clear">lfrtip',
		          tableTools: {
		              "sRowSelect": "multi",
		              aButtons:     [ 'select_all', 'select_none' ]
		          }
			});
			
			$("#notificaciones_wrapper").first().find(".col-sm-6").first().append($("#notificaciones").parents(".ibox:first").find(".ibox-title"));
			
			$("#notificaciones_length").remove();
			
			$(".DTTT_container").first().append("<a id='aceptarTodo' data-toggle='modal' class='btn btn-outline btn-primary'><i class='fa fa-upload'></i> Aceptar</a><a id='rechazarTodo' data-toggle='modal' class='btn btn-outline btn-danger'><i class='fa fa-upload'></i> Rechazar</a>");
			
			$("#aceptarTodo").click(function() {
				var datos = table.rows('.selected').data();
				var idsDatos = "";
				
				if(datos.length > 0) {
					for(var i = 0; i< datos.length; i++){
						idsDatos = idsDatos + datos[i][1];
						
						if(datos.length - 1 != i) {
							idsDatos = idsDatos + ",";
						}
					}
					
					altaEnCurso(idsDatos);
					
				}
			});
			
			$("#rechazarTodo").click(function() {
				var datos = table.rows('.selected').data();
				var idsDatos = "";
				
				if(datos.length > 0) {
					for(var i = 0; i< datos.length; i++){
						idsDatos = idsDatos + datos[i][1];
						
						if(datos.length - 1 != i) {
							idsDatos = idsDatos + ",";
						}
					}
					rechazoAltaEnCurso(idsDatos);
				}
				
			});
			
			$("#successDialog").dialog({
				resizable: false,
				width:450,
				modal: true,
				autoOpen: false,
				closeOnEscape: false,
				hide: {effect: "fade", duration: 300},
				show: {effect: "fade", duration: 300},
				buttons: {
					"Aceptar": function() {
						$(this).dialog("close");
						window.location.href = "/repouniversity/dashboard?bread=Home-0";
					}
				},
				open: function(event, ui) {
					$(".ui-dialog-titlebar-close").hide();
					$("#successDialog .message").append($("#successDialog").data('message'));
				},
				close: function(event, ui) {
					$("#errorDialog .message").empty();
				}
			});
			
			$("#errorDialog").dialog({
				resizable: false,
				width:450,
				modal: true,
				autoOpen: false,
				closeOnEscape: false,
				hide: {effect: "fade", duration: 300},
				show: {effect: "fade", duration: 300},
				buttons: {
					"Aceptar": function() {
						$(this).dialog("close");
						window.location.href = window.location.href;
					}
				},
				open: function(event, ui) {
					$(".ui-dialog-titlebar-close").hide();
					$("#errorDialog .message").append($("#errorDialog").data('message'));
				},
				close: function(event, ui) {
					$("#errorDailog .message").empty();
				}
			});
			
			$("#ToolTables_notificaciones_0 span").text("Seleccionar todo");
			$("#ToolTables_notificaciones_1 span").text("Deseleccionar todo");
			
			$("#ToolTables_notificaciones_0, #ToolTables_notificaciones_1").hide();
			
			$('input[name=selectAll]').change(function() {
		        if($(this).is(":checked")) {
		        	$("#ToolTables_notificaciones_0").trigger( "click" );
		        } else {
		        	$("#ToolTables_notificaciones_1").trigger( "click" );
		        }
		    });
		});

		function borrarNotificacion(notificacionId) {
			$.ajax({
				  type: "POST",
				  url: "/repouniversity/notificacion/borrarNotificacion",
				  data: {"notificacionId" : notificacionId},
				  success: function(){ 
					  $("#successDailog").data("message","Las notificaciones se procesaron correctamente.").dialog("open");
				  },
				  error: function(){ 
					  $("#errorDailog").data("message","Hubo un error al procesar las notificaciones.").dialog("open");
				  }
			});
		}
		
		function altaEnCurso(notificacionIds) {
			$.ajax({
				  type: "POST",
				  url: "/repouniversity/notificacion/confirmaaltancurso",
				  data: {"notificacionId" : notificacionIds},
				  success: function(data){ 
					  $("#successDialog").data("message", "Las notificaciones se procesaron correctamente.").dialog("open");
				  },
				  error: function(data){ 
					  $("#errorDialog").data("message", "Hubo un error al procesar las notificaciones.").dialog("open");
				  }
			});
		}
		
		function rechazoAltaEnCurso(notificacionId) {
			$.ajax({
				  type: "POST",
				  url: "/repouniversity/notificacion/rechazaaltancurso",
				  data: {"notificacionId" : notificacionId},
				  success: function(){ 
					  $("#successDialog").data("message","Las notificaciones se procesaron correctamente.").dialog("open");
				  },
				  error: function(){ 
					  $("#errorDialog").data("message","Hubo un error al procesar las notificaciones.").dialog("open");
				  }
			});
		}
	</script>	
	
</body>
</html>
