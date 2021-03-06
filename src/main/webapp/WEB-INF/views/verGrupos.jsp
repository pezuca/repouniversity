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
		
		<tag:breadcrumb label="Ver grupos"/>
		
		<div class="wrapper wrapper-content animated fadeInRight ">
			
			<div class="row">
			<div class="col-lg-12">
	        	<c:forEach items="${grupos}" var="grupo" varStatus="status">
					<c:if test = "${status.count mod 2 != 0}" >
						<div class="row">
					</c:if>
					<div class="col-lg-6">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5>${grupo.nombre}</h5>
								<div class="ibox-tools">
									<a class="collapse-link">
										<i class="fa fa-chevron-up"></i>
									</a>
								</div>
							</div>
							<div class="ibox-content profile-content">
								<c:forEach items="${grupo.tpGrupo}" var="tpGrupo" varStatus="status">
									<h4><strong>Trabajo Practico: ${tpGrupo.descripcion}</strong></h4>
									<p><i class="fa fa-clock-o"></i> Fecha: ${tpGrupo.fechasys}</p>
									<h5>
									   Nota: ${tpGrupo.nota}
									</h5>
								</c:forEach>
								<div class="row m-t-md">

									<div class="col-md-9">
										<h5><a  name="verGrupo data-grupoId="${grupo.id}" href="/repouniversity/alumno/verGrupo?grupoId=${grupo.id}">
												<button class="btn btn-success btn-circle" type="button"><i class="fa fa-group"></i>
												</button>
											</a>
										</h5>
									</div>
								</div>
							</div>

						</div>
					</div>
					<c:if test = "${status.count mod 2 != 0}" >
						</div>
					</c:if>	
                </c:forEach>
			</div>
		</div>
		</div>
		</div>
<%-- 		<%@include file="../components/footer.jsp"%> --%>
	</div>
<!-- 	<script> -->
// 		$(document).ready(function() {
// 			$('#clientTable').dataTable({
// 				retrieve: true,
// 				"processing" : false,
// 				"serverSide" : false,
// 				"pagingType": "full_numbers",
// 				"language": {
// 		            "search": "B�squeda"
// 		        },
// 		        "columnDefs": [
// 		                       {"width": "35%", "targets": 0},
// 		                       {"width": "40%", "targets": 1},
// 		                       {"width": "25%", "targets": 2},
// 		                       { orderable: false, targets: [11] }
// 		                      ],
// 		                      "order": [[ 0, "desc" ]]
// 			});
// 		});
		
// 	}
<!-- 	</script>	 -->
</body>
</html>