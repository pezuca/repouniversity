<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta charset="utf-8" />
	<title>Repouniversity</title>
	<%@include file="../components/common-statics-imports.jsp"%>
	
	<script src="/repouniversity/resources/js/plugins/dropzone/dropzone.js"></script>
	<script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>
	<script src="/repouniversity/resources/js/application/fileUpload.js"></script>
	
	<link href="/repouniversity/resources/css/plugins/dropzone/basic.css" rel="stylesheet">
	<link rel="stylesheet" href="/repouniversity/resources/css/fileUpload.css">
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
	<link href="css/plugins/iCheck/custom.css" rel="stylesheet">
	<link href="css/plugins/chosen/chosen.css" rel="stylesheet">
	<link href="css/plugins/switchery/switchery.css" rel="stylesheet">
	<link href="css/plugins/jasny/jasny-bootstrap.min.css" rel="stylesheet">
	<link href="css/plugins/nouslider/jquery.nouislider.css" rel="stylesheet">
	<link href="css/plugins/datapicker/datepicker3.css" rel="stylesheet">
	<link href="css/plugins/ionRangeSlider/ion.rangeSlider.css" rel="stylesheet">
    <link href="css/plugins/ionRangeSlider/ion.rangeSlider.skinFlat.css" rel="stylesheet">
	<link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body class=" pace-done">
	<c:set var="userLog" value="${sessionScope.login}"/>
	
	<div id="wrapper">
		<%@include file="../components/static-nav-bar.jsp"%>
        	<div id="page-wrapper" class="gray-bg dashbard-1">
				<%@include file="../components/search-nav-bar.jsp"%>
				
				<tag:breadcrumb label="Busqueda avanzada"/>
				
		        <div class="wrapper wrapper-content animated fadeIn">
		            <div class="row">
		                <div class="col-lg-12">
			                <div class="ibox float-e-margins">
			                    <div class="ibox-title">
			                        <h5>Busqueda avanzada</h5>
			                    </div>
			                    <div class="ibox-content">
	                        		<form method="post" class="form-horizontal" action="/repouniversity/busquedaAvanzada" role="form">
										<div class="form-group"><label class="col-sm-2 control-label">Materia</label>
											<div class="col-sm-10"><input type="text" class="form-control" name="materia"></div>
		                                </div>
		                                <div class="form-group"><label class="col-sm-2 control-label">Docente</label>
			                                <div class="col-sm-10">
		                                        <div class="row">
		                                            <div class="col-md-4"><input type="text" placeholder="docente nombre" class="form-control" name="nbreDocente"></div>
		                                            <div class="col-md-4"><input type="text" placeholder="docente apellido" class="form-control" name="apeDocente"></div>
		                                        </div>
		                                    </div>
	                                    </div>
		                                <div class="form-group"><label class="col-sm-2 control-label">Carrera</label>
											<div class="col-sm-10"><input type="text" class="form-control" name="carrera"></div>
		                                </div>
		                                <div class="form-group"><label class="col-sm-2 control-label">Descripci&oacute;n</label>
											<div class="col-sm-10"><input type="text" class="form-control" name="descripcion"></div>
		                                </div>
		                                <div class="form-group" id="data_5"><label class="col-sm-2 control-label"><b>Fecha publicaci&oacute;n</b></label>
		                                	<div class="col-sm-10">
		                                		<div class="input-daterange input-group" id="datepicker">
				                                    <input type="text" class="form-control input-sm" name="fechaDde" placeholder="Fecha desde"/>
				                                    <span class="input-group-addon">-</span>
				                                    <input type="text" class="form-control input-sm" name="fechaHta" placeholder="Fecha hasta"/>
				                                </div>
				                            </div>		
		                                </div>
		                                <div class="form-group">
		                                    <div class="col-sm-4 col-sm-offset-2">
		                                        <button class="btn btn-primary" type="submit">buscar</button>
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
   
	<%@include file="../components/footer.jsp"%>
	
	
	<!-- Mainly scripts -->
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Chosen -->
    <script src="js/plugins/chosen/chosen.jquery.js"></script>

   <!-- JSKnob -->
   <script src="js/plugins/jsKnob/jquery.knob.js"></script>

   <!-- Input Mask-->
    <script src="js/plugins/jasny/jasny-bootstrap.min.js"></script>

   <!-- Data picker -->
   <script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>

   <!-- NouSlider -->
   <script src="js/plugins/nouslider/jquery.nouislider.min.js"></script>

   <!-- Switchery -->
   <script src="js/plugins/switchery/switchery.js"></script>

    <!-- IonRangeSlider -->
    <script src="js/plugins/ionRangeSlider/ion.rangeSlider.min.js"></script>

    <!-- iCheck -->
    <script src="js/plugins/iCheck/icheck.min.js"></script>

    <!-- MENU -->
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>

    <script>
        $(document).ready(function(){

            $('#data_1 .input-group.date').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                calendarWeeks: true,
                autoclose: true
            });

            $('#data_2 .input-group.date').datepicker({
                startView: 1,
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                autoclose: true
            });

            $('#data_3 .input-group.date').datepicker({
                startView: 2,
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                autoclose: true
            });

            $('#data_4 .input-group.date').datepicker({
                minViewMode: 1,
                keyboardNavigation: false,
                forceParse: false,
                autoclose: true,
                todayHighlight: true
            });

            $('#data_5 .input-daterange').datepicker({
                keyboardNavigation: false,
                forceParse: false,
                autoclose: true
            });

            var elem = document.querySelector('.js-switch');
            var switchery = new Switchery(elem, { color: '#1AB394' });

            var elem_2 = document.querySelector('.js-switch_2');
            var switchery_2 = new Switchery(elem_2, { color: '#ED5565' });

            var elem_3 = document.querySelector('.js-switch_3');
            var switchery_3 = new Switchery(elem_3, { color: '#1AB394' });

            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
                    var config = {
                '.chosen-select'           : {},
                '.chosen-select-deselect'  : {allow_single_deselect:true},
                '.chosen-select-no-single' : {disable_search_threshold:10},
                '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
                '.chosen-select-width'     : {width:"95%"}
            }
            for (var selector in config) {
                $(selector).chosen(config[selector]);
            }

        $("#ionrange_1").ionRangeSlider({
            min: 0,
            max: 5000,
            type: 'double',
            prefix: "$",
            maxPostfix: "+",
            prettify: false,
            hasGrid: true
        });

        $("#ionrange_2").ionRangeSlider({
            min: 0,
            max: 10,
            type: 'single',
            step: 0.1,
            postfix: " carats",
            prettify: false,
            hasGrid: true
        });

        $("#ionrange_3").ionRangeSlider({
            min: -50,
            max: 50,
            from: 0,
            postfix: "°",
            prettify: false,
            hasGrid: true
        });

        $("#ionrange_4").ionRangeSlider({
            values: [
                "January", "February", "March",
                "April", "May", "June",
                "July", "August", "September",
                "October", "November", "December"
            ],
            type: 'single',
            hasGrid: true
        });

        $("#ionrange_5").ionRangeSlider({
            min: 10000,
            max: 100000,
            step: 100,
            postfix: " km",
            from: 55000,
            hideMinMax: true,
            hideFromTo: false
        });

        $(".dial").knob();

        $("#basic_slider").noUiSlider({
            start: 40,
            behaviour: 'tap',
            connect: 'upper',
            range: {
                'min':  20,
                'max':  80
            }
        });

        $("#range_slider").noUiSlider({
            start: [ 40, 60 ],
            behaviour: 'drag',
            connect: true,
            range: {
                'min':  20,
                'max':  80
            }
        });

        $("#drag-fixed").noUiSlider({
            start: [ 40, 60 ],
            behaviour: 'drag-fixed',
            connect: true,
            range: {
                'min':  20,
                'max':  80
            }
        });


    </script>
</body>
</html>