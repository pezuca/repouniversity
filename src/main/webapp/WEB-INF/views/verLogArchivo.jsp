<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="activeTab" value="${'verLogArchivo'}" />
<c:set var="userLog" value="${sessionScope.login}" />
<html>
<head>
	<meta charset="utf-8" />
	<title>Repouniversity</title>
	<%@include file="../components/common-statics-imports.jsp"%>
	<script src="/repouniversity/resources/js/application/verTpGrupoAlumno.js"></script>
</head>
<body class=" pace-done">
	
	<div id="wrapper">
	<%@include file="../components/static-nav-bar.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
		<%@include file="../components/search-nav-bar.jsp"%>
		
		<tag:breadcrumb label="Log Archivo"/>
	
	 	<div class="wrapper wrapper-content animated fadeInRight ">
	         <div class="row">
	             <div class="col-lg-12">
	              <div class="ibox float-e-margins">
						<div class="GrupoInformation">
							<div class="page-header">
								<h3><b>Log Archivo</b></h3>
							</div>
						</div>
				                 <div class="ibox-title">
				        </div>
				        <div class="ibox-content">
				           	<table id="LogUnArchivo" class="table table-striped table-hover" >
				          		<thead class="encabezado">
								<tr>
									<th>Id</th>
									<th>Nombre </th>
									<th>Fecha</th>
								</tr>
								</thead>
								<tbody>
									<c:forEach items="${logArchivoList}" var="unLogArchivo" varStatus="status">
										<tr>
											<td>${unLogArchivo.id}</td>
											<td>${unLogArchivo.persona.apellido}, ${unLogArchivo.persona.nombre}</td>
											<td>${unLogArchivo.fechasys}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
				        </div>
	              </div>
	      		</div>
	         </div>

	         
	     </div>
        <div id="hiddenInputs" class="hidden">
				<input type="hidden" name="miPermiso" value="${login.permiso}"/>
		</div>
<%-- 		<%@include file="../components/footer.jsp"%> --%>
	</div>
	
	
	<input name="archivoIdGlobal" type="hidden" value="${param.archivoId}" />
	</div>
	
</body>
</html>