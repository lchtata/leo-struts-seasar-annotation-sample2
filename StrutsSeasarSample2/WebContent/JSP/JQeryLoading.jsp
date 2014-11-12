<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/Struts2Seasar2Sample/JS/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="/Struts2Seasar2Sample/JS/jquery.blockUI.js"></script>
<style type="text/css">
body {
	font: 62.5% "Trebuchet MS", sans-serif;
	margin: 50px;
}
</style>
<script language="JavaScript" type="text/javascript">
	//jQuery Onload
	$(document).ready(function() {
		$("#testBtn").click(function() {
			showLoading();
			// 3秒后执行
			setTimeout("goTo()", 3000);
		});
	});
	var showLoading = function() {
		$.blockUI({
			message : '<h1><img src="IMAGE/loadinfo.net.gif"/><br/><font style="font-family:Trebuchet MS,Verdana,sans-serif;text-shadow:2px 2px 2px #808080;" color="#ffffff">Now Loading......</font></h1>',
			fadeIn : 30,
			fadeOut : 30,
			showOverlay : true,
			centerY : true,
			overlayCSS : {
				opacity : 0.2
			},
			css : {
				border : '10px',
				padding : '15px',
				color : '#000000',
				backgroundColor : '#808080',
				'-webkit-border-radius' : '10px',
				'-moz-border-radius' : '10px',
				opacity : .8,
				color : '#fff'
			}
		});
		//setTimeout($.unblockUI, 2000);
		return;
	};
	var goTo = function() {
		$("#goForm").attr("action", "jQeryLoading!goTo.action");
		$("#goForm").submit();
	};
</script>
<title>jQuery Loading 示例</title>
</head>
<body>
	<div align="center">
		<table>
			<tr>
				<td><input type="button" id="testBtn" value="click me">
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>
		<br> <br> <a href="http://jquery.malsup.com/block/">更多请参照这里</a>
		<br> <s:a action="menu.action">回主菜单</s:a>
	</div>
	<s:form id="goForm" method="POST">
	</s:form>
</body>
</html>
