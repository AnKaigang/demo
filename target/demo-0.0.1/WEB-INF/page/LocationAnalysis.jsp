<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=L8turS1aBRajTnaYG6NDHUT9"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/library/Heatmap/2.0/src/Heatmap_min.js"></script>
<title>热力图功能示例</title>
<style type="text/css">
ul,li {
	list-style: none;
	margin: 0;
	padding: 0;
	float: left;
}

html {
	height: 100%
}

body {
	height: 100%;
	margin: 0px;
	padding: 0px;
	font-family: "微软雅黑";
}

#container {
	height: 100%;
	width: 100%;
}

#r-result {
	width: 100%;
}
</style>
</head>
<body>
	<div id="container"></div>

</body>
</html>
<script type="text/javascript">
	var map = new BMap.Map("container"); // 创建地图实例

	var point = new BMap.Point(119.559134,39.929233);
	map.centerAndZoom(point, 17); // 初始化地图，设置中心点坐标和地图级别
	map.enableScrollWheelZoom(); // 允许滚轮缩放 

	/* var map = new BMap.Map("allmap"); // 创建Map实例
	 map.centerAndZoom(new BMap.Point(119.547471, 39.913537), 17); // 初始化地图,设置中心点坐标和地图级别
	 //map.addControl(new BMap.MapTypeControl()); //添加地图类型控件
	 map.setCurrentCity("秦皇岛"); // 设置地图显示的城市 此项是必须设置的
	 map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放 */
	data: [ 235, 400, 870, 1000, 540 ]

	var points = [ {
		"lng" : 119.542384,
		"lat" : 39.907428,
		"count" : 35
	}, {
		"lng" : 119.542222,
		"lat" : 39.908106,
		"count" : 50
	}, {
		"lng" : 119.545571,
		"lat" : 39.909554,
		"count" : 25
	}, {
		"lng" : 119.541413,
		"lat" : 39.90859,
		"count" : 25
	}, {
		"lng" : 119.540497,
		"lat" : 39.908978,
		"count" : 60
	}, {
		"lng" : 119.541557,
		"lat" : 39.910901,
		"count" : 40
	},
//	//一体
//	{
//		"lng" : 119.545245,
//		"lat" : 39.910624,
//		"count" : 35
//	}, {
//		"lng" : 119.545034,
//		"lat" : 39.908341,
//		"count" : 65
//	}, {
//		"lng" : 119.545564,
//		"lat" : 39.908435,
//		"count" : 70
//	}, {
//		"lng" : 119.541413,
//		"lat" : 39.90859,
//		"count" : 130
//	}, {
//		"lng" : 119.545231,
//		"lat" : 39.908687,
//		"count" : 60
//	}, {
//		"lng" : 119.545775,
//		"lat" : 39.90914,
//		"count" : 40
//	},
//	//图书馆
//	{
//		"lng" : 119.544131,
//		"lat" : 39.90803,
//		"count" : 35
//	}, {
//		"lng" : 119.544171,
//		"lat" : 39.910766,
//		"count" : 65
//	}, {
//		"lng" : 119.544212,
//		"lat" : 39.910676,
//		"count" : 70
//	}, {
//		"lng" : 119.544279,
//		"lat" : 39.910763,
//		"count" : 130
//	}, {
//		"lng" : 119.544391,
//		"lat" : 39.910655,
//		"count" : 60
//	}, {
//		"lng" : 119.544427,
//		"lat" : 39.910783,
//		"count" : 40
//	}, {
//		"lng" : 119.544427,
//		"lat" : 39.910783,
//		"count" : 40
//	}, {
//		"lng" : 119.544558,
//		"lat" : 39.911008,
//		"count" : 80
//	}, {
//		"lng" : 119.545689,
//		"lat" : 39.911043,
//		"count" : 100
//	}, {
//		"lng" : 119.545959,
//		"lat" : 39.910877,
//		"count" : 20
//	}, {
//		"lng" : 119.546076,
//		"lat" : 39.911119,
//		"count" : 100
//	}, {
//		"lng" : 119.546399,
//		"lat" : 39.912163,
//		"count" : 100
//	}, {
//		"lng" : 119.545842,
//		"lat" : 39.911043,
//		"count" : 100
//	}, {
//		"lng" : 119.5463,
//		"lat" : 39.912371,
//		"count" : 100
//	}, {
//		"lng" : 119.544935,
//		"lat" : 39.911402,
//		"count" : 100
//	}, {
//		"lng" : 119.5463,
//		"lat" : 39.912371,
//		"count" : 100
//	}
//
//	, {
//		"lng" : 119.54754,
//		"lat" : 39.916508,
//		"count" : 60
//	}
//
//	, {
//		"lng" : 119.546534,
//		"lat" : 39.917974,
//		"count" : 60
//	}, {
//		"lng" : 119.548223,
//		"lat" : 39.918389,
//		"count" : 800
//	}

	]
	if (!isSupportCanvas()) {
		alert('热力图目前只支持有canvas支持的浏览器,您所使用的浏览器不能使用热力图功能~')
	}
	//详细的参数,可以查看heatmap.js的文档 https://github.com/pa7/heatmap.js/blob/master/README.md
	//参数说明如下:
	/* visible 热力图是否显示,默认为true
	 * opacity 热力的透明度,1-100
	 * radius 势力图的每个点的半径大小   
	 * gradient  {JSON} 热力图的渐变区间 . gradient如下所示
	 *	{
			.2:'rgb(0, 255, 255)',
			.5:'rgb(0, 110, 255)',
			.8:'rgb(100, 0, 255)'
		}
		其中 key 表示插值的位置, 0~1. 
		    value 为颜色值. 
	 */
	heatmapOverlay = new BMapLib.HeatmapOverlay({
		"radius" : 20
	});
	map.addOverlay(heatmapOverlay);
	heatmapOverlay.setDataSet({
		data : points,
		max : 100
	});
	//是否显示热力图

	heatmapOverlay.show();

	closeHeatmap();
	function setGradient() {
		/*格式如下所示:
		{
			0:'rgb(102, 255, 0)',
		 	.5:'rgb(255, 170, 0)',
		 	1:'rgb(255, 0, 0)'
		}*/
		var gradient = {};
		var colors = document.querySelectorAll("input[type='color']");
		colors = [].slice.call(colors, 0);
		colors.forEach(function(ele) {
			gradient[ele.getAttribute("data-key")] = ele.value;
		});
		heatmapOverlay.setOptions({
			"gradient" : gradient
		});
	}
	//判断浏览区是否支持canvas
	function isSupportCanvas() {
		var elem = document.createElement('canvas');
		return !!(elem.getContext && elem.getContext('2d'));
	}
</script>