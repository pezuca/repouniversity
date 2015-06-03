<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="activeTab" value="${'verTpGrupoDocente'}" />
<c:set var="userLog" value="${sessionScope.login}"/>

<html>
<head>
<meta charset="utf-8" />
<title>Repouniversity</title>
<%@include file="../components/common-statics-imports.jsp"%>

<script type="text/javascript" src="resources/js/application/dashboard.js"></script>
<script src="/repouniversity/resources/js/application/verCursoDocente.js"></script>
</head>
<body class=" pace-done">
	<c:set var="userLog" value="${sessionScope.login}"/>
	
	<div id="wrapper">
		<%@include file="../components/static-nav-bar.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
		
		<%@include file="../components/search-nav-bar.jsp"%>
		
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
	             <div class="col-lg-12">
					<div class="usuarioInformation">
						<div class="page-header">
							<h1>Grupo ${tpgrupo.grupo}</h1>
						</div>
						
						<div class="page-header">
							<h3>Detalles TP ${tpgrupo.descripcion}</h3>
						</div>
					</div>
					<div class="ibox-title">
	                      <h5>Entregas</h5>
		                  <div class="ibox-tools" id="crearGrupoButton">
	                          <a href="#crearGrupoButton" class="btn btn-primary btn-xs"><i class="fa fa-magic"></i>  Entrega</a>
	                      </div>
	                </div>
	                <table id="EntregaTP" class="table table-striped hover">
						<thead class="encabezado">
							<tr>
								<th>Id</th>
								<th>Descripcion</th>
								<th>Archivo</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${tpgrupo.tpEntrega}" var="tpentrega"
								varStatus="status">
								<tr>
									<td>${tpentrega.id}</td>
									<td>${tpentrega.descripcion}</td>
									<td>${tpentrega.archivo}</td>
									<td><button class="altaNotificacion btn btn-primary"><a href="/repouniversity/docente/verTrabajosPracticos?tpId=${tpentrega.id}"> Ver</a></button>&nbsp;</td>
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
	
</body>
</html>