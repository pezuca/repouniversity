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
		acceptedFiles: "image/jpg,image/jpeg,image/png,image/gif",
		dictFileTooBig: "File is too big ({{filesize}}KB). Max filesize: {{maxFilesize}}KB."
	});

	myDropzone.on("addedfile", function(file) {
		file.previewElement.querySelector(".start").onclick = function() { myDropzone.enqueueFile(file); };
		$("#previews p.name").each(function(){
			if($(this).text() == file.name) {
				$(this).before("<input type='text' name='title-" + file.name.substring(0,file.name.lastIndexOf(".")) 
						+ "' value='" + file.name.substring(0,file.name.lastIndexOf(".")) 
						+ "' class='form-control' required />");
				$(this).remove();
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
		
		if(inputTitle.val() != '') {
			formData.append("descripcion", inputTitle.val());
			inputTitle.attr("data-value", inputTitle.val());
		} else {
			formData.append("descripcion", file.name.substring(0,file.name.lastIndexOf(".")));
			inputTitle.attr("data-value", file.name.substring(0,file.name.lastIndexOf(".")));
		}
	});

	myDropzone.on("queuecomplete", function(progress) {
		document.querySelector("#total-progress").style.opacity = "0";
	});
	
	myDropzone.on("processing", function(progress) {
		myDropzone.options.url = "/repouniversity/subirArchivo?" + $("#hiddenInputs input[type=hidden]").serialize();
	});

	myDropzone.on("success", function(file, data, message) {
		var input = $("input[name='title-" + file.name.substring(0,file.name.lastIndexOf(".")) + "'][data-value='" + data.descripcion + "']:not([readonly=readonly])").first();

		input.after("<p class='text-success'>" + "El archivo se cargó correctamente" + "</p>");		
		input.attr("readonly", "readonly");
	});
	
	myDropzone.on("error", function(file, message, data) {
		var input = $("input[name='title-" + file.name.substring(0,file.name.lastIndexOf(".")) + "']:not([readonly=readonly])").first();

		input.after("<p class='text-error'>Ha ocurrido un error. Por favor intentelo mas tarde</p>");
		input.attr("readonly", "readonly");
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