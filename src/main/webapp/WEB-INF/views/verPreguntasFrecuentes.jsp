<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="activeTab" value="${'dashboard'}" />
<c:set var="userLog" value="${sessionScope.login}"/>

<html>
<head>
<meta charset="utf-8" />
<title>Repouniversity</title>
<%@include file="../components/common-statics-imports.jsp"%>

<script type="text/javascript" src="resources/js/application/dashboard.js"></script>
</head>
<body class=" pace-done">
	<div id="wrapper">
		<%@include file="../components/static-nav-bar.jsp"%>
		
		<div id="page-wrapper" class="gray-bg dashbard-1">
		
		<%@include file="../components/search-nav-bar.jsp"%>

		<tag:breadcrumb label="Preguntas Frecuentes"/>
		
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
	            
                <div class="col-lg-12">
                    <div class="wrapper wrapper-content animated fadeInUp">

<!----------------------------- Inicio de Preguntas  ----------------------------------------->                 
                        <div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq1" class="faq-question">¿Como cierro sesión?</a>                                 
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Tipo</span>
                                    <div class="tag-list">
                                        <span class="tag-item">General</span>
                                        <span class="tag-item">Seguridad</span>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq1" class="panel-collapse collapse faq-answer">
                                        <p>
                                           Es muy importante que cierres tu sesión ya que ahora al ingresar tu usuario y clave toda la información relacionada con tu usuario estará disponible para ser actualizada, modificada o borrada. En la parte superior izquierda se encuentra un icono para realizar la acción de cierre de sesión.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                         <div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq2" class="faq-question">¿Como se da de alta un alumno?</a>                                 
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Tipo</span>
                                    <div class="tag-list">
                                        <span class="tag-item">Docente</span>
                                        <span class="tag-item">Altas</span>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq2" class="panel-collapse collapse faq-answer">
                                        <p>
                                           Completar....
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq3" class="faq-question">¿Como se da de alta un docente?</a>                                 
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Tipo</span>
                                    <div class="tag-list">
                                        <span class="tag-item">Administrador</span>
                                        <span class="tag-item">Alta</span>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq3" class="panel-collapse collapse faq-answer">
                                        <p>
                                           Completar....
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
						<div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq4" class="faq-question">¿Cómo se da de alta un documento al curso?</a>                                 
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Tipo</span>
                                    <div class="tag-list">
                                        <span class="tag-item">General</span>
                                        <span class="tag-item">Alta</span>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq4" class="panel-collapse collapse faq-answer">
                                        <p>
                                           Completar....
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
						
							<div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq5" class="faq-question">¿Como funciona el grupo de trabajo practico?</a>                                 
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Tipo</span>
                                    <div class="tag-list">
                                        <span class="tag-item">Alumno</span>
										<span class="tag-item">Docente</span>
                                        <span class="tag-item">Utilidades</span>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq5" class="panel-collapse collapse faq-answer">
                                        <p>
                                           Completar....
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
						
						<div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq6" class="faq-question">¿Cómo se entrega un trabajo práctico?</a>                                 
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Tipo</span>
                                    <div class="tag-list">
                                        <span class="tag-item">Alumno</span>
                                        <span class="tag-item">Utilidades</span>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq6" class="panel-collapse collapse faq-answer">
                                        <p>
                                           Completar....
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
						
						<div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq7" class="faq-question">¿Cuáles son los tipos de acceso al sistema?</a>                                 
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Tipo</span>
                                    <div class="tag-list">
                                        <span class="tag-item">General</span>
                                        <span class="tag-item">Seguridad</span>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq7" class="panel-collapse collapse faq-answer">
                                        <p>
                                           Existen cuatro tipos de acceso al sistema, como alumno, docente, administrador o de manera anónima. 
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
						
						
						<div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq101" class="faq-question">¿Qué es el acceso en modo anónimo?</a>                                 
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Tipo</span>
                                    <div class="tag-list">
                                        <span class="tag-item">General</span>
                                        <span class="tag-item">Seguridad</span>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq101" class="panel-collapse collapse faq-answer">
                                        <p>
                                           El cuando un usuario ingresa sin usuario ni contraseña para ver el contenido subido por un docente en forma publica.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
						
						
						<div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq8" class="faq-question">¿Qué es la autorización de acceso a un curso?</a>                                 
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Tipo</span>
                                    <div class="tag-list">
                                        <span class="tag-item">Alumno</span>
										<span class="tag-item">Docente</span>
                                        <span class="tag-item">Seguridad</span>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq8" class="panel-collapse collapse faq-answer">
                                        <p>
                                           Para poder acceder a un curso, primero hay que pedir la autorización de acceso, luego el docente recibe una notificación para aceptar o rechazar el pedido.  
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
						
						<div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq9" class="faq-question">¿Cómo se autoriza un alumno a un curso?</a>                                 
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Tipo</span>
                                    <div class="tag-list">
                                        <span class="tag-item">Docente</span>
                                        <span class="tag-item">Seguridad</span>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq9" class="panel-collapse collapse faq-answer">
                                        <p>
                                           El docente recibe en un listado las notificaciones de pedido de los alumnos que desea tener acceso a un curso creado por el mismo, haciendo clic en el botón ubicado a la derecha del listado autoriza al alumno a ingresar al curso.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
						
						<div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq10" class="faq-question">¿Cómo se da de alta un curso?</a>                                 
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Tipo</span>
                                    <div class="tag-list">
                                        <span class="tag-item">Docente</span>
                                        <span class="tag-item">Alta</span>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq10" class="panel-collapse collapse faq-answer">
                                        <p>
                                           Completar....
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
						
						<div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq11" class="faq-question">¿Qué son los documentos públicos y privados?</a>                                 
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Tipo</span>
                                    <div class="tag-list">
                                        <span class="tag-item">General</span>
                                        <span class="tag-item">Seguridad</span>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq11" class="panel-collapse collapse faq-answer">
                                        <p>
                                           Los documentos privados solo pueden verse por los usuarios que están registrados en el curso donde se dio de alta el documento.
Los documentos públicos pueden verse por todos los usuarios del sistema y por los usuarios que ingresan de forma anónima.

                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
						
						<div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq13" class="faq-question">¿Cómo descargar un documento? </a>                                 
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Tipo</span>
                                    <div class="tag-list">
                                        <span class="tag-item">Alumno</span>
										<span class="tag-item">Docente</span>
                                        <span class="tag-item">Utilidades</span>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq13" class="panel-collapse collapse faq-answer">
                                        <p>
                                           Completar....
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
						
								<div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq14" class="faq-question">¿Cómo agrego un alumno a un grupo? </a>                                 
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Tipo</span>
                                    <div class="tag-list">
                                        <span class="tag-item">Docente</span>
                                        <span class="tag-item">Utilidades</span>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq14" class="panel-collapse collapse faq-answer">
                                        <p>
                                           Completar....
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
						
							<div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq15" class="faq-question">¿Cómo elimino un alumno de un grupo?</a>                                 
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Tipo</span>
                                    <div class="tag-list">
                                        <span class="tag-item">General</span>
                                        <span class="tag-item">Seguridad</span>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-15">
                                    <div id="faq15" class="panel-collapse collapse faq-answer">
                                        <p>
                                           Completar....
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
						
						<div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq16" class="faq-question">¿Cómo busco un documento en el sistema?</a>                                 
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Tipo</span>
                                    <div class="tag-list">
                                        <span class="tag-item">General</span>
                                        <span class="tag-item">Seguridad</span>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq16" class="panel-collapse collapse faq-answer">
                                        <p>
                                           Completar....
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
						
						<div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq17" class="faq-question">¿Cómo reporto un error en el sistema?</a>                                 
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Tipo</span>
                                    <div class="tag-list">
                                        <span class="tag-item">General</span>
                                        <span class="tag-item">Seguridad</span>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq17" class="panel-collapse collapse faq-answer">
                                        <p>
                                           Completar....
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
						
						<div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq18" class="faq-question">¿Cómo cambiar mi contraseña?</a>                                 
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Tipo</span>
                                    <div class="tag-list">
                                        <span class="tag-item">General</span>
                                        <span class="tag-item">Seguridad</span>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq18" class="panel-collapse collapse faq-answer">
                                        <p>
                                           Completar....
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
						
						<div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq19" class="faq-question">¿Qué son las notificaciones?</a>                                 
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Tipo</span>
                                    <div class="tag-list">
                                        <span class="tag-item">General</span>
                                        <span class="tag-item">Seguridad</span>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq19" class="panel-collapse collapse faq-answer">
                                        <p>
                                           Completar....
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
						
						<div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq20" class="faq-question">¿Cómo corregir un trabajo entregado por un alumno?</a>                                 
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Tipo</span>
                                    <div class="tag-list">
                                        <span class="tag-item">General</span>
                                        <span class="tag-item">Seguridad</span>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq20" class="panel-collapse collapse faq-answer">
                                        <p>
                                           Completar....
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
						
						<div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq21" class="faq-question">¿Donde veo los cursos disponibles?</a>                                 
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Tipo</span>
                                    <div class="tag-list">
                                        <span class="tag-item">General</span>
                                        <span class="tag-item">Seguridad</span>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq21" class="panel-collapse collapse faq-answer">
                                        <p>
                                           Completar....
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
						
						<div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq22" class="faq-question">¿Dónde veo mis cursos inscriptos?</a>                                 
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Tipo</span>
                                    <div class="tag-list">
                                        <span class="tag-item">General</span>
                                        <span class="tag-item">Seguridad</span>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq22" class="panel-collapse collapse faq-answer">
                                        <p>
                                           Completar....
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
						
						<div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq23" class="faq-question">¿Cómo me doy de alta a un curso?</a>                                 
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Tipo</span>
                                    <div class="tag-list">
                                        <span class="tag-item">General</span>
                                        <span class="tag-item">Seguridad</span>
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq23" class="panel-collapse collapse faq-answer">
                                        <p>
                                           Completar....
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
						
<!------------------------------- Fin de Preguntas--------------------------------->        
                    </div>
                </div>
            </div>
		    
		</div>
		
		<%@include file="../components/footer.jsp"%>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$('#clientTable').dataTable({
				"processing" : false,
				"serverSide" : false,
				"paging": false,
				"language": {
		            "search": "Búsqueda"
		        }
			});
	
			$("#clientTable_length").remove();
			
		});
		function borrarNotificacion(notificacionId) {
			$.ajax({
				  type: "POST",
				  url: "/repouniversity/notificacion/borrarNotificacion",
				  data: {"notificacionId" : notificacionId},
				  success: function(){ 
					  alert("Good!")
				  }
			});
		}
		
	</script>	
</body>
</html>