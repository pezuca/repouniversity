<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="activeTab" value="${'verTPs'}" />
<c:set var="userLog" value="${sessionScope.login}" />
<html>
<head>
	<meta charset="utf-8" />
	<title>Repouniversity</title>
	<%@include file="../components/common-statics-imports.jsp"%>
	<script src="/repouniversity/resources/js/application/verTpGrupoDocente.js"></script>
</head>
<body class=" pace-done">
	
	<div id="wrapper">
	<%@include file="../components/static-nav-bar.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
		<%@include file="../components/search-nav-bar.jsp"%>
		
		<tag:breadcrumb label="Ver TP"/>
	
	 	<div class="wrapper wrapper-content animated fadeInRight pre-scrollable">
	         <div class="row">
	             <div class="col-lg-12">
	              <div class="ibox float-e-margins">
						<div class="GrupoInformation">
							<div class="page-header">
								<h3><b>Grupo ${tpgrupo.grupoNombre}</b></h3>
							</div>
							
							<div class="page-header">
								<h4>Detalles TP ${tpgrupo.descripcion}</h4>
							</div>
						</div>
	                  <div class="ibox-title">
	                      <h5>Entregas</h5>
	                  </div>
	                  <div class="ibox-content">
	                  	<table id="EntregaTP" class="table table-striped table-hover" >
	                  		<thead class="encabezado">
							<tr>
								<th>Id</th>
								<th>Descripcion</th>
								<th>Archivo</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${tpgrupo.tpEntrega}" var="tpentrega" varStatus="status">
								<tr>
									<td>${tpentrega.id}</td>
									<td>${tpentrega.descripcion}</td>
									<td>${tpentrega.archivoNombre}</td>
									<td> 
										<a href="/repouniversity/tpgrupo/verEntregasTP?tpEntregaId=${tpentrega.id}&bread=Ver entregas-5" name="Ver" data-tpentregaId="${tpentrega.id}" ><button class="btn btn-primary btn-circle" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Ver EntregaTP"><i class="fa fa-arrow-right"></i></button></a>
										<a href="/repouniversity/vistaPrevia?archivoId=${tpentrega.archivo}&bread=Vista Previa-5" name="verArchivo" data-tpentregaId="${tpentrega.id}" ><button class="btn btn-success btn-circle" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Ver Archivo"><i class="fa fa-search"></i></button></a>
										<a href="/repouniversity/bajarArchivo?archivoId=${tpentrega.archivo}" name="dowloadArchivo" data-tpentregaId="${tpentrega.id}" ><button class="btn btn-success btn-circle" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Bajar Archivo"><i class="fa fa-download"></i></button></a>
									</tr>
							</c:forEach>
						</tbody>
	                  	</table>
	                  </div>
	                 
	              </div>
	      		</div>
	         </div>
	         <div class="row">
	         	<div class="col-lg-9">
	         		<div class="ibox float-e-margins">
						<div class="ibox-content">
							<div>
								<div class="chat-activity-list" style="padding: 20px 0px;">

									<c:forEach items="${tpgrupo.comentario}" var="comentario" varStatus="status">
										<div class="chat-element">
											<div class="media-body">
												 <strong>${comentario.persona.apellido}, ${comentario.persona.nombre}</strong>
												<p class="m-b-xs">${comentario.descripcion}</p>
												<small class="text-muted">${comentario.fechasys}</small>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="chat-form">
								<div class="form-group">
									<textarea name = "mensaje" class="form-control" placeholder="Comentario.."></textarea>
								</div>
								<div class="text-right">
									<button id="enviarComentario" class="btn btn-sm btn-primary m-t-n-xs"">
										<strong>Comentar</strong>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
	         </div>
	         
	     </div>
        
		<%@include file="../components/footer.jsp"%>
	</div>
<!-- 	Ventanas -->
	<div id="agregarEntregaTpDialog" title="Nueva Entrega TP">
		<form id="nuevoEntregaTpForm" class="form-horizontal">
			<input name="tpGrupoId" type="hidden" class="form-control" value="${param.tpGrupoId}">
			<div class="form-group">
				<label class="col-sm-2 control-label">Descripcion*:</label>
                <div class="col-sm-10"><input name="descripcion" type="text" class="form-control" required="required"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Archivo*:</label>
                <div class="col-sm-10"><input name="archivoId" type="text" class="form-control" required="required"></div>
            </div>
          	<div>
                <small>(*) Datos obligatorios</small>
            </div> 
		</form>
	</div>
	
	<div id="editarEntregaTpDialog" title="Editar Entrega TP">
		<form id="editarEntregaTpForm" class="form-horizontal">
			<input name="tpGrupoId" type="hidden" class="form-control" value="${param.tpGrupoId}">
			<input name="tpEntregaId" type="hidden" class="form-control" value="">
			<div class="form-group">
				<label class="col-sm-2 control-label">Descripcion*:</label>
                <div class="col-sm-10"><input name="descripcion" type="text" class="form-control" required="required"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Archivo*:</label>
                <div class="col-sm-10"><input name="archivoId" type="text" class="form-control" required="required"></div>
            </div>
            <div>
                <small>(*) Datos obligatorios</small>
             </div>
        </form>
	</div>
	
	<div id="deleteTpDialog" title="Eliminar EntregaTP">
		<p>¿Esta seguro que desea eliminar la entrega?</p>
	</div>
	
	<div id="agregarComentarioDialog" title="Nuevo comentario">
		<form id="nuevoComentarioForm" class="form-horizontal">
			<input name="tpGrupoId" type="hidden" class="form-control" value="${param.tpGrupoId}">
			<div class="form-group">
				<label class="col-sm-2 control-label">Comentario*:</label>
                <div class="col-sm-10"><input name="comentario" type="text" class="form-control" required="required"></div>
            </div>
            <div>
                <small>(*) Datos obligatorios</small>
             </div>    
		</form>
	</div>

	<div id="deleteComentarioDialog" title="Eliminar Comentario">
		<p>¿Esta seguro que desea eliminar el comentario?</p>
	</div>

		<input name="tpGrupoIdGlobal" type="hidden" value="${param.tpGrupoId}" />
	</div>
	
</body>
</html>