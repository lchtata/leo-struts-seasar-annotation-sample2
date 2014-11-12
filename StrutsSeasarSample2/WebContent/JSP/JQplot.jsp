<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/Struts2Seasar2Sample/CSS/jquery.jqplot.css" />
<script type="text/javascript" src="/Struts2Seasar2Sample/JS/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="/Struts2Seasar2Sample/JS/jquery.jqplot.min.js"></script>
<script type="text/javascript" src="/Struts2Seasar2Sample/JS/excanvas.min.js"></script>
<!--
<script type='text/javascript' src='/Struts2Seasar2Sample/JS/jqplot.funnelRenderer.min.js'></script>
 -->
<script type="text/javascript" src="/Struts2Seasar2Sample/JS/jqplot.pieRenderer.min.js"></script>
<style type="text/css">
body {
	font: 100% "Trebuchet MS", sans-serif;
	margin: 50px;
}
</style>
<script language="JavaScript" type="text/javascript">
	//jQuery Onload
	$(document).ready(function() {
		// 第一个plot
		var s1 = [ [ 'Sony', 7 ], [ 'Samsumg', 13.3 ], [ 'LG', 14.7 ], [ 'Vizio', 5.2 ], [ 'Insignia', 1.2 ] ];
		var plot1 = $.jqplot('myDiv1', [ s1 ], {
			grid : {
				drawBorder : false,
				drawGridlines : false,
				background : '#ffffff',
				shadow : false
			},
			axesDefaults : {},
			seriesDefaults : {
				renderer : $.jqplot.PieRenderer,
				rendererOptions : {
					showDataLabels : true,
					// dataLabelCenterOn: false,   // This is an expreimental feature.
					dataLabelPositionFactor : 0.6,
					dataLabelNudge : 0,
					//dataLabelFormatString: '%.1f%%',
					dataLabels : [ 'Longer', 'B', 'C',
							'Longer', 'None' ]
				}
			},
			legend : {
				show : true,
				placement : 'outside'
			}
		});
		// 第二个plot
		var s2 = [];
		<s:iterator value="div2Info" id="map" status="stt">
			s2.push([ '<s:property value="#map.key"/>', <s:property value="#map.value"/> ]);
		</s:iterator>
		var plot2 = $.jqplot('myDiv2', [ s2 ], {
			seriesColors : [ '#F0F8FF', //aliceblue
			'#FAEBD7', //antiquewhite
			'#00FFFF', //aqua
			'#7FFFD4', //aquamarine
			'#F5F5DC', //beige
			'#0000FF', //blue
			'#8A2BE2', //blueviolet
			'#A52A2A', //brown
			'#DEB887', //burlywood
			'#5F9EA0', //cadetblue
			'#7FFF00', //chartreuse
			'#D2691E', //chocolate
			'#FF7F50', //coral
			'#6495ED', //cornflowerblue
			'#DC143C', //crimson
			'#00008B', //darkblue
			'#B8860B', //darkgoldenrod
			'#A9A9A9', //darkgray
			'#006400', //darkgreen
			'#BDB76B', //darkkhaki
			'#8B008B', //darkmagenta
			'#556B2F', //darkolivegreen
			'#FF8C00', //darkorange
			'#9932CC', //darkorchid
			'#E9967A', //darksalmon
			'#8FBC8F', //darkseagreen
			'#483D8B', //darkslateblue
			'#00CED1', //darkturquoise
			'#9400D3', //darkviolet
			'#FF1493', //deeppink
			'#00BFFF', //deepskyblue
			'#228B22', //forestgreen
			'#FFD700', //gold
			'#DAA520', //goldenrod
			'#008000', //green
			'#ADFF2F', //greenyellow
			'#FF69B4', //hotpink
			'#00FF00', //lime
			'#32CD32', //limegreen
			'#FF00FF', //magenta
			'#7B68EE', //mediumslateblue
			'#C71585', //mediumvioletred
			'#808000', //olive
			'#6B8E23', //olivedrab
			'#FFA500', //orange
			'#FF4500', //orangered
			'#DA70D6', //orchid
			'#EEE8AA', //palegoldenrod
			'#98FB98', //palegreen
			'#AFEEEE', //paleturquoise
			'#DB7093', //palevioletred
			'#FFEFD5', //papayawhip
			'#FFDAB9', //peachpuff
			'#CD853F', //peru
			'#FFC0CB', //pink
			'#DDA0DD', //plum
			'#B0E0E6', //powderblue
			'#800080', //purple
			'#FF0000', //red
			'#BC8F8F', //rosybrown
			'#4169E1', //royalblue
			'#8B4513', //saddlebrown
			'#FA8072', //salmon
			'#F4A460', //sandybrown
			'#2E8B57', //seagreen
			'#FFF5EE', //seashell
			'#A0522D', //sienna
			'#C0C0C0', //silver
			'#87CEEB', //skyblue
			'#6A5ACD', //slateblue
			'#00FF7F', //springgreen
			'#4682B4', //steelblue
			'#D2B48C', //tan
			'#008080', //teal
			'#D8BFD8', //thistle
			'#FF6347', //tomato
			'#40E0D0', //turquoise
			'#EE82EE', //violet
			'#FFFF00', //yellow
			'#9ACD32' //yellowgreen
			], // 默认显示的分类颜色，
			//如果分类的数量超过这里的颜色数量，则从该队列中第一个位置开始重新取值赋给相应的分类
			stackSeries : false, // 如果置为true并且有多个分类（如果是折线图，就必须多于一条折线），
			// 那么每个分类（折线）在纵轴上的值为其前所有分类纵轴值总和与其纵
			//轴值相加值（eg,当前分类纵轴值为Y3
			//，其前有Y2,Y1，那么他显示在Y轴上值为Y2+Y3+Y1,目前该属性支持线图和柱状图
			title : {
				text : 'test2', // 设置当前图的标题
				show : true,//设置当前标题是否显示
			},
			grid : {
				drawBorder : false,
				drawGridlines : false,
				background : '#ffffff',
				shadow : false
			},
			axesDefaults : {},
			seriesDefaults : {
				renderer : $.jqplot.PieRenderer,
				rendererOptions : {
					diameter : true ? 380 : 140, // diameter of pie, auto computed by default.
					padding : 2,
					sliceMargin : 0,
					showDataLabels : true,
					startAngle : -90, //start angle
					shadowOffset : 0, // offset of the shadow from the chart.
					shadowDepth : 0, // Number of strokes to make when drawing shadow.  Each stroke
					// offset by shadowOffset from the last.
					shadowAlpha : 0.07
				// Opacity of the shadow
				},
				markerOptions : {
					show : true
				}
			},
			legend : {
				show : true, //设置是否出现分类名称框（即所有分类的名称出现在图的某个位置）
				placement : 'outside',
				fontSize : 14,
				border : '#ffffff 0px solid',
				renderer : jQuery.jqplot.PieLegendRenderer,
				rendererOptions : {
					numberRows : true ? 25 : 8,
					numberColumns : 2
				}
			}
		});
	});
</script>
<title>jQuery jqplot 示例</title>
</head>
<body>
	<div align="center">
		<table>
			<tr>
				<td>
					<div id="myDiv1"
						style="margin-top: 20px; margin-left: 20px; width: 300px; height: 300px;"></div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="myDiv2"
						style="margin-top: 20px; margin-left: 20px; width: 500px; height: 500px;"></div>
				</td>
			</tr>
		</table>
		<br> <br> <a href="http://www.jqplot.com/">更多请参照jqplot主页</a>
		<br> <s:a action="menu.action">回主菜单</s:a>
	</div>
</body>
</html>