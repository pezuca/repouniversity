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
<!-- 	<script src="/repouniversity/resources/js/application/subirArchivo.js"></script> -->
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
			                        <h5>Subir Archivos</h5>
			                    </div>
			                    <div class="ibox-content">
			                        <div class="ibox float-e-margins">
					                    <div class="ibox-content">
<!-- 					                        <form id="my-awesome-dropzone" class="dropzone dz-clickable" action="/repouniversity/subirArchivo" method="POST"> -->
<!-- 					                            <div class="dropzone-previews"> -->
<!-- 					                            	<button type="submit" class="btn btn-primary pull-right">Subir archivo</button> -->
<!-- 					                        		<div class="dz-default dz-message"><span>Haga Click o arrastre los archivos aqui</span> -->
<%-- 					                        		<input type="hidden" name="personaId" value="${personId}}"/> --%>
<%-- 													<input type="hidden" name="cursoId" value="${cursoId}}"/>  --%>
<%-- 													<input type="hidden" name="grupoId" value="${grupoId}}"/> --%>
<!-- 					                        		</div> -->
<!-- 					                        	</div> -->
<!-- 					                        	<div class="input_fields_wrap"> -->
<!-- 					                        		<div class="col-sm-10" style="padding-left: 0px;"> -->
<!-- 												     	<input type="text" name="descripcion" placeholder="Descripcion" class="form-control m-b"/> -->
<!-- 				                                    </div> -->
<!-- 												    <div><input type="text" name="mytext" placeholder="Etiqueta"> -->
<!--												    	<button class="add_field_button" >Add More Fields</button> -->
<!-- 												    	<button class="btn btn-info btn-circle" type="button"><i class="fa fa-check" ></i></button> -->
<!-- 												    </div> -->
<!-- 												</div> -->
												
<!-- 					                        </form> -->



											<div id="actions" class="row">
												<input type="hidden" name="personaId" value="${param.personaID}"/>
												<input type="hidden" name="cursoId" value="${param.cursoID}"/> 
												<input type="hidden" name="grupoId" value="${param.grupoID}"/>
									
												<div class="col-lg-7">
													<span class="btn btn-success fileinput-button dz-clickable">
														<i class="glyphicon glyphicon-plus"></i> <span>Add files...</span>
													</span>
													<button type="submit" class="btn btn-primary start">
														<i class="glyphicon glyphicon-upload"></i> <span>Start
															upload</span>
													</button>
													<button type="reset" class="btn btn-warning cancel">
														<i class="glyphicon glyphicon-ban-circle"></i> <span>Cancel
															upload</span>
													</button>
												</div>
									
												<div class="col-lg-5">
													<span class="fileupload-process">
														<div id="total-progress" class="progress progress-striped active"
															role="progressbar" aria-valuemin="0" aria-valuemax="100"
															aria-valuenow="0">
															<div class="progress-bar progress-bar-success" style="width: 0%;"
																data-dz-uploadprogress=""></div>
														</div>
													</span>
												</div>
									
												<div class="table table-striped" class="files" id="previews">
													<div id="template" class="file-row">
														<!-- This is used as the file preview template -->
														<div>
															<span class="preview"><img data-dz-thumbnail /></span>
														</div>
														<div>
															<p class="name" data-dz-name></p>
															<strong class="error text-danger" data-dz-errormessage></strong>
														</div>
														<div>
															<p class="size" data-dz-size></p>
															<div class="progress progress-striped active" role="progressbar"
																aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
																<div class="progress-bar progress-bar-success" style="width: 0%;"
																	data-dz-uploadprogress></div>
															</div>
														</div>
														<div>
															<button class="btn btn-primary start">
																<i class="glyphicon glyphicon-upload"></i> <span>Start</span>
															</button>
															<button data-dz-remove class="btn btn-warning cancel">
																<i class="glyphicon glyphicon-ban-circle"></i> <span>Cancel</span>
															</button>
														</div>
													</div>
												</div>
									
											</div>
					                    </div>
					                </div>
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