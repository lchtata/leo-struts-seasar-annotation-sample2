<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/Struts2Seasar2Sample/CSS/jquery-ui-1.8.16.redmond.css" />
<script type="text/javascript" src="/Struts2Seasar2Sample/JS/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="/Struts2Seasar2Sample/JS/jquery-ui-1.8.16.min.js"></script>
<title>jQuery UI Progressbar AJAX 示例</title>
</head>
<%--解决jqueryui太大问题--%>
<style type="text/css">
.ui-widget{
font-size:12px !important;
}
</style>
<script language="JavaScript" type="text/javascript">
//jQuery Onload
$(document).ready(function() {
	$("#progressbar1").progressbar();
	$("#progressbar2").progressbar();

	// 默认不自动打开
	$("#progressbarModal").dialog({
		autoOpen : false,
		width : 600,
		height : 90,
		show : "blind",
		hide : "explode",
		modal : true,
		resizable : false,
		autoResize : true,
		overlay : {
			opacity : 0.5,
			background : "black"
		}
	});

	$("#progressbarModal").bind("dialogclose", function(event, ui) {
		//$("#progressbarModal").children().remove();
	});

	$("#simpleTestBtn").click(function() {
		var start = $(this);
		start.button("disable");
		var value = 0;
		var timer = setInterval(function() {
			if (value >= 100) {
				clearInterval(timer);
				value = 0;
				start.button("enable");
			} else {
				value = value + 5;
			}
			$("#progressbar1").progressbar("option", "value", value);
		}, 100);
	}).button();

	$("#ajaxTestBtn").click(function() {
		$("#progressbar2").progressbar({value : 0});
		$("#progressbarModal").dialog("open");
		intervalID = window.setInterval(function() {
			// 用Ajax取得server的百分比
			$.ajax({
				type : 'POST',
				url : 'jQueryProgressbar!getAjaxJSON.action',
				data : '{}',
				contentType : 'application/json; charset=utf-8',
				dataType : 'json',
				success : function(result) {
					var allCnt = result.ALL_DATA_CNT;
					var processingCnt = result.PROCESSING_DATA_CNT;
					var percent = 0;
					var slideCnt = "";
					if (allCnt && processingCnt) {
						percent = Math.floor(parseInt(processingCnt, 10) / parseInt(allCnt, 10) * 100);
						slideCnt = processingCnt + "/" + allCnt;
					}
					// update
					$("#progressbar2").progressbar('option', 'value', percent);
					$("#percent").html(slideCnt + " " + percent + "%");
					if (percent >= 100) {
						window.clearInterval(intervalID);
						$("#progressbarModal").dialog("close");
						//$("#percent").html("0%");
					}
				},
				error : function(obj, err) {
				}
			});
		}, 100);
	}).button();
});
</script>
<body>
	<div align="center">
		<br>
		<s:a action="menu.action">回主菜单</s:a>
		<hr size="3" color="red">
		<br>
		默认单一模式<br>
		<div id="progressbar1"></div>
		<br><input type="button" id="simpleTestBtn" value="测试用" /><br>
		<br>
		<hr color="red">
		<br>
		<br>
		AJAX动态模式<br>
		<input type="button" id="ajaxTestBtn" value="测试用" /> <br>
		<br>
		<a href="http://jqueryui.com/demos/progressbar/">更多请参照jQuery主页</a>
	</div>

	<div id="progressbarModal" title="進捗状況" style="display: none">
		<div id="progressbar2"></div>
		<p id="percent">0%</p>
	</div>
</body>
</html>