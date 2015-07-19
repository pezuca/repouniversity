
<%@include file="../components/common-statics-imports.jsp" %>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


<body>

    <div id="wrapper">
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">

                        <div class="dropdown profile-element">
                        	<span><a class="logo-name-menu">RepoUniversity</a></span>
                            <span class="clear"> <span class="block m-t-xs">
                              <strong class="font-bold">Ingreso Anonimo</strong>
                            </span>
                        </div>
                        <div class="logo-element">
                            Ru
                        </div>

                    </li>
                    <li>
       					<a href="/repouniversity/dashboard?bread=Inicio-0"><i class="fa fa-home"></i> <span class="nav-label">Inicio  |  Anonimo</span></a>
      			    </li>
      		</div>
        </nav>

     <!-- Pie  -->    


         <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
        <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
            <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                <div class="form-group">
                    <input type="text" placeholder="Buscar archivos..." class="form-control" name="top-search" id="top-search">
                </div>
            </form>
        </div>
            <ul class="nav navbar-top-links navbar-right">
                <li>
                    <span class="m-r-sm text-muted welcome-message">Bienvenidos a RepoUniversity.</span>
                </li>
                <li>
                    <a href="/repouniversity/logout">
                        <i class="fa fa-sign-out"></i> Salir
                    </a>
                </li>
            </ul>

        </nav>
        </div>
                          
  
 
                             

 <!-- scripts -->
    <script src="/repouniversity/resources/js/jquery-1.10.2.js"></script>
    <script src="/repouniversity/resources/js/bootstrap.min.js"></script>
    <script src="/repouniversity/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="/repouniversity/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Flot -->
    <script src="/repouniversity/resources/js/plugins/flot/jquery.flot.js"></script>
    <script src="/repouniversity/resources/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="/repouniversity/resources/js/plugins/flot/jquery.flot.spline.js"></script>
    <script src="/repouniversity/resources/js/plugins/flot/jquery.flot.resize.js"></script>
    <script src="/repouniversity/resources/js/plugins/flot/jquery.flot.pie.js"></script>
    <script src="/repouniversity/resources/js/plugins/flot/jquery.flot.symbol.js"></script>
    <script src="/repouniversity/resources/js/plugins/flot/curvedLines.js"></script>

    <!-- Peity -->
    <script src="/repouniversity/resources/js/plugins/peity/jquery.peity.min.js"></script>
    <script src="/repouniversity/resources/js/demo/peity-demo.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="/repouniversity/resources/js/inspinia.js"></script>
    <script src="/repouniversity/resources/js/plugins/pace/pace.min.js"></script>

    <!-- jQuery UI -->
    <script src="/repouniversity/resources/js/plugins/jquery-ui/jquery-ui.min.js"></script>

    <!-- Jvectormap -->
    <script src="/repouniversity/resources/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="/repouniversity/resources/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

    <!-- Sparkline -->
    <script src="/repouniversity/resources/js/plugins/sparkline/jquery.sparkline.min.js"></script>

    <!-- Sparkline demo data  -->
    <script src="/repouniversity/resources/js/demo/sparkline-demo.js"></script>

    <!-- ChartJS-->
    <script src="/repouniversity/resources/js/plugins/chartJs/Ch.min.js"></script>

    <script>
        $(document).ready(function() {

            var lineData = {
                labels: ["January", "February", "March", "April", "May", "June", "July"],
                datasets: [
                    {
                        label: "Example dataset",
                        fillColor: "rgba(220,220,220,0.5)",
                        strokeColor: "rgba(220,220,220,1)",
                        pointColor: "rgba(220,220,220,1)",
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(220,220,220,1)",
                        data: [65, 59, 80, 81, 56, 55, 40]
                    },
                    {
                        label: "Example dataset",
                        fillColor: "rgba(26,179,148,0.5)",
                        strokeColor: "rgba(26,179,148,0.7)",
                        pointColor: "rgba(26,179,148,1)",
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(26,179,148,1)",
                        data: [28, 48, 40, 19, 86, 27, 90]
                    }
                ]
            };

            var lineOptions = {
                scaleShowGridLines: true,
                scaleGridLineColor: "rgba(0,0,0,.05)",
                scaleGridLineWidth: 1,
                bezierCurve: true,
                bezierCurveTension: 0.4,
                pointDot: true,
                pointDotRadius: 4,
                pointDotStrokeWidth: 1,
                pointHitDetectionRadius: 20,
                datasetStroke: true,
                datasetStrokeWidth: 2,
                datasetFill: true,
                responsive: true,
            };


            var ctx = document.getElementById("lineChart").getContext("2d");
            var myNewChart = new Chart(ctx).Line(lineData, lineOptions);
            
        

        });
    </script>
     
</body>
</html>