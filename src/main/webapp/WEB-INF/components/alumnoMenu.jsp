<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav" id="side-menu">
            <li class="nav-header">

                <div class="dropdown profile-element"> <span>
                    <a class="logo-name-menu">RepoUniversity</a>
                
                     </span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                    <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">${userLog.nombreUsuario}</strong>
                      </span> <span class="text-muted text-xs block">Alumno <b class="caret"></b></span> </span> </a>
                     <ul class="dropdown-menu animated fadeInRight m-t-xs">
                         <li><a href="/repouniversity/usuario/misdatos?bread=Mis datos-1">Mis Datos</a></li>
                         <li class="divider"></li>
                         <li><a href="/repouniversity/logout">Salir</a></li>
                     </ul>
                 </div>
                 <div class="logo-element">
                     RU
                 </div>
            </li>
			<li class="${activeTab eq 'dashboard' ? 'active':''}"><a href="/repouniversity/dashboard?bread=Inicio-0"><i
					class="fa fa-home"></i> <span class="nav-label">Inicio |
						Alumno</span></a></li>
		    
             <li ${activeTab eq 'verCursosAlumno' ? 'active':''}>
                 <a id="miscursos"><i class="fa fa-pencil-square-o"></i> <span class="nav-label">Mis cursos</span> <span class="fa arrow"></span></a>
                 <ul class="nav nav-second-level">
                     <li><a href="/repouniversity/alumno/cursos?bread=Ver cursos-1">Ver cursos</a></li>
                     <li><a href="/repouniversity/alumno/solicitarCurso?bread=Solicitud alta en curso-1">Solicitar alta a un curso</a></li>              
                 </ul>
             </li>
             <li ${activeTab eq 'administracion' ? 'active':''}>
                 <a id="adminmenu" ><i class="fa fa-gears"></i> <span class="nav-label">Administración</span> <span class="fa arrow"></span></a>
                 <ul class="nav nav-second-level">
	                <li><a href="/repouniversity/alumno/notificaciones?bread=Notificaciones-1">Mis notificaciones</a></li>
					<li><a href="/repouniversity/alumno/verGrupos?bread=Ver Grupos-1">Mis grupos de TPs</a></li>
					<li><a href="/repouniversity/verArchivos?bread=Ver archivos-1">Mis archivos</a></li>   				
            </a>
        </li>     
				</ul>
             </li>
             <li class="${activeTab eq 'Busqueda' ? 'active':''}"><a id="busqueda" href="/repouniversity/busquedaAvanzada?bread=Busqueda avanzada-1"><i
					class="fa fa-search"></i> <span class="nav-label"> Busqueda Avanzada </span></a></li>
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
         content: "Logo de Repouniversity"
     }, {
         element: "#miscursos",
         title: "Mis Cursos",
         content: "En esta sección hay dos opciones en la primera se listan todos los cursos en que estas dado de alta, y en la segunda todos los cursos activos para darse de alta."
     },  {
         element: "#adminmenu",
         title: "Administración",
         content: "En esta sección se encuentran tres opciones, la primera es mis notificaciones donde se encuentran todas las notificaciones del alumno, la segunda es mis grupos de tps donde están todos los grupo donde este el alumno, y tercero mis archivos donde se listan los archivos subidos por el alumno."
     }, {
         element: "#busqueda",
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
 
 
 
