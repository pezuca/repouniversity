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
<script
	src="/repouniversity/resources/js/application/notificaciones.js"></script>

</head>
<body class=" pace-done">
	<div id="wrapper">
		<%@include file="../components/static-nav-bar.jsp"%>
		
		<div id="page-wrapper" class="gray-bg dashbard-1">
		
		<%@include file="../components/search-nav-bar.jsp"%>

		<tag:breadcrumb label="Ver notificaciones"/>
		
		<input type="hidden" name="rolName" value="${userLog.rol}" />
		
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
									</tr>
								</c:forEach>
							</tbody>
	                  	</table>
	                  </div>
	              </div>
	      		</div>
	         </div>
	     </div>
		</div>
	</div>
	<div id="successDialog" title="">
		<p class="message"></p>
	</div>
	<div id="errorDialog" title="">
		<p class="message"></p>
	</div>	
</body>
</html>
