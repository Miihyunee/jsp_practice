<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chart02</title>
<script src="https://www.google.com/jsapi"></script>
<script src="http://code.jquery.com/jquery-3.6.1.js"></script>
<script>
	google.load("visualization", "1", {
		"packages" : [ "corechart" ]
	});
	google.setOnLoadCallback(drawChart);
	function drawChart() {
		let json_data = $.ajax({
			url : "/jsp03/chart_servlet/cart_money_list.do",
			async : false
		}).responseText;
		console.log(json_data);
		let data = new google.visualization.DataTable(json_data);
		let chart = new google.visualization.PieChart(document
				.getElementById("chart_div"));
		chart.draw(data, {
			title : "차트 예제",
			width : 600,
			height : 440
		});
	}
</script>
</head>
<body>
	<div id="chart_div"></div>
	<button type="button" onclick="drawChart()">refresh</button>
</body>
</html>