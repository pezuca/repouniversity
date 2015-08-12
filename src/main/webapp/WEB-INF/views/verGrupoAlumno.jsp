<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="activeTab" value="${'verGrupo'}" />
<c:set var="userLog" value="${sessionScope.login}" />
<html>
<head>
	<meta charset="utf-8" />
	<title>Repouniversity</title>
	<%@include file="../components/common-statics-imports.jsp"%>
	<script src="/repouniversity/resources/js/application/verGrupoDocente.js"></script>
		<script src="/repouniversity/resources/js/plugins/chosen/chosen.jquery.js"></script>
	<link rel="stylesheet" type="text/css" href="/repouniversity/resources/css/plugins/chosen/chosen.css" />
</head>
<body class=" pace-done">
	
	<div id="wrapper">
	<%@include file="../components/static-nav-bar.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
		<%@include file="../components/search-nav-bar.jsp"%>
		
		<tag:breadcrumb label="Ver grupo"/>
	
	 	<div class="wrapper wrapper-content animated fadeInRight">
	         <div class="row">
	             <div class="col-lg-12">
	              <div class="ibox float-e-margins">
						<div class="GrupoInformation">
							<div class="page-header">
								<h3><b>${grupo.nombre}</b></h3>
							</div>
							
						</div>
						
	                  <div class="ibox-title">
	                      <h5>Alumnos</h5>
		              </div>
	                  <div class="ibox-content">
	                  	<table id="GruposAlumnos" class="table table-striped table-hover" >
	                  		<thead class="encabezado">
							<tr>
								<th>Id</th>
								<th>Alumno</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${grupo.alumnos}" var="alumno" varStatus="status">
								<tr>
									<td>${alumno.id}</td>
									<td>${alumno.persona.apellido}, ${alumno.persona.nombre}</td>
								</tr>
							</c:forEach>
						</tbody>
	                  	</table>
	                  </div>
	                  <div class="ibox-title">
	                      <h5>Trabajo Practicos</h5>
		              </div>
	                  <div class="ibox-content">
	                  	<table id="GruposTP" class="table table-striped table-hover" >
	                  		<thead class="encabezado">
							<tr>
								<th>Id</th>
								<th>Descripcion</th>
								<th>Archivo</th>
								<th>Nota</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${grupo.tpGrupo}" var="tpgrupo" varStatus="status">
								<tr>
									<td>${tpgrupo.id}</td>
									<td>${tpgrupo.descripcion}</td>
									<td>${tpgrupo.archivoNombre}</td>
									<td>${tpgrupo.nota}</td>
									<td>
										<a href="/repouniversity/vistaPrevia?archivoId=${tpgrupo.archivo}&bread=Vista Previa-4" name="verArchivo" data-tpgrupoId="${tpgrupo.id}" ><button class="btn btn-success btn-circle" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Ver Archivo"><i class="fa fa-search"></i></button></a>
										<a href="/repouniversity/bajarArchivo?archivoId=${tpgrupo.archivo}" name="dowloadArchivo" data-tpgrupoId="${tpgrupo.id}" ><button class="btn btn-success btn-circle" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Bajar Archivo"><i class="fa fa-download"></i></button></a>
										<a href="/repouniversity/grupo/verTrabajosPracticosAlumno?tpGrupoId=${tpgrupo.id}&bread=Ver TP-4" name="Ver" data-tpgrupoId="${tpgrupo.id}" ><button class="btn btn-primary btn-circle" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Ver TP"><i class="fa fa-arrow-right"></i></button></a>
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
        
		<%@include file="../components/footer.jsp"%>
	</div>
			
	</div>
	
	<div id="hiddenInputs" class="hidden">
		<input type="hidden" name="personaId" value="${userLog.idPersona}"/>
		<input type="hidden" name="cursoId" value="${grupo.idCurso}"/>
	</div>

	
</body>
</html>