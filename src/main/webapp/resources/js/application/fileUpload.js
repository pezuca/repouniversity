$(document).ready(function () {
	var previewNode = document.querySelector("#template");
	previewNode.id = "";
	var previewTemplate = previewNode.parentNode.innerHTML;
	previewNode.parentNode.removeChild(previewNode);
	
	myDropzone = new Dropzone(document.body, {
		url: "/repouniversity/subirArchivo",
		method: "POST",
		paramName: "file",
		maxFilesize: 30,
		uploadMultiple: false,
		maxFiles: 10,
		thumbnailWidth: 80,
		thumbnailHeight: 80,
		addRemoveLinks : false,
		parallelUploads: 10,
		previewTemplate: previewTemplate,
		autoQueue: false,
		previewsContainer: "#previews",
		clickable: ".fileinput-button",
		acceptedFiles: "image/*,.pdf,.doc,.ods,.xlsx,.docx,.odt",
		dictFileTooBig: "El archivo es muy grande ({{filesize}}KB). El tamaño máximo es: {{maxFilesize}}KB."
	});

	myDropzone.on("addedfile", function(file) {
		file.previewElement.querySelector(".start").onclick = function() { myDropzone.enqueueFile(file); };
		$("#previews p.name").each(function(){
			var now = (new Date()).getTime();
			if($(this).text() == file.name) {
				$(this).before("<div class='form-group'><input type='text' name='title-" + file.name.substring(0,file.name.lastIndexOf(".")) 
						+ "' value='" + file.name.substring(0,file.name.lastIndexOf(".")) 
						+ "' class='form-control' required /><span class='help-block m-b-none'>Breve descripción del archivo</span></div>");
				$(this).before("<div class='form-group'><input type='text' name='tags-" + file.name.substring(0,file.name.lastIndexOf(".")) 
						+ "' class='form-control' required /><span class='help-block m-b-none'>Coloque los diferentes temas separados por coma (,)</span></div>" + 
						"<div class='form-group'><input name='estado' type='checkbox' class='js-switch a" + now + "' checked='' ><span class='help-block m-b-none'>Privado / Público</span></div>");
						
				$(this).remove();
				new Switchery(document.querySelector('.a' + now));
			}
		});
	});

	myDropzone.on("totaluploadprogress", function(progress) {
		document.querySelector("#total-progress .progress-bar").style.width = progress + "%";
	});

	myDropzone.on("sending", function(file, xhr, formData) {
		document.querySelector("#total-progress").style.opacity = "1";

		file.previewElement.querySelector(".start").setAttribute("disabled", "disabled");
		
		var inputTitle = $("input[name='title-" + file.name.substring(0,file.name.lastIndexOf(".")) + "']:not([data-value])").first();
		var inputTags = $("input[name='tags-" + file.name.substring(0,file.name.lastIndexOf(".")) + "']:not([data-value])").first();
		var inputEstado = inputTitle.parents(".file-row").find("input[name=estado]").is(":checked");
		
		if(inputTitle.val() != '') {
			formData.append("descripcion", inputTitle.val());
			inputTitle.attr("data-value", inputTitle.val());
		} else {
			formData.append("descripcion", file.name.substring(0,file.name.lastIndexOf(".")));
			inputTitle.attr("data-value", file.name.substring(0,file.name.lastIndexOf(".")));
		}
		
		formData.append("tags", inputTags.val().split(","));
		formData.append("estado", inputEstado);
	});

	myDropzone.on("queuecomplete", function(progress) {
		document.querySelector("#total-progress").style.opacity = "0";
	});
	
	myDropzone.on("processing", function(progress) {
		myDropzone.options.url = "/repouniversity/subirArchivo?" + $("#hiddenInputs input[type=hidden]").serialize();
	});

	myDropzone.on("success", function(file, data, message) {
		var input = $("input[name='title-" + file.name.substring(0,file.name.lastIndexOf(".")) + "'][data-value='" + data[0].descripcion + "']:not([readonly=readonly])").first();
		var inputTags = $("input[name='tags-" + file.name.substring(0,file.name.lastIndexOf(".")) + "']:not([readonly=readonly])").first();
		
		input.parents(".file-row").find("span.preview").append("<p class='text-success'><b>" + "El archivo se cargó correctamente" + "</b></p>");
		input.attr("readonly", "readonly");
		inputTags.attr("readonly", "readonly");
		
		$("input[name=archivoId]").val(data[0].id);
		
		$("#fileUpload input[name=atLestOneSuccess]").val("1");
	});
	
	myDropzone.on("error", function(file, message, data) {
		var input = $("input[name='title-" + file.name.substring(0,file.name.lastIndexOf(".")) + "']:not([readonly=readonly])").first();
		var inputTags = $("input[name='tags-" + file.name.substring(0,file.name.lastIndexOf(".")) + "']:not([readonly=readonly])").first();

		input.parents(".file-row").find("span.preview").append("<p class='text-error'>Ha ocurrido un error. Por favor intentelo mas tarde</p>");
		input.attr("readonly", "readonly");
		inputTags.attr("readonly", "readonly");
	});

	document.querySelector("#actions .start").onclick = function() {
		myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED));
	};
	
	document.querySelector("#actions .cancel").onclick = function() {
		myDropzone.removeAllFiles(true);
	};
	
	$('#fileUpload').on('hidden.bs.modal', function () {
		myDropzone.removeAllFiles(true);
	})

});