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
		<div class="row border">
			<div class="col-lg-12">
				<div class="ibox-content ibox-heading">
				   	<h3><i class="fa fa-envelope-o"></i> Buscador de archivos</h3>
				  	<small><i class="fa fa-tim"></i> Recuerde que solamente se podrás buscar archivos que sean publicos.</small>
					<div class="search-form">
						<form action="/repouniversity/buscarArchivoAnonimo" method="post" role="search">
							<div class="input-group">
								<input type="text" placeholder="Buscar archivos..." name="search" class="form-control input-lg" id="search">
									<div class="input-group-btn">
										<button class="btn btn-lg btn-primary" type="submit">
											Search
										</button>
									</div>
							</div>
						</form>
					</div>
					<a href="#" class="search-link">Busqueda Avanzada</a>
				</div>
			</div>
		</div>
	</div>
	
	<%@include file="../components/footer.jsp"%>
	
</body>
</html>