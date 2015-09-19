<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="activeTab" value="${'importarMaterias'}" />
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
		
		<tag:breadcrumb label="Importar Materias"/>
	
	 	<div class="wrapper wrapper-content animated fadeInRight ">
	         <div class="row">
	             <div class="col-lg-12">
	              <div class="ibox float-e-margins">				
	                  <div class="ibox-content">
	                  	<div class="row">
	                  		<div class="col-lg-12 well m-t">
	                  			<p>Para importar materias desde un archivo excel <b>DEBE</b> utilizar el template proviste por la apliacación. Lo puede bajar haciendo click en el boton Download.</p>
	                  			<p>Luego de completar el template lo puede subir haciendo click en el boton Upload, espere unos segundos y aparecerá un mensajes indicando que no hubo fallos. Con esto concluirá el proceso de importación de materias.</p>
	                  		</div>
	                  	</div>
	                  	<div class="row">
	                  		<div class="col-lg-6">
					            <div class="form-group">
						            <label class="col-sm-3 control-label">Descargue el template</label>
									<div class="col-sm-3">
										<button id="downloadTemplate" class="btn btn-w-m btn-success">Download</button>
									</div>
								</div>
							</div>	
							
	                  		<div class="col-lg-6">
								<form id="uploadTemplateMaterias" class="form-horizontal">
						            <div class="form-group">
						                <label class="col-sm-4 control-label">Elija un archivo:</label>
						                <input name="file" type="file" required="required" accept=".xls,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" />	
						            </div> 
						            <div class="form-group">
										<div class="col-sm-offset-1 col-sm-12">
											<button type="submit" class="btn btn-w-m btn-primary">Upload</button>
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
        
        <div id="hiddenInputs" class="hidden">
			<input type="hidden" name="miPermiso" value="${login.permiso}"/>
		</div>
<%-- 		<%@include file="../components/footer.jsp"%> --%>
		
		<div id="errorDailog">
			<p class="message"></p>
		</div>
	</div>
	
	<script>
	$(document).ready(function() {
		$("#uploadTemplateMaterias").submit(function(event){
			event.preventDefault();
			var file = $(this).find("input[name=file]");
			var dataFiles = new FormData($("#uploadTemplateMaterias")[0]);
			
			if(file == null) {
				alert("Debe elegir un archivo");
	
				return false;
			}
			
			$.ajax({
				url: "/repouniversity/import/uploadMaterias",
				type: "POST",
				data: dataFiles,
				processData: false,
				contentType: false,
				success: function(data) {
					$("#errorDailog").data("message", "El pedido se ha procesado correctamente.").dialog("open");
					
				},
				error: function(data) {
					$("#errorDailog").data("message", data.responseText).dialog("open");
				}
			});
			
			return false;
		});
		
		$("#errorDailog").dialog({
			resizable: false,
			width:450,
			modal: true,
			autoOpen: false,
			hide: {effect: "fade", duration: 300},
			show: {effect: "fade", duration: 300},
			buttons: {
				"Aceptar": function() {
					$(this).dialog("close");
				}
			},
			open: function(event, ui) {
				$("#errorDailog .message").append($("#errorDailog").data('message'));
			},
			close: function(event, ui) {
				$("#errorDailog .message").empty();
				$("#uploadTemplateMaterias").trigger("reset");
			}
		});
		
		$("#downloadTemplate").click(function(){
			window.location.href = "/repouniversity/import/downloadMateriasTemplate"
		});
	});
	</script>
</body>
</html>