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
                 <a class="adminmenu" ><i class="fa fa-gears"></i> <span class="nav-label" >Administraci�n</span> <span class="fa arrow"></span></a>
                 <ul class="nav nav-second-level">
	                <li><a href="/repouniversity/docente/notificaciones?bread=Notificaciones-1">Mis notificaciones</a></li>
                    <li><a href="/repouniversity/verArchivos?bread=Ver archivos-1">Mis archivos</a></li>        
				</ul>
             </li>
             <li class="${activeTab eq 'Busqueda' ? 'active':''}"><a class="busqueda" href="/repouniversity/busquedaAvanzada?bread=Busqueda avanzada-1"><i
					class="fa fa-search"></i> <span class="nav-label"> Busqueda Avanzada </span></a>
			</li>
        </ul>
        	</ul>
		<ul class="nav">
        <li style="border-top:solid 1px #504f40">
            <a class="ayuda" data-pjax id='ayuda-link' href="/repouniversity/preguntasFrecuentes?bread=PreguntasFrecuentes-1"><i class="fa fa-question-circle"></i><span class="nav-label">Ayuda</span> </a>
        </li>      
        </ul>
        <a href="#" class="btn btn-block btn-primary" id="startTour">Start tour</a>
    </div>
</nav>


 <script type="text/javascript">


 var tour = new Tour({
     steps: [{
         element: ".logo-name-menu",
         title: "Tutorial Repouniversity",
         content: "Logo de Repouniversity"
     }, {
         element: ".miscursos",
         title: "Mis Cursos",
         content: "En esta secci�n se listan los cursos que creo el docente."
     },  {
         element: ".adminmenu",
         title: "Administraci�n",
         content: "En esta secci�n se administran las notificaciones y archivos cargados por el docente."
     }, {
         element: ".busqueda",
         title: "Busqueda Avanzada",
         content: "En esta secci�n se encuentra las b�squedas de avanzadas de los archivos subidos por todos los usuario, se pueden realizar b�squedas por diferentes categor�as."
     },{
         
    	 
     },{
    	 element: ".ayuda",
         title: "Ayuda",
         content: "Toda la ayuda del sistema se encuentra en esta secci�n del men�."
    	 
    	 
     }]
 }).init().start(true);

$("#startTour").click(function(){
 tour.restart();
})
 </script>


