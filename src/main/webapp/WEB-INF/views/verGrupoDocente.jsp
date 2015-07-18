<html>
<head>
	<meta charset="utf-8" />
	<title>Repouniversity</title>
	<%@include file="../components/common-statics-imports.jsp"%>
	<script src="/repouniversity/resources/js/application/verGrupoDocente.js"></script>
		<script src="/repouniversity/resources/js/plugins/chosen/chosen.jquery.js"></script>
<link rel="stylesheet" type="text/css" href="/repouniversity/resources/css/plugins/chosen/chosen.css" />
</head>
<body class=" pace-done">
	
	<div id="wrapper">
	<%@include file="../components/static-nav-bar.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
		<%@include file="../components/search-nav-bar.jsp"%>
		
		<tag:breadcrumb label="Ver grupo"/>
	
	 	<div class="wrapper wrapper-content animated fadeInRight">
	         <div class="row">
	             <div class="col-lg-12">
	              <div class="ibox float-e-margins">
						<div class="GrupoInformation">
							<div class="page-header">
								<h1>Detalles grupo ${grupo.nombre}</h1>
							</div>
							
						</div>
						
	                  <div class="ibox-title">
	                      <h5>Alumnos</h5>
		                  <div class="ibox-tools" id="agregarAlumnoButton">
		                       <a class="btn btn-primary btn-xs"><i class="fa fa-magic"></i>  Alumno</a>
	                      </div>
	                  </div>
	                  <div class="ibox-content">
	                  	<table id="GruposAlumnos" class="table table-striped table-hover" >
	                  		<thead class="encabezado">
							<tr>
								<th>Id</th>
								<th>Alumno</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${grupo.alumnos}" var="alumno" varStatus="status">
								<tr>
									<td>${alumno.id}</td>
									<td>${alumno.persona.apellido}, ${alumno.persona.nombre}</td>
									<td>
										<a name="deleteAlumno" data-alumnoId="${alumno.id}" ><button class="btn btn-danger btn-circle" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Eliminar Alumno"><i class="fa fa-times"></i></button></a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
	                  	</table>
	                  </div>
	                  <div class="ibox-title">
	                      <h5>Trabajo Practicos</h5>
		                  <div class="ibox-tools" id="agregarTpButton">
	                          <a class="btn btn-primary btn-xs"><i class="fa fa-magic"></i>  TP</a>
	                      </div>
	                  </div>
	                  <div class="ibox-content">
	                  	<table id="GruposTP" class="table table-striped table-hover" >
	                  		<thead class="encabezado">
							<tr>
								<th>Id</th>
								<th>Descripcion</th>
								<th>Archivo</th>
								<th>Nota</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${grupo.tpGrupo}" var="tpgrupo" varStatus="status">
								<tr>
									<td>${tpgrupo.id}</td>
									<td>${tpgrupo.descripcion}</td>
									<td>${tpgrupo.archivoNombre}</td>
									<td>${tpgrupo.nota}</td>
									<td>
										<a href="#" name="editTp" data-tpgrupoId="${tpgrupo.id}"><button class="btn btn-primary btn-circle" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Editar TP"><i class="fa fa-pencil"></i></button></a>
										<a href="#" name="deleteTp" data-tpgrupoId="${tpgrupo.id}" ><button class="btn btn-danger btn-circle" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Eliminar TP"><i class="fa fa-times"></i></button></a>
										<a href="/repouniversity/grupo/verTrabajosPracticos?tpGrupoId=${tpgrupo.id}" name="Ver" data-tpgrupoId="${tpgrupo.id}" ><button class="btn btn-success btn-circle" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Ver TP"><i class="fa fa-codepen"></i></button></a>
										<a href="/repouniversity/vistaPrevia?archivoId=${tpgrupo.archivo}" name="verArchivo" data-tpgrupoId="${tpgrupo.id}" ><button class="btn btn-success btn-circle" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Ver Archivo"><i class="fa fa-search"></i></button></a>
										<a href="/repouniversity/bajarArchivo?archivoId=${tpgrupo.archivo}" name="dowloadArchivo" data-tpgrupoId="${tpgrupo.id}" ><button class="btn btn-success btn-circle" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Bajar Archivo"><i class="fa fa-download"></i></button></a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
	                  	</table>
	                  </div>
	              </div>
	      		</div>
	         </div>
	     </div>
        
		<%@include file="../components/footer.jsp"%>
	</div>
<!-- 	Ventanas -->
	<div id="agregarTpDialog" title="Nuevo TP">
		<form id="nuevoTpForm" class="form-horizontal">
			<input name="grupoId" type="hidden" class="form-control" value="${param.grupoId}">
			<input name="cursoId" type="hidden" class="form-control" value="${grupo.idCurso}"/>
			<div class="form-group">
				<label class="col-sm-2 control-label">Descripcion*:</label>
                <div class="col-sm-10"><input name="descripcion" type="text" class="form-control" required="required"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Archivo*:</label>
                <input name="file" type="file" />	
            </div> 
           
		</form>
	</div>
	
	<div id="editarTpDialog" title="Editar TP">
		<form id="editarTpForm" class="form-horizontal">
			<input name="grupoId" type="hidden" class="form-control" value="${param.grupoId}">
			<input name="tpId" type="hidden" class="form-control" value="">
			<div class="form-group">
				<label class="col-sm-2 control-label">Descripcion*:</label>
                <div class="col-sm-10"><input name="descripcion" type="text" class="form-control" required="required"></div>
            </div>
<!--             <div class="form-group"> -->
<!--                 <label class="col-sm-2 control-label">Archivo*:</label> -->
<!--                 <div class="col-sm-10"><input name="archivoId" type="text" class="form-control" required="required"></div> -->
<!--             </div> -->
<!--             <div class="form-group"> -->
<!--                 <label class="col-sm-2 control-label">Nota:</label> -->
<!--                 <div class="col-sm-10"><input name="nota" type="text" class="form-control" required="required"></div> -->
                
<!--             </div> -->
            <div class="form-group">
                <label class="col-sm-2 control-label">Nota:</label>
                <div class="col-sm-10">
                	<select name="nota" class="form-control">
                		<option value="">Seleccione un Estado</option>
                		<option value="Aprobado">Aprobado</option>
                		<option value="Desaprobado">Desaprobado</option>
                		<option value="Eliminado">Eliminado</option>
                		<option value="Revisar">Revisar</option>
                   	</select>
                </div>
            </div>
        </form>
	</div>
	<div id="agregarAlumnoDialog" title="Nuevo Alumno">
		<form id="nuevoAlumnoForm" class="form-horizontal">
			
			<input name="grupoId" type="hidden" class="form-control" value="${param.grupoId}">
			<div class="form-group">
				<label class="col-sm-2 control-label">Lista de Alumnos*:</label>
				<div class="col-sm-10">
					<select data-placeholder="Elija un alumno" name="alumnosIds"
							multiple class="chosen-select" required="required"
							tabindex="-1">
						<c:forEach items="${grupo.alumnosSinGrupo}" var="alumno"
									varStatus="status">
							<option value="${alumno.id}">${alumno.persona.apellido},
										${alumno.persona.nombre}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</form>
	</div>
	
	<div id="deleteTpDialog" title="Eliminar TP">
		<p>¿Esta seguro que desea eliminar el Trabajo Practico?</p>
	</div>
	<div id="deleteAlumnoDialog" title="Eliminar Alumno">
		<p>¿Esta seguro que desea eliminar el Alumno?</p>
	</div>
	
			
	</div>
	
	<div id="hiddenInputs" class="hidden">
		<input type="hidden" name="personaId" value="${userLog.idPersona}"/>
		<input type="hidden" name="cursoId" value="${grupo.idCurso}."/>
	</div>

	
</body>
</html>