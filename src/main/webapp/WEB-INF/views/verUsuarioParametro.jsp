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
		
		<tag:breadcrumb label="Ver Parametros"/>
	
	 	<div class="wrapper wrapper-content animated fadeInRight">
	         <div class="row">
	             <div class="col-lg-12">
	              <div class="ibox float-e-margins">
	                  <div class="ibox-title">
	                      <h5>Lista de parametros</h5>
		              </div>
	                  <div class="ibox-content">
	                  	<table id="listaParametros" class="table table-striped table-hover" >
	                  		<thead class="encabezado">
							<tr>
								<th>Parametro</th>
								<th>Orden</th>
								<th>Color</th>
								<th>Activo</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${usuarioParametros}" var="usuarioParametro" varStatus="status">
								<tr>
									<td data-parametroId="${usuarioParametro.parametro.id}">${usuarioParametro.parametro.parametro}</td>
									<td>${usuarioParametro.orden}</td>
									<td data-colorId="${usuarioParametro.color.id}">${usuarioParametro.color.color}</td>
									<td data-activoId = ${usuarioParametro.activo == true?'1':'0'}>${usuarioParametro.activo == true?'SI':'NO'}</td>
									<td>
										<a href="#" name="editUsuarioParametro" data-ususarioParametroId="${usuarioParametro.id}"><button class="btn btn-primary btn-circle" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Editar Usuario Parametro"><i class="fa fa-pencil"></i></button></a>
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