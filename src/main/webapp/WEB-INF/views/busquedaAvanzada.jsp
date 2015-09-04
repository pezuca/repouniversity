<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta charset="utf-8" />
	<title>Repouniversity</title>
	<%@include file="../components/common-statics-imports.jsp"%>
	
	<script src="/repouniversity/resources/js/plugins/chosen/chosen.jquery.js"></script>
	<link rel="stylesheet" type="text/css" href="/repouniversity/resources/css/plugins/chosen/chosen.css" />
</head>
<body class=" pace-done">
	<c:set var="userLog" value="${sessionScope.login}"/>
	
	<div id="wrapper">
		<%@include file="../components/static-nav-bar.jsp"%>
        	<div id="page-wrapper" class="gray-bg dashbard-1">
				<%@include file="../components/search-nav-bar.jsp"%>
				
				<tag:breadcrumb label="Busqueda avanzada"/>
				
		        <div class="wrapper wrapper-content animated fadeIn pre-scrollable">
		            <div class="row">
		                <div class="col-lg-12">
			                <div class="ibox float-e-margins">
			                    <div class="ibox-title">
			                        <h5>Busqueda avanzada</h5>
			                    </div>
			                    <div class="ibox-content">
	                        		<form method="post" class="form-horizontal" action="/repouniversity/busquedaAvanzada" role="form">
										<div class="form-group"><label class="col-sm-2 control-label">Materia</label>
											 <div class="col-sm-6">
		                                        <div class="row">
												   <select data-placeholder="Elija una materia" name="materia" class="chosen-select" tabindex="-1">
														<option value="" selected>Elija una materia</option>
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
														<option value="" selected>Elija un docente</option>
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
											<div class="col-sm-6">
												<div class="row">
													<input type="text" maxlength="80" class="form-control" name="descripcion"></div>
												</div>
		                                </div>
		                                <div class="form-group" id="data_5">
		                                	<label class="col-sm-2 control-label"><b>Fecha publicaci&oacute;n</b></label>
		                                	<div class="col-sm-6">
		                                		<div class="row">
			                                		<div class="input-daterange input-group" id="datepicker">
					                                    <input type="text" class="form-control input-sm" name="fechaDde" placeholder="Fecha desde" readonly = "readonly"/>
					                                    <span class="input-group-addon">-</span>
					                                    <input type="text" class="form-control input-sm" name="fechaHta" placeholder="Fecha hasta" readonly = "readonly"/>
					                                </div>
				                                </div>
		                                	</div>
		                                </div>
		                                <div class="form-group">
		                                    <div class="col-sm-4 col-sm-offset-2">
		                                    	<div class="row">
		                                        	<button class="btn btn-primary" type="submit">buscar</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </form>
								</div>
			                </div>    
		            	</div>
					</div>
		    	</div>
<%-- 				<%@include file="../components/footer.jsp"%> --%>
		    </div>	
	    </div>	
   

    <script>
        $(document).ready(function(){
            $("#datepicker input[name=fechaDde]").datepicker({
                fateFormat: "dd/mm/yyyy",
                onClose: function( selectedDate ) {
                  $("#datepicker input[name=fechaHta]").datepicker("option", "minDate", selectedDate);
                }
              });
              $("#datepicker input[name=fechaHta]").datepicker({
                fateFormat: "dd/mm/yyyy",
                onClose: function( selectedDate ) {
                  $("#datepicker input[name=fechaDde]").datepicker("option", "maxDate", selectedDate);
                }
              });
              
              $("#datepicker input[name=fechaDde]").datepicker("option", "maxDate", "12/12/2100");
              $("#datepicker input[name=fechaDde]").datepicker("option", "minDate", "01/01/2000");
             
              $("select[name=docente], select[name=materia]").chosen({no_results_text:'No hay resultados para: '});
        });
    </script>
</body>
</html>