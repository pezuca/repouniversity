<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta charset="utf-8" />
	<title>Repouniversity</title>
	<%@include file="../components/common-statics-imports.jsp"%>
	
	<script src="/repouniversity/resources/js/plugins/dropzone/dropzone.js"></script>
	<link href="/repouniversity/resources/css/plugins/dropzone/basic.css" rel="stylesheet">
	<link href="/repouniversity/resources/css/plugins/dropzone/dropzone.css" rel="stylesheet">
	<script src="/repouniversity/resources/js/application/fileUpload.js"></script>
	<link rel="stylesheet" href="/repouniversity/resources/css/fileUpload.css">
</head>
<body class=" pace-done">
	<c:set var="userLog" value="${sessionScope.login}"/>
	
	<div id="wrapper">
		<%@include file="../components/static-nav-bar.jsp"%>
        	<div id="page-wrapper" class="gray-bg dashbard-1">
				<%@include file="../components/search-nav-bar.jsp"%>
		        <div class="wrapper wrapper-content animated fadeIn">
		            <div class="row">
		                <div class="col-lg-12">
			                <div class="ibox float-e-margins">
			                    <div class="ibox-title">
			                        <h5>Busqueda avanzada</h5>
			                    </div>
			                    <div class="ibox-content">
	                        		<form method="post" class="form-horizontal" action="/repouniversity/busquedaAvanzada" role="form">
										<div class="form-group"><label class="col-sm-2 control-label">Materia</label>
											<div class="col-sm-10"><input type="text" class="form-control" name="materia"></div>
		                                </div>
		                                <div class="form-group"><label class="col-sm-2 control-label">Docente</label>
			                                <div class="col-sm-10">
		                                        <div class="row">
		                                            <div class="col-md-4"><input type="text" placeholder="docente nombre" class="form-control" name="nbreDocente"></div>
		                                            <div class="col-md-4"><input type="text" placeholder="docente apellido" class="form-control" name="apeDocente"></div>
		                                        </div>
		                                    </div>
	                                    </div>
		                                <div class="form-group"><label class="col-sm-2 control-label">Carrera</label>
											<div class="col-sm-10"><input type="text" class="form-control" name="carrera"></div>
		                                </div>
		                                <div class="form-group"><label class="col-sm-2 control-label">Fecha publicacion</label>
		                                	<div class="col-sm-10">
		                                        <div class="row">		                                
													<div class="col-md-4"><input type="text" class="form-control" placeholder="dd/mm/aaaa (desde)" name="fechaDde"></div>
													<div class="col-md-4"><input type="text" class="form-control" placeholder="dd/mm/aaaa (hasta)" name="fechaHta"></div>
												</div>
											</div>		
		                                </div>
		                                <div class="form-group">
		                                    <div class="col-sm-4 col-sm-offset-2">
		                                        <button class="btn btn-primary" type="submit">buscar</button>
		                                    </div>
		                                </div>
		                            </form>
								</div>
			                </div>    
		            	</div>
					</div>
		    	</div>
		    </div>	
	    </div>	
   
	<%@include file="../components/footer.jsp"%>
</body>
</html>