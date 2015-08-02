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
			<li class="${activeTab eq 'verMaterias' ? 'active':''}"><a href="/repouniversity/admin/verMaterias?bread=Ver materias-1"><i
					class="fa fa-book"></i> <span class="nav-label">Ver materias</span></a></li>
			<li class="${activeTab eq 'verCursos' ? 'active':''}"><a href="/repouniversity/admin/verCursos?bread=Ver cursos-1"><i
					class="fa fa-laptop"></i> <span class="nav-label">Ver cursos</span></a></li>
			<li class="${activeTab eq 'verUsuarios' ? 'active':''}"><a href="/repouniversity/admin/verUsuarios?bread=Ver usuario-1"><i
					class="fa fa-group"></i> <span class="nav-label">Ver usuarios</span></a></li>
			<li class="${activeTab eq 'verCarreras' ? 'active':''}"><a href="/repouniversity/admin/verCarreras?bread=Ver carreras-1"><i
					class="fa fa-bank"></i> <span class="nav-label">Ver carreras</span></a></li>
			<li class="${activeTab eq 'verArchivos' ? 'active':''}"><a href="/repouniversity/admin/verArchivos?bread=Ver archivos-1"><i
					class="fa fa-file-pdf-o"></i> <span class="nav-label">Ver archivos</span></a></li>
			<li class="${activeTab eq 'verErroresArchivos' ? 'active':''}"><a href="/repouniversity/admin/verReporteErrores?bread=Ver reportes de errores-1"><i
					class="fa fa-warning"></i> <span class="nav-label">Ver reportes errores</span></a></li>
			<li class="${activeTab eq 'Busqueda' ? 'active':''}"><a href="/repouniversity/busquedaAvanzada?bread=Busqueda avanzada-1"><i
					class="fa fa-search"></i> <span class="nav-label"> Busqueda Avanzada </span></a></li>					
		</ul>
			</ul>
		<ul class="nav">
        <li style="border-top:solid 1px #504f40">
            <a data-pjax id='ayuda-link' href="/repouniversity/preguntasFrecuentes?bread=PreguntasFrecuentes-1"><i class="fa fa-question-circle"></i><span class="nav-label">Ayuda</span> </a>
        </li>      
        </ul>
	</div>
</nav>
