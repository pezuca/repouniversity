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
<script src="/repouniversity/resources/js/application/reportarError.js"></script>
</head>
<body class=" pace-done">
	<div id="wrapper">
		<%@include file="../components/static-nav-bar.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<%@include file="../components/search-nav-bar.jsp"%>
			
			<tag:breadcrumb label="Home"/>
			
			<div class="wrapper wrapper-content animated fadeInRight ">
				<div class="row">
					<div class="col-lg-12">
						<div class="row">
							<div class="col-lg-12">
								<div class="col-lg-4">
									<div id="agregarErrorDashboardButton">
										<a href="#">
										   <div class="widget yellow-bg p-lg  text-center">
												<div class="m-b-md">
													<i class="fa fa-warning fa-4x"></i>
													<h1 class="m-xs">Reportar</h1>
													<h3 class="font-bold no-margins">
														nuevo
													</h3>
													<small>error</small>
												</div>
											</div>
										</a>
									</div>
								</div>
						<c:forEach items="${usuarioParametros}" var="usuarioParametro" varStatus="status">
							<c:if test = "${status.count + 1 mod 3 == 1}" >
								<div class="row">
									<div class="col-lg-12">
							</c:if>
								<div class="col-lg-4">
									<c:if test = "${usuarioParametro.parametro.link != ''}" >
										<a href="${usuarioParametro.parametro.link}">
									</c:if>
										<div class="widget ${usuarioParametro.color.colorPantalla}-bg p-lg text-center">
											<div class="m-b-md">
												<i class="${usuarioParametro.parametro.icono}"></i>
												<h1 class="m-xs" id = "cuadrado-${usuarioParametro.parametro.variable}"></h1>
												<h3 class="font-bold no-margins">
													${usuarioParametro.parametro.parametro}
												</h3>
												<small>${usuarioParametro.parametro.descricpion}</small>
											</div>
										</div>
									<c:if test = "${usuarioParametro.parametro.link != ''}" >
										</a>
									</c:if>
								</div>
							<c:if test = "${status.count + 1 mod 3 == 0}" >
									</div>
								</div>
							</c:if>	
		                </c:forEach>
					</div>
				</div>
			</div>
		</div>
		<!-- 	Ventanas -->
			<div id="agregarErrorDialog" title="Nuevo Error">
				<form id="nuevoErrorForm" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label">Descripcion*:</label>
						<div class="col-sm-10"><textarea name="descripcion" class="form-control" placeholder="Reporte error.." required="required"></textarea></div>
					</div>
				   	<div>
		                <small>(*) Datos obligatorios</small>
		            </div>
				</form>
			</div>
	</div>	
	<script>
	$(document).ready(function() {
		$.ajax({
			type : "GET",
			url : "/repouniversity/dashboard/datos",
			success : function(datita) {
				for (var i = 0; i < Object.keys(datita).length; i++) {
					if ($("#cuadrado-" + i).size() != 0) {
						$("#cuadrado-" + i).text(datita[i])
					}
				}
			}
		});
	});
</script>
</body>
</html>