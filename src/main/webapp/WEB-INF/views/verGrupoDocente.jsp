<html>
<head>
	<meta charset="utf-8" />
	<title>Repouniversity</title>
	<%@include file="../components/common-statics-imports.jsp"%>
	<script src="/repouniversity/resources/js/application/verGrupoDocente.js"></script>
	
	
		<script src="/repouniversity/resources/js/plugins/dropzone/dropzone.js"></script>
	<link href="/repouniversity/resources/css/plugins/dropzone/basic.css" rel="stylesheet">
	<link href="/repouniversity/resources/css/plugins/dropzone/dropzone.css" rel="stylesheet">
<!-- 	<script src="/repouniversity/resources/js/application/subirArchivo.js"></script> -->
	<script src="/repouniversity/resources/js/application/fileUpload.js"></script>
	<link rel="stylesheet" href="/repouniversity/resources/css/fileUpload.css">

</head>
<body class=" pace-done">
	
	<div id="wrapper">
	<%@include file="../components/static-nav-bar.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
		<%@include file="../components/search-nav-bar.jsp"%>
	
	 	<div class="wrapper wrapper-content animated fadeInRight">
	         <div class="row">
	             <div class="col-lg-12">
	              <div class="ibox float-e-margins">
						<div class="GrupoInformation">
							<div class="page-header">
								<h1>Detalles grupo ${grupo.nombre}</h1>
							</div>
							
							<div class="page-header">
								<h3>Alumnos</h3>
							</div>
						</div>
						<table id="GruposAlumnos" class="table table-striped hover">
							<thead class="encabezado">
								<tr>
									<th>Id</th>
									<th>Alumno</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${grupo.alumnos}" var="alumno"
									varStatus="status">
									<tr>
										<td>${alumno.persona.id}</td>
										<td>${alumno.persona.apellido}, ${alumno.persona.nombre}</td>
										
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr class="head">
									<th></th>
									<th></th>
									<th></th>
								</tr>
							</tfoot>
						</table>
	                  <div class="ibox-title">
	                      <h5>Trabajo Practicos</h5>
		                  <div class="ibox-tools" id="agregarTpButton">
	                          <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-magic"></i>  TP</a>
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
									<td>${tpgrupo.archivo} ${tpgrupo.archivoNombre}</td>
									<td>${tpgrupo.nota}</td>
									<td>
										<a href="#" name="editTp" data-tpgrupoId="${tpgrupo.id}"><button class="btn btn-primary btn-circle" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Editar TP"><i class="fa fa-pencil"></i></button></a>
										<a href="#" name="deleteTp" data-tpgrupoId="${tpgrupo.id}" ><button class="btn btn-danger btn-circle" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Eliminar TP"><i class="fa fa-times"></i></button></a>
										<a href="/repouniversity/grupo/verTrabajosPracticos?tpGrupoId=${tpgrupo.id}" name="Ver" data-tpgrupoId="${tpgrupo.id}" ><button class="btn btn-success btn-circle" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Ver TP"><i class="fa fa-codepen"></i></button></a>
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
			<div class="form-group">
				<label class="col-sm-2 control-label">Descripcion*:</label>
                <div class="col-sm-10"><input name="descripcion" type="text" class="form-control" required="required"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Archivo*:</label>
                <input name="file" type="file" required="required">	
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Nota:</label>
                <div class="col-sm-10"><input name="nota" type="text" class="form-control" required="required"></div>
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
            <div class="form-group">
                <label class="col-sm-2 control-label">Archivo*:</label>
                <div class="col-sm-10"><input name="archivoId" type="text" class="form-control" required="required"></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Nota:</label>
                <div class="col-sm-10"><input name="nota" type="text" class="form-control" required="required"></div>
            </div>
        </form>
	</div>
	
	<div id="deleteTpDialog" title="Eliminar TP">
		<p>¿Esta seguro que desea eliminar el Trabajo Practico?</p>
	</div>
	</div>
	
	<div id="hiddenInputs" class="hidden">
		<input type="hidden" name="personaId" value="${userLog.idPersona}"/>
		<input type="hidden" name="cursoId" value="${grupo.idCurso}"/>
	</div>

	<script>
		$(document).ready(function(){
			myDropzoneOptions.parallelUploads = 1;
			myDropzoneOptions.maxFiles = 1;
		});
	</script>
	
</body>
</html>