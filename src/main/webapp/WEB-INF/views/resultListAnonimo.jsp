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
								<input type="text" placeholder="Buscar archivos..." name="search" class="form-control input-lg">
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
	
		<tag:breadcrumb label="Lista de resultados"/>
		
	           	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="ibox float-e-margins">
	                        <div class="ibox-content">
	                        	<c:choose>
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
		                                    ${result.descripcion}<br><br><button class="btn btn-primary btn-xs" type="button">vista previa</button>
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
	
</body>
</html>