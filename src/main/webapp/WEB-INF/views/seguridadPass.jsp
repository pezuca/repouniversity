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
	 		<div class="row">
				<div class="col-lg-9">
					<form id="strongPass" method="post" class="form-horizontal" action="/repouniversity/seguridad/editarSeguridadPass" role="form">
						<input name="seguridadId" value = "${seguridad.id}" type="hidden">
			            <div class="form-group">
			                <label class="col-sm-3 control-label">Cantidad Mayusculas:</label>
			                <div class="col-sm-6"><input value = "${seguridad.mayusculas}" name="mayusculas" type="number" min = 0 max = 100 class="form-control" required="required"></div>
			            </div>
			           	<div class="form-group">
			                <label class="col-sm-3 control-label">Cantidad Minusculas:</label>
			                <div class="col-sm-6"><input value = "${seguridad.minusculas}" name="minusculas" type="number" min = 0 max = 100 class="form-control" required="required"></div>
			            </div>
			           	<div class="form-group">
			                <label class="col-sm-3 control-label">Cantidad Especiales:</label>
			                <div class="col-sm-6"><input value = "${seguridad.especiales}" name="especiales" type="number" min = 0 max = 100 class="form-control" required="required"></div>
			            </div>
			           	<div class="form-group">
			                <label class="col-sm-3 control-label">Cantidad Numeros:</label>
			                <div class="col-sm-6"><input value = "${seguridad.numeros}" name="numeros" type="number" min = 0 max = 100 class="form-control" required="required"></div>
			            </div>
			           	<div class="form-group">
			                <label class="col-sm-3 control-label">Longitud minima:</label>
			                <div class="col-sm-6"><input value = "${seguridad.longMinima}" name="longMinima" type="number" min=5 max = 100 class="form-control" required="required"></div>
			            </div>
			            <div class="form-group">
				             <div class="col-sm-8 col-sm-offset-3">
				                   	<div class="row">
				                       	<button class="btn btn-primary" type="submit">Guardar</button>
				                    </div>
				             </div>
				        </div>
			      	</form>
	      		</div>
	      	</div>
	     </div>
        
		<%@include file="../components/footer.jsp"%>
	</div>
	
    <script>
    	$(document).ready(function(){
    		$('input[name=mayusculas], input[name=minusculas], input[name=especiales], input[name=numeros]').change(function() {
    			var longuitud = 0;
    			
    			longuitud += parseInt($('input[name=mayusculas]').val());
    			longuitud += parseInt($('input[name=minusculas]').val());
    			longuitud += parseInt($('input[name=especiales]').val());
    			longuitud += parseInt($('input[name=numeros]').val());
    			
    			if(longuitud >= $('input[name=longMinima]').attr("min")){
	    			$('input[name=longMinima]').val(longuitud);
    			} else {
    				$(this).val(parseInt($(this).val()) + 1);
    				alert("No puede establecer menos caracteres que la longuitud mínima.");
    			}
    		});
    	});
    </script>
</body>
</html>