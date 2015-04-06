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
						<li><a href="/repouniversity/usuario/misdatos">Mis Datos</a></li>
						<li class="divider"></li>
						<li><a href="/repouniversity/logout">Salir</a></li>
					</ul>
				</div>
				<div class="logo-element">RU</div>

			</li>
			<li class="${activeTab eq 'dashboard' ? 'active':''}"><a href="/repouniversity/dashboard"><i
					class="fa fa-home"></i> <span class="nav-label">Inicio |
						Administrador</span></a></li>
			<li class="${activeTab eq 'verCursos' ? 'active':''}"><a href="/repouniversity/admin/verCursos"><i
					class="fa fa-home"></i> <span class="nav-label">Ver cursos</span></a></li>
			<li class="${activeTab eq 'verPersonas' ? 'active':''}"><a href="/repouniversity/admin/verPersonas"><i
					class="fa fa-home"></i> <span class="nav-label">Ver docentes</span></a></li>
			<li class="${activeTab eq 'verAlumnos' ? 'active':''}"><a href="/repouniversity/admin/verAlumnos"><i
					class="fa fa-home"></i> <span class="nav-label">Ver alumnos</span></a></li>
		</ul>
	</div>
</nav>
