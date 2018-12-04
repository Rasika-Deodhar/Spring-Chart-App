<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!-- Load d3.js and c3.js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/js" src="/WebContent/js/c3/c3.js"></script>
<script type="text/js" src="/WebContent/js/c3/c3.min.js"></script>
<script type="text/js" src="/WebContent/js/c3/d3.v5.min.js" charset="utf-8"></script>
<link type="text/css" src="/spring-mvc-example/WebContent/WEB-INF/js/c3/c3.css" rel="stylesheet">

</head>
<body>
	Home page!!

	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3>Pie Series</h3>
					</div>
					<div class="panel-body">
						<div id="chart1"></div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3>Pie Customized Series</h3>
					</div>
					<div id="chart"></div>
				</div>
			</div>
		</div>
	</div>

	<!-- you need to include the shieldui css and js assets in order for the grids to work -->
	

	<script type="text/javascript">
	$(document).ready(function($) {
			var chart = c3.generate({
			    bindto: '#chart',
			    data: {
			      columns: [
			        ['data1', 30, 200, 100, 400, 150, 250],
			        ['data2', 50, 20, 10, 40, 15, 25]
			      ]
			    }
			});

		});
	</script>

</body>
</html>