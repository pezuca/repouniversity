<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="activeTab" value="${'verArchivos'}" />
<c:set var="userLog" value="${sessionScope.login}" />

<html>
<head>
	<meta charset="utf-8" />
	<title>Repouniversity</title>
	<%@include file="../components/common-statics-imports.jsp"%>
</head>
<body class=" pace-done">
	
	<div id="wrapper">
	<%@include file="../components/static-nav-bar.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
		<%@include file="../components/search-nav-bar.jsp"%>
	
	 	<div class="wrapper wrapper-content animated fadeInRight">
	         <div class="row">
	      		<div class="col-lg-9">
	         		<div class="ibox">
						<div class="ibox-title">
	                        <h5>Vista Previa</h5>
	                    </div>
	                    <div class="ibox-content">
	                    	<figure>
								<c:choose>
									<c:when test="${archivo.idTipo == 1}">
										<iframe style="width: 100%;height: 500px;" src="/repouniversity/resources/js/ViewerJS/index.html#documents/previews/${archivo.path}" allowfullscreen webkitallowfullscreen></iframe>
									</c:when>
									<c:when test="${archivo.idTipo == 2}">
										<img style="width: 100%;height: 500px;" src="/repouniversity/resources/js/ViewerJS/documents/previews/${archivo.path}"></iframe>
									</c:when>
								</c:choose>
	                    	</figure>
	                    </div>
                    </div>
	      		</div>
					
	         	<div class="col-lg-3">
	         		<div class="row">
	         			<div class="col-lg-12">
		         			<div class="wrapper wrapper-content project-manager">
		                        <h2 style="color:#1ab394;"><strong>${archivo.nombre}</strong></h2>
		                        <ul class="list-unstyled m-t-md">
		                            <li>
		                                <label>Descripcion:</label>
		                                ${archivo.descripcion}
		                            </li>
		                            <li>
		                                <label>Tipo:</label>
		                                ${archivo.tipoArchivo}
		                            </li>
		                            <li>
		                                <label>Estado:</label>
		                                ${archivo.estadoArchivo}
		                            </li>
		                            <li>
		                                <label>Materia:</label>
		                                ${archivo.materia}
		                            </li>
		                            <li>
		                                <label>Curso:</label>
		                                ${archivo.curso} (${archivo.descripcionCurso})
		                            </li>
		                        </ul>
		                    </div>
	                    </div>
                    </div>
                    <div class="row">
						<div class="col-lg-12">
							<a href="/repouniversity/bajarArchivo?archivoId=${archivo.id}" target="_blank">
			                    <button class="btn btn-primary dim" type="button">
			                        <div class="row vertical-align">
			                            <div class="col-xs-3">
			                                <i class="fa fa-shield fa-3x"></i>
			                            </div>
			                            <div class="col-xs-9 text-right" style="padding-top:5px;">
			                                <h2 class="font-bold">Descargar</h2>
			                            </div>
			                        </div>
			                    </button>
		                    </a>
		                </div>
                    </div>
                </div>
	         </div>
	         <div class="row">
	         	<div class="col-lg-9">
	         		<div class="ibox float-e-margins">
						<div class="ibox-content">
							<div>
								<div class="chat-activity-list">

									<c:forEach items="${errorArchivo}" var="error" varStatus="status">
										<div class="chat-element">
											<div class="media-body ">
												 <strong>${error.persona.apellido}, ${error.persona.nombre}</strong>
												<p class="m-b-xs">${error.descripcion}</p>
												<small class="text-muted">${error.fechasys}</small>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="chat-form">
								<form id="comentarioForm" role="form">
									<div class="form-group">
										<textarea class="form-control" placeholder="Message"></textarea>
									</div>
									<div class="text-right">
										<button type="submit" class="btn btn-sm btn-primary m-t-n-xs">
											<strong>Enviar</strong>
										</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
	         </div>
	     </div>
        
		<%@include file="../components/footer.jsp"%>
	</div>
	
	<div id="deleteCursoDialog" title="Eliminar Curso">
		<p>¿Esta seguro que desea darse de baja en el curso?</p>
	</div>
	</div>
	
</body>
</html>