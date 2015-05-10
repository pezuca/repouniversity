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
	
	<script src="/repouniversity/resources/js/application/subirArchivo.js"></script>
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
			                        <div class="ibox-tools">
			                            <a class="collapse-link">
			                                <i class="fa fa-chevron-up"></i>
			                            </a>
			                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
			                                <i class="fa fa-wrench"></i>
			                            </a>
			                            <ul class="dropdown-menu dropdown-user">
			                                <li><a href="#">Config option 1</a>
			                                </li>
			                                <li><a href="#">Config option 2</a>
			                                </li>
			                            </ul>
			                            <a class="close-link">
			                                <i class="fa fa-times"></i>
			                            </a>
			                        </div>
			                    </div>
			                    <div class="ibox-content">
			                        <div class="ibox float-e-margins">
					                    <div class="ibox-content">
					                        <form id="my-awesome-dropzone" class="dropzone dz-clickable" action="/repouniversity/subirArchivo" method="POST">
					                            <div class="dropzone-previews"></div>
					                            <button type="submit" class="btn btn-primary pull-right">Submit this form!</button>
					                        	<div class="dz-default dz-message"><span>Drop files here to upload</span></div>
					                        	<div class="input_fields_wrap">
												    <div><input type="text" name="mytext">
<!-- 												    	<button class="add_field_button" >Add More Fields</button> -->
												    	<button class="btn btn-info btn-circle" type="button"><i class="fa fa-check" ></i></button>
												    </div>
												     <div class="col-sm-10">
												     	<input type="text" name="descripcion" placeholder="Descripcion" class="form-control m-b"/>
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
		    </div>	
	    </div>	
   
	<%@include file="../components/footer.jsp"%>
</body>
</html>