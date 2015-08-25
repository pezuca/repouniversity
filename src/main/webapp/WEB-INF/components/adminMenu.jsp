<nav class="navbar-default navbar-static-side" role="navigation">
	<div class="sidebar-collapse">
		<ul class="nav" id="side-menu">
			<li class="nav-header">

				<div class="dropdown profile-element">
					<span> <a class="logo-name-menu">RepoUniversity</a>

					</span> <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
						class="clear"> <span class="block m-t-xs"> <strong
								class="font-bold">${userLog.nombreUsuario}</strong>
						</span> <span class="text-muted text-xs block">Administrador	 <b
								class="caret"></b></span>
					</span>
					</a>
					<ul class="dropdown-menu animated fadeInRight m-t-xs">
						<li><a href="/repouniversity/usuario/misdatos?bread=Mis datos-1">Mis Datos</a></li>
						<li class="divider"></li>
						<li><a href="/repouniversity/logout">Salir</a></li>
					</ul>
				</div>
				<div class="logo-element">RU</div>

			</li>
			<li class="${activeTab eq 'dashboard' ? 'active':''}"><a href="/repouniversity/dashboard?bread=Inicio-0"><i
					class="fa fa-home"></i> <span class="nav-label">Inicio |
						Administrador</span></a></li>
			<li class="${activeTab eq 'verMaterias' ? 'active':''}"><a id="materias" href="/repouniversity/admin/verMaterias?bread=Ver materias-1"><i
					class="fa fa-book"></i> <span class="nav-label">Materias</span></a></li>
			<li class="${activeTab eq 'verCursos' ? 'active':''}"><a id="cursos" href="/repouniversity/admin/verCursos?bread=Ver cursos-1"><i
					class="fa fa-laptop"></i> <span class="nav-label">Cursos</span></a></li>
			<li class="${activeTab eq 'verUsuarios' ? 'active':''}"><a id="usuarios" href="/repouniversity/admin/verUsuarios?bread=Ver usuario-1"><i
					class="fa fa-group"></i> <span class="nav-label">Usuarios</span></a></li>
			<li class="${activeTab eq 'verCarreras' ? 'active':''}"><a id="carreras" href="/repouniversity/admin/verCarreras?bread=Ver carreras-1"><i
					class="fa fa-bank"></i> <span class="nav-label">Carreras</span></a></li>
			<li class="${activeTab eq 'verArchivos' ? 'active':''}"><a id="archivos" href="/repouniversity/admin/verArchivos?bread=Ver archivos-1"><i
					class="fa fa-file-pdf-o"></i> <span class="nav-label">Archivos</span></a></li>
			<li class="${activeTab eq 'verErroresArchivos' ? 'active':''}"><a id="reporte" href="/repouniversity/admin/verReporteErrores?bread=Ver reportes de errores-1"><i
					class="fa fa-warning"></i> <span class="nav-label">Reportes errores</span></a></li>
			<li class="${activeTab eq 'verUsuarioParametro' ? 'active':''}">
                 <a id="miscursos"><i class="fa fa-cog"></i> <span class="nav-label">Configuracion</span> <span class="fa arrow"></span></a>
                 <ul class="nav nav-second-level">
                     <li><a href="/repouniversity/usuario/misParametros?bread=Ver Parametros-1">Parametros</a></li>
                                   
                 </ul>
             </li>
			<li class="${activeTab eq 'Busqueda' ? 'active':''}"><a id="avanzada" href="/repouniversity/busquedaAvanzada?bread=Busqueda avanzada-1"><i
					class="fa fa-search"></i> <span class="nav-label">Busqueda Avanzada </span></a></li>					
		</ul>
			</ul>
		<ul class="nav">
        <li style="border-top:solid 1px #504f40">
            <a data-pjax id='ayuda-link' href="/repouniversity/preguntasFrecuentes?bread=PreguntasFrecuentes-1"><i class="fa fa-question-circle"></i><span class="nav-label">Ayuda</span> </a>
        </li>      
        </ul>
        <a href="#" class="btn btn-block btn-primary" id="startTour">Start tour</a>
	</div>
</nav>
<script type="text/javascript">


 var tour = new Tour({
	 template: "<div class='popover tour'>" + 
		    "<div class='arrow'></div>" + 
		    "<h3 class='popover-title'></h3>" +
		    "<div class='popover-content'></div>" +
		    "<div class='popover-navigation'>" +
			    "<div class='btn-group'>" +
			        "<button class='btn btn-sm btn-primary' data-role='prev'>« Previo</button>" +
			        "<button class='btn btn-sm btn-primary' data-role='next'>Siguiente »</button>" +
				    "<button class='btn btn-sm btn-primary' data-role='end'>Fin</button>" +
			    "</div>" +
			"</div>",
     steps: [{
         element: ".logo-name-menu",
         title: "Inicio del Tutorial Repouniversity",
         content: "Este cuadro de dialogo lo acompañara en un recorrido por el menú y las secciones del sistema. Ej. En esta sección se encuentra el logo de repouniversity. ",
     }, {
         element: "#materias",
         title: "Materias",
         content: "En esta sección se administran las materias, se pueden borrar, modificar o crear nuevas materias."
     },  {
         element: "#cursos",
         title: "Cursos",
         content: "En esta sección se administran los cursos, se pueden borrar, modificar o crear nuevos. Para crear un nuevo curso se necesita que antes exista la materia y el docente para ser relacionados con el nuevo curso creado. "
     }, {
         element: "#usuarios",
         title: "Usuarios",
         content: "En esta sección se administran los usuarios, se pueden borrar, modificar o crear nuevos. Existen tres tipos de usuarios, los alumnos, los docentes y los administradores del sistema. Al seleccionar la opción alumno se desplegara un combo con las carreras donde se seleccionará la correspondiente al alumno."
     }, {
         element: "#carreras",
         title: "Carreras",
         content: "En esta sección se administran las carreras, se pueden borrar, modificar o crear nuevas. Para crear una nueva carrera se necesita que antes existan todas las materias que la componen. "
     }, {
         element: "#archivos",
         title: "Archivos",
         content: "En esta sección se administran los archivos subidos, se pueden borrar, modificar, hacer una vista previa y descargar."
     }, {
         element: "#reporte",
         title: "Reportes",
         content: "En esta sección se listan los errores reportados por los usuarios, si el error es reportado a un documento el mismo aparece con una lupa para acceder al archivo y ver su detalle."
     }, {
         element: "#avanzada",
         title: "Busqueda Avanzada",
         content: "En esta sección se encuentra las búsquedas de avanzadas de los archivos subidos por todos los usuarios, se pueden realizar búsquedas por diferentes categorías."
     }, {
    	 element: ".navbar-form-custom",
         title: "Busqueda Rapida",
         content: "Acceso rápido para buscar un documento en el sistema."   	 
     }, {
    	 element: "#contNoti",
         title: "Ver Notificaciones",
         content: "Botón para acceder a las notificaciones, el número que aparece arriba del icono indica la cantidad de notificaciones nuevas que posee el usuario.",   	 
         placement: "left"
     }, {
    	 element: ".error",
         title: "Reporte de error",
         content: "Botón para reportar un error en el sistema",
         placement: "left"
     }, {
    	 element: ".salir",
         title: "Salir",
         content: "Botón para cerrar la sesión del usuario",
         placement: "left"
     }, {
    	 element: "#ayuda-link",
         title: "Ayuda",
         content: "Toda la ayuda del sistema se encuentra en esta sección del menú."
     }]
 });

$("#startTour").click(function(){
 tour.restart();
})
 </script>