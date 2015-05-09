<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta charset="utf-8" />
	<title>Repouniversity</title>
	<%@include file="../components/common-statics-imports.jsp"%>
	<link rel="stylesheet" type="text/css" href="/repouniversity/resources/css/jquery.dataTables_themeroller.css" />
	<link rel="stylesheet" type="text/css" href="/repouniversity/resources/css/jquery.dataTables.min.css" />
	<link href="/repouniversity/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="/repouniversity/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
	<link href="/repouniversity/resources/css/animate.css" rel="stylesheet">
	<link href="/repouniversity/resources/css/plugins/dropzone/basic.css" rel="stylesheet">
	<link href="/repouniversity/resources/css/plugins/dropzone/dropzone.css" rel="stylesheet">
	<link href="/repouniversity/resources/css/style.css" rel="stylesheet">
</head>
<body class=" pace-done">
	<c:set var="userLog" value="${sessionScope.login}"/>
	
	<div id="wrapper" class="container">
		<%@include file="../components/static-nav-bar.jsp"%>
        	<div id="page-wrapper" class="gray-bg dashbard-1">
		        <div class="wrapper wrapper-content animated fadeIn">
		            <div class="row">
		                <div class="col-lg-12">
			                <div class="ibox float-e-margins">
			                    <div class="ibox-title">
			                        <h5>Subir Archivos</h5>
			                        <div class="ibox-tools">
			                            <a class="collapse-link">
			                                <i class="fa fa-chevron-up"></i>
			                            </a>
			                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
			                                <i class="fa fa-wrench"></i>
			                            </a>
			                            <ul class="dropdown-menu dropdown-user">
			                                <li><a href="#">Config option 1</a>
			                                </li>
			                                <li><a href="#">Config option 2</a>
			                                </li>
			                            </ul>
			                            <a class="close-link">
			                                <i class="fa fa-times"></i>
			                            </a>
			                        </div>
			                    </div>
			                    <div class="ibox-content">
			                        <div class="ibox float-e-margins">
					                    <div class="ibox-content">
					                        <form id="my-awesome-dropzone" class="dropzone dz-clickable" action="/repouniversity/subirArchivo" method="POST">
					                            <div class="dropzone-previews"></div>
					                            <button type="submit" class="btn btn-primary pull-right">Submit this form!</button>
					                        	<div class="dz-default dz-message"><span>Drop files here to upload</span></div>
					                        	<div class="input_fields_wrap">
												    <div><input type="text" name="mytext">
<!-- 												    	<button class="add_field_button" >Add More Fields</button> -->
												    	<button class="btn btn-info btn-circle" type="button"><i class="fa fa-check" ></i></button>
												    </div>
												     <div class="col-sm-10">
												     	<input type="text" name="descripcion" placeholder="Descripcion" class="form-control m-b"/>
				                                    </div>
												</div>
					                        </form>
					                    </div>
					                </div>
			                    </div>
			                </div>    
		            	</div>
					</div>
		    	</div>
		    </div>	
	    </div>	
		<!-- Mainly scripts -->
    <script src="/repouniversity/resources/js/jquery-1.10.2.js"></script>
    <script src="/repouniversity/resources/js/bootstrap.min.js"></script>
    <script src="/repouniversity/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="/repouniversity/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="/repouniversity/resources/js/inspinia.js"></script>
    <script src="/repouniversity/resources/js/plugins/pace/pace.min.js"></script>

    <!-- DROPZONE -->
    <script src="/repouniversity/resources/js/plugins/dropzone/dropzone.js"></script>


    <script>
        $(document).ready(function(){

            Dropzone.options.myAwesomeDropzone = {

                autoProcessQueue: false,
                uploadMultiple: true,
                parallelUploads: 5,
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
                    });
                    this.on("errormultiple", function(files, response) {
                    }); 
                }

            }

       });
        
       //AGREGAR DINAMICAMENTE LOS INPUT DE TAGS PARA LAS ETIQUETAS
       
       $(document).ready(function() {
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
    </script>

   
	<%@include file="../components/footer.jsp"%>
</body>
</html>