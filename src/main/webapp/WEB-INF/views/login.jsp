<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8" />


    <title>Repouniversity | Login</title>

   

<%-- <%@include file="../components/common-statics-imports.jsp" %> --%>

<script src="/repouniversity/resources/js/jquery-1.10.2.js"></script>
<script type="text/javascript"
	src="/repouniversity/resources/js/bootstrap.min.js" ></script>
<link rel="stylesheet" type="text/css"
	href="/repouniversity/resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" 
	href="/repouniversity/resources/font-awesome/css/font-awesome.css" />
<link rel="stylesheet" type="text/css" 
	href="/repouniversity/resources/css/animate.css" />
<link rel="stylesheet" type="text/css" 
	href="/repouniversity/resources/css/style.css" />

</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">Ru</h1>

            </div>
            <h3>Bienvenidos a RepoUniversity</h3>
            <p>Repositorio de documentos para la comunidad academica
                <!--Continually expanded and constantly improved Inspinia Admin Them (IN+)-->
            </p>
            <p>Ingrese su Usuario y Contraseña</p>
               
            <form class="m-t" role="form" action="login" method="post" id="login">
            
                <div class="form-group">
                    <input name="user" type="text" class="form-control" placeholder="Usuario"
				required autofocus />
                </div>
                <div class="form-group">
                   <input name="password" type="password" class="form-control" placeholder="Contraseña" required />
                </div>
                
                <button type="submit" class="btn btn-lg btn-primary btn-block" id="entrar">Entrar</button>
				<br/><br/>
				<a href="loginAnonimo">Ingreso sin Usuario</a><br/>
                <a href="#"><small>¿Te olvidaste el password?</small></a>
                <p class="text-muted text-center"><small>¿Sos nuevo en RepoUniversity?</small></p>
                <a class="btn btn-sm btn-white btn-block" href="register.html">Crear Cuenta</a>
            </form>
            <c:if test="${not empty loginexception}">
			<label  class="m-t" style="color: red"> <small>Usuario o password son incorrectos</small></label>
		    </c:if>
            <p class="m-t"> <small>Reposuinversity trabajo practico final CAECE &copy; 2014</small> </p>
        </div>
    </div>

</body>

</html>
