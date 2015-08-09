<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta charset="utf-8" />
	<title>Repouniversity</title>
	<%@include file="../components/common-statics-imports.jsp"%>
	
</head>
<body class=" pace-done">
	<c:set var="userLog" value="${sessionScope.login}"/>
	
	<div id="wrapper">
		<%@include file="../components/static-nav-bar.jsp"%>
        	<div id="page-wrapper" class="gray-bg dashbard-1">
				<%@include file="../components/search-nav-bar.jsp"%>
				
				<tag:breadcrumb label="Busqueda avanzada"/>
				
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
		                                <!-- div class="form-group"><label class="col-sm-2 control-label">Carrera</label>
											<div class="col-sm-10"><input type="text" class="form-control" name="carrera"></div>
		                                </div-->
		                                <div class="form-group"><label class="col-sm-2 control-label">Descripci&oacute;n</label>
											<div class="col-sm-10"><input type="text" class="form-control" name="descripcion"></div>
		                                </div>
		                                <div class="form-group" id="data_5"><label class="col-sm-2 control-label"><b>Fecha publicaci&oacute;n</b></label>
		                                	<div class="col-sm-10">
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
	    </div>	
   
	<%@include file="../components/footer.jsp"%>

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
        });
    </script>
</body>
</html>