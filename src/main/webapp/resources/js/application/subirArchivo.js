$(document).ready(function(){

    Dropzone.options.myAwesomeDropzone = {

        autoProcessQueue: false,
        uploadMultiple: true,
        maxFiles: 5,
	
        // Dropzone settings
        init: function() {
            var myDropzone = this;
            this.element.querySelector("button[type=submit]").addEventListener("click", function(e) {
                e.preventDefault();
                e.stopPropagation();
                myDropzone.processQueue();
            });
            this.on("sendingmultiple", function() {
            });
            this.on("successmultiple", function(files, response) {
				$.gritter.add({
					title:'Archivos',
					text: 'Los archivos subieron correctamente',
					sticky: false
				});
            });
            this.on("errormultiple", function(file, response) {
            	$(".dz-error-message").remove();
				$.gritter.add({
					title:'Error',
					text: 'Algunos archivos no se pudieron subir correctamente. Por favor revise la lista e inténtelo nuevamente.',
    					sticky: false
    				});
            }); 
        }
    }
    
    //AGREGAR DINAMICAMENTE LOS INPUT DE TAGS PARA LAS ETIQUETAS
    var max_fields      = 10; //maximum input boxes allowed
    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
    //var add_button      = $(".add_field_button"); //Add button ID
    var add_button      = $(".btn-circle"); //Add button ID	
    var x = 1; //initlal text box count
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();
        if(x < max_fields){ //max input box allowed
            x++; //text box increment
            $(wrapper).append('<div><input type="text" name="mytext[]"/><a href="#" class="remove_field"><button class="btn btn-warning btn-circle" type="button"><i class="fa fa-times"></i></button></a></div>'); //add input box</a></div>'); //add input box
        }
    });
    
    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('div').remove(); x--;
    })
});
    