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

</head>
<body id="loginAnonimo">

	<%@include file="../components/static-nav-bar.jsp"%>

	<div id="page-wrapper" class="gray-bg dashbard-1">
		<div class="row border-bottom">
			<div class="col-lg-8 col-md-offset-2">
			    <div class="ibox float-e-margins">
			        <div class="ibox-content ibox-heading">
			        	<h3><i class="fa fa-envelope-o"></i> Buscador de archivos</h3>
			        	<small><i class="fa fa-tim"></i> Recuerde que solamente se podrás buscar archivos que sean publicos.</small>
						<form role="search" class="" method="post" action="search_results.html">
						    <div class="form-group">
						        <input type="text" placeholder="Buscar archivos..." class="form-control" name="top-search" id="top-search">
						    </div>
						</form>
			        </div>
			    </div>
			</div>
		</div>
	</div>
	
	<%@include file="../components/footer.jsp"%>
	
</body>
</html>