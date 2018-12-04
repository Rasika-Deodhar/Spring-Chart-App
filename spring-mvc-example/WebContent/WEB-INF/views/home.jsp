<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
 
<head>
   
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
   
<script type="text/javascript">
	$(document).ready(
			function() {
				google.charts.load("current", {
					packages : [ "corechart" ]
				});

				$("#btn").click(function() {
					alert("clicked");
					$.ajax({
						url : "getGraphData",
						success : function(msg) {
							alert(msg);
							msg = JSON.parse(msg);
							alert(Object.keys(msg).length);
									
							//for(var i=0;i<Object.keys(msg).length;i++){
							var data = google.visualization.arrayToDataTable([
							[ 'Age-range', 'Number of People' ], 
							[ 'Less than 12', msg[1] ],
							[ 'Teenagers', msg[2] ], 
							[ '20 - 30', msg[3] ], 
							[ '30-50', msg[4] ],
							[ '50 and above', msg[5] ] ]);
							//}
							
							google.charts.setOnLoadCallback(drawChart);
							drawChart(data);
						}

					});

				});

				function drawChart(data) {

					
					var options = {
						title : 'Age Groups',
						pieHole : 0,
					};

					var chart = new google.visualization.PieChart(document
							.getElementById('donutchart'));
					chart.draw(data, options);
				}

			});
</script>
 
</head>
 
<body>
	<input type="button" id="btn" value="Click me!!" />    
	<div id="donutchart" style="width: 900px; height: 500px;"></div>
	 
</body>
</html>