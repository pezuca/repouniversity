<script src="/repouniversity/resources/js/plugins/dropzone/dropzone.js"></script>
<link href="/repouniversity/resources/css/plugins/dropzone/basic.css"
	rel="stylesheet">
<link href="/repouniversity/resources/css/plugins/dropzone/dropzone.css"
	rel="stylesheet">
<script src="/repouniversity/resources/js/application/fileUpload.js"></script>
<link rel="stylesheet"
	href="/repouniversity/resources/css/fileUpload.css">

<div id="fileUpload" class="modal animated fade ui-front" role="modal"
	tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">
					<i class="fa fa-times-circle"></i>
				</button>
				<h3 class="modal-title">
					<b>Subir Archivo</b>
				</h3>
			</div>
			<div class="modal-body">
				<div id="actions" class="row">
					<div class="col-lg-12">
						<span class="btn btn-success fileinput-button dz-clickable">
							<i class="glyphicon glyphicon-plus"></i>
						</span>
						<button type="submit" class="btn btn-primary start">
							<i class="glyphicon glyphicon-upload"></i> <span>Subir
								todo</span>
						</button>
						<button type="reset" class="btn btn-warning cancel">
							<i class="glyphicon glyphicon-ban-circle"></i> <span>Cancelar
								todo</span>
						</button>
					</div>

					<div class="col-lg-5">
						<span class="fileupload-process">
							<div id="total-progress" class="progress progress-striped active"
								role="progressbar" aria-valuemin="0" aria-valuemax="100"
								aria-valuenow="0">
								<div class="progress-bar progress-bar-success"
									style="width: 0%;" data-dz-uploadprogress=""></div>
							</div>
						</span>
					</div>

					<div class="table table-striped" class="files" id="previews">
						<div id="template" class="file-row">
							<!-- This is used as the file preview template -->
							<div class="col-sm-2">
								<span class="preview"><img data-dz-thumbnail /></span>
							</div>
							<div class="col-sm-7">
								<p class="name" data-dz-name></p>
							</div>
							<div class="col-sm-2">
								<p class="size" data-dz-size></p>
								<div class="progress progress-striped active" role="progressbar"
									aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
									<div class="progress-bar progress-bar-success"
										style="width: 0%;" data-dz-uploadprogress></div>
								</div>
							</div>
							<div class="col-sm-1">
								<button class="btn btn-primary btn-circle start hidden">
									<i class="fa fa-times"></i>
								</button>
								<button data-dz-remove class="btn btn-danger btn-circle cancel">
									<i class="glyphicon glyphicon-ban-circle"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer"></div>
	</div>
</div>