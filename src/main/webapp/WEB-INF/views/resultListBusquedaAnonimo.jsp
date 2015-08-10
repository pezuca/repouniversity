<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8" />
<title>Repouniversity</title>
<%@include file="../components/common-statics-imports.jsp"%>
<link href="/repouniversity/resources/css/loginAnonimo.css" rel="stylesheet">
<script src="/repouniversity/resources/js/plugins/chosen/chosen.jquery.js"></script>

<link rel="stylesheet" type="text/css" href="/repouniversity/resources/css/plugins/chosen/chosen.css" />
</head>
<body id="loginAnonimo">

	<%@include file="../components/static-nav-bar.jsp"%>

	
	<div id="page-wrapper" class="gray-bg dashbard-1">
	<tag:breadcrumb label="Busqueda avanzada"/>
				
		        <div class="wrapper wrapper-content animated fadeIn">
		            <div class="row">
		                <div class="col-lg-12">
							<div class="ibox float-e-margins">
								<div class="ibox-title">
									<h5>Busqueda avanzada</h5>
										<div class="ibox-tools">
											<a class="collapse-link">
												<i class="fa fa-chevron-up"></i>
											</a>
										</div>
								</div>
										
								<div class="ibox-content profile-content" style="display: none;">
			                   
									<div class="ibox-content" style="display: none;">
										<form method="post" class="form-horizontal" action="/repouniversity/busquedaAvanzadaAnonimo" role="form">
											<div class="form-group"><label class="col-sm-2 control-label">Materia</label>
												 <div class="col-sm-6">
													<div class="row">
													   <select data-placeholder="Elija una materia" name="materia" class="chosen-select" tabindex="-1">
															<option value="" disabled selected>Elija una materia</option>
															<c:forEach items="${materias}" var="materia" varStatus="status">
																<option value="${materia.id}">${materia.nombre}</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
											<div class="form-group"><label class="col-sm-2 control-label">Docente</label>
												 <div class="col-sm-6">
													<div class="row">
													   <select data-placeholder="Elija un docente" name="docente" class="chosen-select" tabindex="-1">
															<option value="" disabled selected>Elija un docente</option>
															<c:forEach items="${docentes}" var="docente" varStatus="status">
																<option value="${docente.id}">${docente.persona.nombre}, ${docente.persona.apellido}</option>
															</c:forEach>
														</select>
													</div>
												</div>
											  </div>
											<!-- div class="form-group"><label class="col-sm-2 control-label">Carrera</label>
												<div class="col-sm-10"><input type="text" class="form-control" name="carrera"></div>
											</div-->
											<div class="form-group"><label class="col-sm-2 control-label">Palabra clave</label>
												<div class="col-sm-6"><input type="text" maxlength="80" class="form-control" name="descripcion"></div>
											</div>
											<div class="form-group" id="data_5"><label class="col-sm-2 control-label"><b>Fecha publicaci&oacute;n</b></label>
												<div class="col-sm-6">
													<div class="input-daterange input-group" id="datepicker">
														<input type="text" class="form-control input-sm" name="fechaDde" placeholder="Fecha desde"/>
														<span class="input-group-addon">-</span>
														<input type="text" class="form-control input-sm" name="fechaHta" placeholder="Fecha hasta"/>
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
				<div class="row">
	                <div class="col-lg-12">
	                    <div class="ibox float-e-margins">
	                        <div class="ibox-content">
	                        	<c:choose>
								    <c:when test="${listaResultados.size() == 1 and not parametroBusqueda.isEmpty()}">
								        <h2>
			                                Se encontro ${listaResultados.size()} resultado con: <span class="text-navy">${parametroBusqueda}</span>
			                            </h2>
								    </c:when>
								    <c:when test="${listaResultados.size() == 1 and parametroBusqueda.isEmpty()}">
								        <h2>
			                                Se encontro ${listaResultados.size()} resultado con: <span class="text-navy">${parametroBusqueda}</span>
			                            </h2>
								    </c:when>    
								    <c:when test="${listaResultados.size() > 0 and not parametroBusqueda.isEmpty()}">
								        <h2>
			                                Se encontraron ${listaResultados.size()} resultados con: <span class="text-navy">${parametroBusqueda}</span>
			                            </h2>
								    </c:when>
								    <c:when test="${listaResultados.size()>0 and parametroBusqueda.isEmpty()}">
								        <h2>
			                                Se encontraron ${listaResultados.size()} resultados con: <span class="text-navy">${parametroBusqueda}</span>
			                            </h2>
								    </c:when> 
								    <c:otherwise>
								        <h2>
			                                No se encontraron resultados  para su busqueda <span class="text-navy">${parametroBusqueda}</span>
			                            </h2>
								    </c:otherwise>
								</c:choose>
	                        	<c:forEach items="${listaResultados}" var="result" varStatus="status">
									<div class="search-result">
		                                <h3><a href="#">${result.nombre}</a></h3>
		                                <h5><a href="#">fecha publicacion: ${result.fechaPublicacion}</a></h5>
		                                <p>
		                                    ${result.descripcion}<br><br>
		                                    <a  name="verArchivo" data-archivoId="${result.id}" href="/repouniversity/vistaPreviaAnonimo?archivoId=${result.id}">
												<button class="btn btn-primary btn-xs" type="button">vista previa</button>
											</a>
		                                </p>
		                            </div>
		                            <div class="hr-line-dashed"></div>
								</c:forEach>
	                        </div>
	                    </div>
	            	</div>
	        	</div>
	       
	</div>
	<%@include file="../components/footer.jsp"%>
	    
	  <script>
        $(document).ready(function(){
            $("#datepicker input[name=fechaDde]").datepicker({
                fateFormat: "dd/mm/yy",
                onClose: function( selectedDate ) {
                  $("#datepicker input[name=fechaHta]").datepicker("option", "minDate", selectedDate);
                }
              });
              $("#datepicker input[name=fechaHta]").datepicker({
                fateFormat: "dd/mm/yy",
                onClose: function( selectedDate ) {
                  $("#datepicker input[name=fechaDde]").datepicker("option", "maxDate", selectedDate);
                }
              });
        });
        
        $("select[name=materia]").chosen({no_results_text:'No hay resultados para: '});
        $("select[name=docente]").chosen({no_results_text:'No hay resultados para: '});
    </script>
</body>
</html>