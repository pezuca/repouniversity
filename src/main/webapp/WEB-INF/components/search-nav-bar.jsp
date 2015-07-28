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
                   <i class="fa fa-bell"></i>  <span id = "contNoti" class="label label-primary" style='display:none;'>0</span>
               </a>
               <ul class="dropdown-menu dropdown-alerts">
                   <li>
                     
                           <div id="linkNoti">
                               <i class="fa fa-envelope fa-fw"></i> 
                               <span id="textNoti">Tiene 3 solicitudes nuevas</span>
                           </div>
                      
                   </li>
                   
                   <li class="divider"></li>
                   <li>
                       <div class="text-center link-block">
                           	<c:choose>
								<c:when test="${login.rol == 'alumno'}">
									<a href="/repouniversity/alumno/notificaciones?bread=Notificaciones-1">
		                               <strong>Ver las notificaciones</strong>
		                               <i class="fa fa-angle-right"></i>
		                           </a>
								</c:when>
								<c:when test="${login.rol == 'docente'}">
									<a href="/repouniversity/docente/notificaciones?bread=Notificaciones-1">
		                               <strong>Ver las notificaciones</strong>
		                               <i class="fa fa-angle-right"></i>
		                           </a>
								</c:when>
								<c:when test="${login.rol == 'administrador'}">
									<a href="/repouniversity/admin/verReporteErrores?bread=Ver reportes de errores-1">
		                               <strong>Ver los errores</strong>
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
					<a href="#"><i class="fa fa-warning"></i></a>
				</div>
            </li>
            <li>
               <div id="preguntasFrecuentes">
					<a href="/repouniversity/preguntasFrecuentes?bread=PreguntasFrecuentes-1"><i class="fa fa-question"></i></a>
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
                <div class="col-sm-10"><textarea name="descripcion" class="form-control" placeholder="Reporte error.." required="required"></textarea></div>
            </div>
           
		</form>
	</div>
</div>
<script>
var myVar = setInterval(function () {misNotificaciones()}, 5000);
function myTimer() {
	alert('Hi')
}

function misNotificaciones() {
	$.ajax({
		  type: "GET",
		  url: "/repouniversity/notificaciones",
		  success: function(data){ 

			  if (data == 0) {
				  //if (data.length == 0) {
				  $("#contNoti").hide();
		//		  $("#linkNoti").hide();
		//		  $("#textNoti").hide();
				  $("#textNoti").html("No tiene notificaciones nuevas");
				} else{
					  $("#contNoti").show();
		//			  $("#linkNoti").show();
		//			  $("#textNoti").show();
					  $("#contNoti").html(data);
					  if (data == 1) {
					 	 $("#textNoti").html("Tiene una nueva notificacion");
					  } else{
						  	
						  	$("#textNoti").html("Tiene " + data + " notificaciones nuevas");
							}
				}
		  }
	});
}
</script>