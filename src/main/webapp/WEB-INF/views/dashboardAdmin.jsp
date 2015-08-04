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
							<a href="/repouniversity/admin/verMaterias?bread=Ver materias-1">
								<div class="widget navy-bg p-lg text-center">
									<div class="m-b-md">
										<i class="fa fa-book fa-4x"></i>
										<h1 class="m-xs">${materias}</h1>
										<h3 class="font-bold no-margins">
											Materias disponibles
										</h3>
										<small>materias creadas</small>
									</div>
								</div>
							</a>
						</div>
					
						<div class="col-lg-4">
							<a href="/repouniversity/admin/verReporteErrores?bread=Ver reportes de errores-1">
								<div class="widget red-bg p-lg text-center">
									<div class="m-b-md">
										<i class="fa fa-bell fa-4x"></i>
										<h1 class="m-xs">${notificaciones}</h1>
										<h3 class="font-bold no-margins">
											Notificaciones
										</h3>
										<small>errores reportados</small>
									</div>
								</div>
							</a>
						</div>

					
						<div class="col-lg-4">
							<a href="/repouniversity/admin/verUsuarios?bread=Ver usuario-1">
								<div class="widget red-bg p-lg text-center">
									<div class="m-b-md">
										<i class="fa fa-group fa-4x"></i>
										<h1 class="m-xs">${usuarios}</h1>
										<h3 class="font-bold no-margins">
											Usuarios del sistema
										</h3>
										<small>usuarios activos</small>
									</div>
								</div>
							</a>
						</div>
					 
					 </div>
		        </div>
		        <div class="row">
		             <div class="col-lg-12">
						<div class="col-lg-4">
								<a href="/repouniversity/admin/verCursos?bread=Ver cursos-1">
									<div class="widget navy-bg p-lg text-center">
										<div class="m-b-md">
											<i class="fa fa-laptop fa-4x"></i>
											<h1 class="m-xs">${cursos}</h1>
											<h3 class="font-bold no-margins">
												Cursos disponibles
											</h3>
											<small>cursos creados</small>
										</div>
									</div>
								</a>
						</div>
					
						<div class="col-lg-4">
							<a href="/repouniversity/admin/verArchivos?bread=Ver archivos-1">
								<div class="widget blue-bg p-lg text-center">
									<div class="m-b-md">
										<i class="fa fa-file-pdf-o fa-4x"></i>
										<h1 class="m-xs">${archivos}</h1>
										<h3 class="font-bold no-margins">
											Archivos disponibles
										</h3>
										<small>Archivos del repositorio</small>
									</div>
								</div>
							</a>
						</div>

					
						<div class="col-lg-4">
								<a href="/repouniversity/admin/verCarreras?bread=Ver carreras-1">
									<div class="widget navy-bg p-lg text-center">
										<div class="m-b-md">
											<i class="fa fa-bank fa-4x"></i>
											<h1 class="m-xs">${carreras}</h1>
											<h3 class="font-bold no-margins">
												Carreras disponibles
											</h3>
											<small>carreras creados</small>
										</div>
									</div>
								</a>
						</div>
					 
					 </div>
		        </div>

			</div>
			<%@include file="../components/footer.jsp"%>
		</div>
			
	</div>	
</body>
</html>