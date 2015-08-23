<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="activeTab" value="${'verUsuarioParametro'}" />
<c:set var="userLog" value="${sessionScope.login}" />

<html>
<head>
	<meta charset="utf-8" />
	<title>Repouniversity</title>
	<%@include file="../components/common-statics-imports.jsp"%>
	<script src="/repouniversity/resources/js/application/verUsuarioParametro.js"></script>
	<script src="/repouniversity/resources/js/plugins/chosen/chosen.jquery.js"></script>
	<link rel="stylesheet" type="text/css" href="/repouniversity/resources/css/plugins/chosen/chosen.css" />
</head>
<body class=" pace-done">
	
	<div id="wrapper">
	<%@include file="../components/static-nav-bar.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
		<%@include file="../components/search-nav-bar.jsp"%>
		
		<tag:breadcrumb label="Seguridad Pass"/>
	
	 	<div class="wrapper wrapper-content animated fadeInRight">
			<form method="post" class="form-horizontal" action="/repouniversity/seguridad/editarSeguridadPass" role="form">
				<input name="seguridadId" value = "${seguridad.id}" type="hidden">
	            <div class="form-group">
	                <label class="col-sm-2 control-label">Cantidad Mayusculas:</label>
	                <div class="col-sm-10"><input value = "${seguridad.mayusculas}" name="mayusculas" type="number" min = 0 class="form-control" required="required"></div>
	            </div>
	           	<div class="form-group">
	                <label class="col-sm-2 control-label">Cantidad Minusculas:</label>
	                <div class="col-sm-10"><input value = "${seguridad.minusculas}" name="minusculas" type="number" min = 0 class="form-control" required="required"></div>
	            </div>
	           	<div class="form-group">
	                <label class="col-sm-2 control-label">Cantidad Especiales:</label>
	                <div class="col-sm-10"><input value = "${seguridad.especiales}" name="especiales" type="number" min = 0 class="form-control" required="required"></div>
	            </div>
	           	<div class="form-group">
	                <label class="col-sm-2 control-label">Cantidad Numeros:</label>
	                <div class="col-sm-10"><input value = "${seguridad.numeros}" name="numeros" type="number" min = 0 class="form-control" required="required"></div>
	            </div>
	           	<div class="form-group">
	                <label class="col-sm-2 control-label">Longitud minima:</label>
	                <div class="col-sm-10"><input value = "${seguridad.longMinima}" name="longMinima" type="number" min = 0 class="form-control" required="required"></div>
	            </div>
	            <div class="form-group">
		             <div class="col-sm-4 col-sm-offset-2">
		                   	<div class="row">
		                       	<button class="btn btn-primary" type="submit">Guardar</button>
		                    </div>
		             </div>
		        </div>
	      	</form>
	     </div>
        
		<%@include file="../components/footer.jsp"%>
	</div>
<!-- 	Ventanas -->

	<div id="editarUsuarioParametroDialog" title="Editar Usuario Parametro">
		<form id="editarUsuarioParametroForm" class="form-horizontal">
			<input name="userParamId" type="hidden">
            <div class="form-group">
                <label class="col-sm-2 control-label">Orden*:</label>
                <div class="col-sm-10"><input name="orden" type="number" min = 1 class="form-control" required="required"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Color*:</label>
                <div class="col-sm-10">
                	<select name="color" class="form-control" required="required">
                		<c:forEach items="${colores}" var="color" varStatus="status">
                			<option value="${color.id}">${color.color}</option>
                		</c:forEach>
                	</select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Activo*:</label>
                <div class="col-sm-10">
                	<select name="activo" class="form-control" required="required">
                		<option value="1">SI</option>
                		<option value="0">NO</option>
                	</select>
                </div>
            </div>
		</form>
	</div>
	

	</div>
	
</body>
</html>