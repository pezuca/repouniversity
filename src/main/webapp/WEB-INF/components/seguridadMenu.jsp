<nav class="navbar-default navbar-static-side" role="navigation">
	<div class="sidebar-collapse">
		<ul class="nav" id="side-menu">
			<li class="nav-header">

				<div class="dropdown profile-element">
					<span> <a class="logo-name-menu">RepoUniversity</a>

					</span> <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
						class="clear"> <span class="block m-t-xs"> <strong
								class="font-bold">${userLog.nombreUsuario}</strong>
						</span> <span class="text-muted text-xs block">Seguridad <b
								class="caret"></b></span>
					</span>
					</a>
					<ul class="dropdown-menu animated fadeInRight m-t-xs">
						<li><a
							href="/repouniversity/usuario/misdatos?bread=Mis datos-1">Mis
								Datos</a></li>
						<li class="divider"></li>
						<li><a href="/repouniversity/logout">Salir</a></li>
					</ul>
				</div>
				<div class="logo-element">RU</div>
			</li>
			<li class="${activeTab eq 'dashboard' ? 'active':''}"><a
				href="/repouniversity/dashboard?bread=Inicio-0"><i
					class="fa fa-home"></i> <span class="nav-label">Inicio |
						Seguridad</span></a></li>
			<li class="${activeTab eq 'verMaterias' ? 'active':''}"><a
				id="materias"
				href="/repouniversity/seguridad/listaUsuarios?bread=Usuarios-1"><i
					class="fa fa-book"></i> <span class="nav-label">Administrar
						Roles</span></a></li>
		</ul>
		<ul class="nav">
			<li style="border-top: solid 1px #504f40"><a id="ayuda"
				data-pjax id='ayuda-link'
				href="/repouniversity/preguntasFrecuentes?bread=PreguntasFrecuentes-1"><i
					class="fa fa-question-circle"></i><span class="nav-label">Ayuda</span>
			</a></li>
		</ul>
	</div>
</nav>
