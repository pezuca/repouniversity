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
			
			<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row">
		             <div class="col-lg-12">
						<div class="col-lg-4">
							<a href="/repouniversity/alumno/cursos?bread=Ver cursos-1">
								<div class="widget navy-bg p-lg text-center">
									<div class="m-b-md">
										<i class="fa fa-pencil-square-o fa-4x"></i>
										<h1 class="m-xs">${cursos}</h1>
										<h3 class="font-bold no-margins">
											Cursos inscripto
										</h3>
										<small>mis cursos</small>
									</div>
								</div>
							</a>
						</div>
					
						<div class="col-lg-4">
							<a href="/repouniversity/alumno/notificaciones?bread=Notificaciones-1">
								<div class="widget red-bg p-lg text-center">
									<div class="m-b-md">
										<i class="fa fa-bell fa-4x"></i>
										<h1 class="m-xs">${notificaciones}</h1>
										<h3 class="font-bold no-margins">
											Notificaciones
										</h3>
										<small>tiene nuevas novedades</small>
									</div>
								</div>
							</a>
						</div>

					
						<div class="col-lg-4">
							<div id="agregarErrorButton">
								<a href="#">
								   <div class="widget yellow-bg p-lg  text-center">
										<div class="m-b-md">
											<i class="fa fa-warning fa-4x"></i>
											<h1 class="m-xs"> </h1>
											<h3 class="font-bold no-margins">
												Reportar
											</h3>
											<small>error</small>
										</div>
									</div>
								</a>
							</div>
						</div>
					 
					 </div>
		        </div>
		        <div class="row">
		             <div class="col-lg-12">
						<div class="col-lg-4">
							<a  href="/repouniversity/alumno/verGrupos?bread=Ver Grupos-1">
								<div class="widget navy-bg p-lg text-center">
									<div class="m-b-md">
										<i class="fa fa-group fa-4x"></i>
										<h1 class="m-xs">${grupos}</h1>
										<h3 class="font-bold no-margins">
											Grupos inscripto
										</h3>
										<small>mis grupos</small>
									</div>
								</div>
							</a>
						</div>
					
						<div class="col-lg-4">
							<a href="/repouniversity/verArchivos?bread=Ver archivos-1">
								<div class="widget blue-bg p-lg text-center">
									<div class="m-b-md">
										<i class="fa fa-file-pdf-o fa-4x"></i>
										<h1 class="m-xs">${archivos}</h1>
										<h3 class="font-bold no-margins">
											Archivos subidos
										</h3>
										<small>mis archivos</small>
									</div>
								</div>
							</a>
						</div>

					
						<div class="col-lg-4">
							  <div class="widget blue-bg p-lg  text-center">
									<div class="m-b-md">
										<i class="fa fa-thumbs-up fa-4x"></i>
										<h1 class="m-xs">${tps}</h1>
										<h3 class="font-bold no-margins">
											TP
										</h3>
										<small>aprobados</small>
									</div>
								</div>
							
						</div>
					 
					 </div>
		        </div>

			</div>
			<%@include file="../components/footer.jsp"%>
		</div>
				   <!-- 	Ventanas -->
			<div id="agregarErrorDialog" title="Nuevo Error">
				<form id="nuevoErrorForm" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label">Descripcion*:</label>
						<div class="col-sm-10"><textarea name="descripcion" class="form-control" placeholder="Reporte error.." required="required"></textarea></div>
					</div>
				   
				</form>
			</div>
	</div>	
</body>
</html>