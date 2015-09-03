<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav" id="side-menu">
            <li class="nav-header">

                <div class="dropdown profile-element"> <span>
                    <a class="logo-name-menu">RepoUniversity</a>
                
                     </span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                    <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">${userLog.nombreUsuario}</strong>
                     </span> <span class="text-muted text-xs block">Docente <b class="caret"></b></span> </span> </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a href="/repouniversity/usuario/misdatos?bread=Mis datos-1">Mis Datos</a></li>
                        <li class="divider"></li>
                        <li><a href="/repouniversity/logout">Salir</a></li>
                    </ul>
                </div>
                <div class="logo-element" >
                    RU
                </div>

            </li>
            <li class="${activeTab eq 'dashboard' ? 'active':''}">
				<a href="/repouniversity/dashboard?bread=Inicio-0"><i class="fa fa-home"></i> <span class="nav-label">Inicio  |  Docente</span></a>
	    	</li>
            <li class="${activeTab eq 'verCursoDocente' ? 'active':''}">
                <a class="miscursos" href="/repouniversity/docente/verCursos?bread=Ver Cursos-1"><i class="fa fa-pencil-square-o"></i> <span class="nav-label">Mis cursos</span></a>
               
            </li>
            <li class= ${activeTab eq 'administracion' ? 'active':''}>
                 <a class="adminmenu" ><i class="fa fa-gears"></i> <span class="nav-label" >Administración</span> <span class="fa arrow"></span></a>
                 <ul class="nav nav-second-level">
	                <li><a href="/repouniversity/docente/notificaciones?bread=Notificaciones-1">Mis notificaciones</a></li>
                    <li><a href="/repouniversity/verArchivos?bread=Ver archivos-1">Mis archivos</a></li>
                    <li><a href="/repouniversity/logArchivos/verLogArchivos?bread=Ver log archivos-1">Log archivos</a></li>        
				</ul>
             </li>
             <li class="${activeTab eq 'verUsuarioParametro' ? 'active':''}">
                 <a id="miscursos"><i class="fa fa-cog"></i> <span class="nav-label">Configuracion</span> <span class="fa arrow"></span></a>
                 <ul class="nav nav-second-level">
                     <li><a href="/repouniversity/usuario/misParametros?bread=Ver Parametros-1">Parametros</a></li>
                                   
                 </ul>
             </li>
             <li class="${activeTab eq 'Busqueda' ? 'active':''}"><a class="busqueda" href="/repouniversity/busquedaAvanzada?bread=Busqueda avanzada-1"><i
					class="fa fa-search"></i> <span class="nav-label"> Busqueda Avanzada </span></a>
			</li>
        </ul>
        	</ul>
		<ul class="nav">
        <li style="border-top:solid 1px #504f40">
            <a id="ayuda" data-pjax id='ayuda-link' href="/repouniversity/preguntasFrecuentes?bread=PreguntasFrecuentes-1"><i class="fa fa-question-circle"></i><span class="nav-label">Ayuda</span> </a>
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
         title: "Tutorial Repouniversity",
         content: "Logo de Repouniversity",
     }, {
         element: ".miscursos",
         title: "Mis Cursos",
         content: "En esta sección se listan los cursos que creo el docente."
     },  {
         element: ".adminmenu",
         title: "Administración",
         content: "En esta sección se administran las notificaciones y archivos cargados por el docente."
     }, {
         element: ".busqueda",
         title: "Busqueda Avanzada",
         content: "En esta sección se encuentra las búsquedas de avanzadas de los archivos subidos por todos los usuarios, se pueden realizar búsquedas por diferentes categorías."
     },{
    	 element: ".navbar-form-custom",
         title: "Busqueda Rapida",
         content: "Acceso rápido para buscar un documento en el sistema."   	 
     },{
    	 element: "#contNoti",
         title: "Ver Notificaciones",
         content: "Botón para acceder a las notificaciones, el número que aparece arriba del icono indica la cantidad de notificaciones nuevas que posee el usuario.",   	 
         placement: "left"
     },{
    	 element: ".error",
         title: "Reporte de error",
         content: "Botón para reportar un error en el sistema",
         placement: "left"
     },{
    	 element: ".salir",
         title: "Salir",
         content: "Botón para cerrar la sesión del usuario",
         placement: "left"
     },{
    	 element: "#ayuda",
         title: "Ayuda",
         content: "Toda la ayuda del sistema se encuentra en esta sección del menú."
     }]
 });

$("#startTour").click(function(){
 tour.restart();
})
 </script>


