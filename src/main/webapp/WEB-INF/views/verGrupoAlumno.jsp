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
		              </div>
	                  <div class="ibox-content">
	                  	<table id="GruposAlumnos" class="table table-striped table-hover" >
	                  		<thead class="encabezado">
							<tr>
								<th>Id</th>
								<th>Alumno</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${grupo.alumnos}" var="alumno" varStatus="status">
								<tr>
									<td>${alumno.id}</td>
									<td>${alumno.persona.apellido}, ${alumno.persona.nombre}</td>
								</tr>
							</c:forEach>
						</tbody>
	                  	</table>
	                  </div>
	                  <div class="ibox-title">
	                      <h5>Trabajo Practicos</h5>
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
										<a href="/repouniversity/grupo/verTrabajosPracticosAlumno?tpGrupoId=${tpgrupo.id}" name="Ver" data-tpgrupoId="${tpgrupo.id}" ><button class="btn btn-success btn-circle" type="button" data-toggle="tooltip" data-placement="top" data-original-title="Ver TP"><i class="fa fa-codepen"></i></button></a>
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
			
	</div>
	
	<div id="hiddenInputs" class="hidden">
		<input type="hidden" name="personaId" value="${userLog.idPersona}"/>
		<input type="hidden" name="cursoId" value="${grupo.idCurso}."/>
	</div>

	
</body>
</html>