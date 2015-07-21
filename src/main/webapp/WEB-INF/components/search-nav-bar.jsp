<script src="/repouniversity/resources/js/application/reportarError.js"></script>
<div class="row border-bottom">
   <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
        <form role="search" class="navbar-form-custom" method="post" action="/repouniversity/buscarArchivo">
            <div class="form-group">
                <input type="text" placeholder="Buscar archivos..." class="form-control" name="top-search" id="top-search">
            </div>
        </form>
        <ul class="nav navbar-top-links navbar-right">
        <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="/repouniversity/busquedaAvanzada?bread=Busqueda avanzada-1"><i class="fa fa-search advance-search"> Busqueda avanzada</i> </a>
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
                               <strong>Esteban Amodio</strong> Pedido de inscripción</strong>. <br>
                               <small class="text-muted">3 dias a las 7:58 pm - 10.06.2014</small>
                           </div>
                       </div>
                   </li>
                   <li class="divider"></li>
                   <li>
                       <div class="dropdown-messages-box">
                           
                           <div>
                               <small class="pull-right text-navy">hace 5h</small>
                               <strong>Juan Perez</strong> Pedido de inscripción</strong>. <br>
                               <small class="text-muted">Ayer 1:21 pm - 11.06.2014</small>
                           </div>
                       </div>
                   </li>
                   <li class="divider"></li>
                   <li>
                       <div class="dropdown-messages-box">
                           
                           <div>
                               <small class="pull-right">hace 23h</small>
                               <strong>Federico Triay</strong> Pedido de inscripción</strong>. <br>
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
                           	<c:choose>
								<c:when test="${login.rol == 'alumno'}">
									<a href="/repouniversity/alumno/notificaciones?bread=Notificaciones-1">
		                               <strong>Ver todas las notificaciones</strong>
		                               <i class="fa fa-angle-right"></i>
		                           </a>
								</c:when>
								<c:when test="${login.rol == 'docente'}">
									<a href="/repouniversity/docente/notificaciones?bread=Notificaciones-1">
		                               <strong>Ver todas las notificaciones</strong>
		                               <i class="fa fa-angle-right"></i>
		                           </a>
								</c:when>
								<c:when test="${login.rol == 'administrador'}">
									<a href="/repouniversity/notificaciones.html">
		                               <strong>Ver todas las notificaciones</strong>
		                               <i class="fa fa-angle-right"></i>
		                           </a>
								</c:when>
							</c:choose>
                           
                       </div>
                   </li>
               </ul>
           </li>
           <li>
               <div id="agregarErrorButton">
					<a href="#"><i class="fa fa-ban"></i></a>
				</div>
            </li>
           <li>
               <a href="/repouniversity/logout">
                   <i class="fa fa-sign-out"></i> Salir
               </a>
           </li>
       </ul>
   </nav>
   
   <!-- 	Ventanas -->
	<div id="agregarErrorDialog" title="Nuevo Error">
		<form id="nuevoErrorForm" class="form-horizontal">
		    <div class="form-group">
                <label class="col-sm-2 control-label">Descripcion*:</label>
                <div class="col-sm-10"><input name="descripcion" type="textarea" class="form-control" placeholder="Reporte error.."required="required"></div>
            </div>
           
		</form>
	</div>
</div>