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
					<div class="logo-element">Ru</div>

				</li>
				<li class="active"><a href="/repouniversity/dashboard"><i
						class="fa fa-home"></i> <span class="nav-label">Inicio |
							Administrador</span></a></li>
				<li><a href="/repouniversity/admin/verCursos"><i
						class="fa fa-home"></i> <span class="nav-label">Ver cursos</span></a></li>
				<li><a href="/repouniversity/admin/verPersonas"><i
						class="fa fa-home"></i> <span class="nav-label">Ver docentes</span></a></li>
				<li><a href="/repouniversity/admin/verAlumnos"><i
						class="fa fa-home"></i> <span class="nav-label">Ver alumnos</span></a></li>
			</ul>
		</div>
	</nav>
	<div id="page-wrapper" class="gray-bg dashbard-1">
		<div class="row border-bottom">
	        <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
		        <div class="navbar-header">
		            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
		            <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
		                <div class="form-group">
		                    <input type="text" placeholder="Buscar archivos..." class="form-control" name="top-search" id="top-search">
		                </div>
		            </form>
		        </div>
	            <ul class="nav navbar-top-links navbar-right">
	                <li>
	                    <span class="m-r-sm text-muted welcome-message">Bienvenidos a RepoUniversity.</span>
	                </li>
	                <li class="dropdown">
	                    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
	                        <i class="fa fa-envelope"></i>  <span class="label label-warning">3</span>
	                    </a>
	                    <ul class="dropdown-menu dropdown-messages">
	                        <li>
	                            <div class="dropdown-messages-box">
	                               
	                                <div>
	                                    <small class="pull-right">hace 46m</small>
	                                    <strong>Esteban Amodio</strong> Pedido de inscripci�n</strong>. <br>
	                                    <small class="text-muted">3 dias a las 7:58 pm - 10.06.2014</small>
	                                </div>
	                            </div>
	                        </li>
	                        <li class="divider"></li>
	                        <li>
	                            <div class="dropdown-messages-box">
	                                
	                                <div>
	                                    <small class="pull-right text-navy">hace 5h</small>
	                                    <strong>Juan Perez</strong> Pedido de inscripci�n</strong>. <br>
	                                    <small class="text-muted">Ayer 1:21 pm - 11.06.2014</small>
	                                </div>
	                            </div>
	                        </li>
	                        <li class="divider"></li>
	                        <li>
	                            <div class="dropdown-messages-box">
	                                
	                                <div>
	                                    <small class="pull-right">hace 23h</small>
	                                    <strong>Federico Triay</strong> Pedido de inscripci�n</strong>. <br>
	                                    <small class="text-muted">hace 2 dias a las 2:30 am - 11.06.2014</small>
	                                </div>
	                            </div>
	                        </li>
	                        <li class="divider"></li>
	                        <li>
	                            <div class="text-center link-block">
	                                <a href="mailbox.html">
	                                    <i class="fa fa-envelope"></i> <strong>Leer todos los mensajes</strong>
	                                </a>
	                            </div>
	                        </li>
	                    </ul>
	                </li>
	                <li class="dropdown">
	                    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
	                        <i class="fa fa-bell"></i>  <span class="label label-primary">1</span>
	                    </a>
	                    <ul class="dropdown-menu dropdown-alerts">
	                        <li>
	                            <a href="mailbox.html">
	                                <div>
	                                    <i class="fa fa-envelope fa-fw"></i> Tiene 3 solicitudes nuevas
	                                    <span class="pull-right text-muted small">4 minutos</span>
	                                </div>
	                            </a>
	                        </li>
	                        
	                        <li class="divider"></li>
	                        <li>
	                            <div class="text-center link-block">
	                                <a href="notifications.html">
	                                    <strong>Ver todas las alertas</strong>
	                                    <i class="fa fa-angle-right"></i>
	                                </a>
	                            </div>
	                        </li>
	                    </ul>
	                </li>
	                <li>
	                    <a href="/repouniversity/logout">
	                        <i class="fa fa-sign-out"></i> Salir
	                    </a>
	                </li>
	            </ul>
	        </nav>
		</div>
	
	 <!-- Mainly scripts -->
	    <script src="/repouniversity/resources/js/jquery-1.10.2.js"></script>
	    <script src="/repouniversity/resources/js/bootstrap.min.js"></script>
	    <script src="/repouniversity/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	    <script src="/repouniversity/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	
	    <!-- Flot -->
	    <script src="/repouniversity/resources/js/plugins/flot/jquery.flot.js"></script>
	    <script src="/repouniversity/resources/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
	    <script src="/repouniversity/resources/js/plugins/flot/jquery.flot.spline.js"></script>
	    <script src="/repouniversity/resources/js/plugins/flot/jquery.flot.resize.js"></script>
	    <script src="/repouniversity/resources/js/plugins/flot/jquery.flot.pie.js"></script>
	    <script src="/repouniversity/resources/js/plugins/flot/jquery.flot.symbol.js"></script>
	    <script src="/repouniversity/resources/js/plugins/flot/curvedLines.js"></script>
	
	    <!-- Peity -->
	    <script src="/repouniversity/resources/js/plugins/peity/jquery.peity.min.js"></script>
	    <script src="/repouniversity/resources/js/demo/peity-demo.js"></script>
	
	    <!-- Custom and plugin javascript -->
	    <script src="/repouniversity/resources/js/inspinia.js"></script>
	    <script src="/repouniversity/resources/js/plugins/pace/pace.min.js"></script>
	
	    <!-- jQuery UI -->
	    <script src="/repouniversity/resources/js/plugins/jquery-ui/jquery-ui.min.js"></script>
	
	    <!-- Jvectormap -->
	    <script src="/repouniversity/resources/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	    <script src="/repouniversity/resources/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	
	    <!-- Sparkline -->
	    <script src="/repouniversity/resources/js/plugins/sparkline/jquery.sparkline.min.js"></script>
	
	    <!-- Sparkline demo data  -->
	    <script src="/repouniversity/resources/js/demo/sparkline-demo.js"></script>

