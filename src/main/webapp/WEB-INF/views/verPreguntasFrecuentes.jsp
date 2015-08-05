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
                                    <a data-toggle="collapse" href="#faq1" class="faq-question">�Como cierro sesi�n?</a>                                 
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
                                           Es muy importante que cierres tu sesi�n ya que ahora al ingresar tu usuario y clave toda la informaci�n relacionada con tu usuario estar� disponible para ser actualizada, modificada o borrada. En la parte superior izquierda se encuentra un icono para realizar la acci�n de cierre de sesi�n.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                         <div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq2" class="faq-question">�Como se da de alta un alumno?</a>                                 
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
                                    <a data-toggle="collapse" href="#faq2" class="faq-question">�Como se da de alta un docente?</a>                                 
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
                                    <a data-toggle="collapse" href="#faq2" class="faq-question">�C�mo se da de alta un documento al curso?</a>                                 
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
                                    <a data-toggle="collapse" href="#faq2" class="faq-question">�Como funciona el grupo de trabajo practico?</a>                                 
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
                                    <a data-toggle="collapse" href="#faq2" class="faq-question">�C�mo se entrega un trabajo pr�ctico?</a>                                 
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
                                    <a data-toggle="collapse" href="#faq2" class="faq-question">�Cu�les son los tipos de acceso al sistema?</a>                                 
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
                                    <a data-toggle="collapse" href="#faq2" class="faq-question">�Qu� es la autorizaci�n de acceso a un curso?</a>                                 
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
                                    <a data-toggle="collapse" href="#faq2" class="faq-question">�C�mo se autoriza un alumno a un curso?</a>                                 
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
                                    <a data-toggle="collapse" href="#faq2" class="faq-question">�C�mo se da de alta un curso?</a>                                 
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
                                    <a data-toggle="collapse" href="#faq2" class="faq-question">�Qu� son los documentos p�blicos y privados?</a>                                 
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
                                    <a data-toggle="collapse" href="#faq2" class="faq-question">�C�mo descargar un documento? </a>                                 
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
                                    <a data-toggle="collapse" href="#faq2" class="faq-question">�C�mo agrego un alumno a un grupo? </a>                                 
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
                                    <a data-toggle="collapse" href="#faq2" class="faq-question">�C�mo elimino un alumno de un grupo?</a>                                 
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
                                    <a data-toggle="collapse" href="#faq2" class="faq-question">�C�mo busco un documento en el sistema?</a>                                 
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
                                    <a data-toggle="collapse" href="#faq2" class="faq-question">�C�mo reporto un error en el sistema?</a>                                 
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
                                    <a data-toggle="collapse" href="#faq2" class="faq-question">�C�mo cambiar mi contrase�a?</a>                                 
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
                                    <a data-toggle="collapse" href="#faq2" class="faq-question">�Qu� son las notificaciones?</a>                                 
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
                                    <a data-toggle="collapse" href="#faq2" class="faq-question">�C�mo corregir un trabajo entregado por un alumno?</a>                                 
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
                                    <a data-toggle="collapse" href="#faq2" class="faq-question">�Donde veo los cursos disponibles?</a>                                 
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
                                    <a data-toggle="collapse" href="#faq2" class="faq-question">�D�nde veo mis cursos inscriptos?</a>                                 
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
                                    <a data-toggle="collapse" href="#faq2" class="faq-question">�C�mo me doy de alta a un curso?</a>                                 
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
                                    <div id="faq2" class="panel-collapse collapse faq-answer">
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
		            "search": "B�squeda"
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