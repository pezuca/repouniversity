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
                 <a><i class="fa fa-pencil-square-o"></i> <span class="nav-label">Mis cursos</span> <span class="fa arrow"></span></a>
                 <ul class="nav nav-second-level">
                     <li><a href="/repouniversity/alumno/cursos?bread=Ver cursos-1">Ver cursos</a></li>
                     <li><a href="/repouniversity/alumno/solicitarCurso?bread=Solicitud alta en curso-1">Solicitar alta a un curso</a></li>              
                 </ul>
             </li>
             <li ${activeTab eq 'administracion' ? 'active':''}>
                 <a><i class="fa fa-gears"></i> <span class="nav-label">Administración</span> <span class="fa arrow"></span></a>
                 <ul class="nav nav-second-level">
	                <li><a href="#">Ver mis archivos</a></li>
					<li><a href="/repouniversity/alumno/verGrupos?bread=Ver Grupos-1">Ver mis grupos de TPs</a></li>
					<li><a href="/repouniversity/alumno/notificaciones?bread=Notificaciones-1">Ver mis notificaciones</a></li>        
				</ul>
             </li>
         </ul>
     </div>
 </nav>
