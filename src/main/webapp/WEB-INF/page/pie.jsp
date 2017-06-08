<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!doctype html>
<html>
	<head>
		<title>Pie Chart</title>
		<script src="javascript/Chart.js"></script>
	</head>
	<body>
		<div id="canvas-holder">
			<canvas id="chart-area" width="280" height="280"/>
		</div>


	<script>

		
/* 		data :[235,400,870,1000,540]  */


		var pieData = [
				{
					value: 235,
					color:"#F7464A",
					highlight: "#FF5A5E",
					label: "宿舍楼"
				},
				{
					value: 400,
					color: "#46BFBD",
					highlight: "#5AD3D1",
					label: "一体"
				},
				{
					value: 870,
					color: "#FDB45C",
					highlight: "#FFC870",
					label: "图书馆"
				},
				{
					value: 1000,
					color: "#949FB1",
					highlight: "#A8B3C5",
					label: "一/二教学楼"
				},
				{
					value: 540,
					color: "#4D5360",
					highlight: "#616774",
					label: "二体"
				}

			];

			window.onload = function(){
				var ctx = document.getElementById("chart-area").getContext("2d");
				window.myPie = new Chart(ctx).Pie(pieData);
			};



	</script>
	</body>
</html>
