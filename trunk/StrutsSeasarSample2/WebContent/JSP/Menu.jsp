<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/Struts2Seasar2Sample/CSS/common.css" />
<script type="text/javascript" src="/Struts2Seasar2Sample/JS/jquery-1.6.2.min.js"></script>
<title>菜单</title>
</head>
<script language="JavaScript" type="text/javascript">
	$(document).ready(function() {
	});
</script>
<body>
	<div align="center">
		<table class="bluetable">
			<tr>
				<td>
					<s:a action="login.action">进入学生管理系统</s:a>
				</td>
			</tr>
			<tr>
				<td>
					<s:a action="menu!calendar.action">日历Calendar例子(Popup)</s:a>
				</td>
			</tr>
			<tr>
				<td>
					<s:a action="menu!fileUpload.action">文件上传例子</s:a>
				</td>
			</tr>
			<tr>
				<td>
					<s:a action="sendMail.action">Java Mail 例子<font color="red">*未完成</font></s:a>
				</td>
			</tr>
			<tr>
				<td>
					<s:a action="menu!struts2TagSample.action">Struts2 标签 用法示例</s:a>
				</td>
			</tr>
			<tr>
				<td>
					<s:a action="menu!dynamicTable.action">
						jQuery + Prototype 实现动态加载 table 和 添加行，删除行
					</s:a>
				</td>
			</tr>
			<tr>
				<td>
					<s:a action="jQueryAjax.action">jQuery AJAX 例子 (JSON)</s:a>
				</td>
			</tr>
			<tr>
				<td>
					<s:a action="jQueryDialog.action">jQuery Dialog 例子(Popup)</s:a>
				</td>
			</tr>
			<tr>
				<td>
					<s:a action="menu!jQueryAutocomplete.action">jQuery UI Autocomplete AJAX 示例</s:a>
				</td>
			</tr>
			<tr>
				<td>
					<s:a action="menu!jQueryProgressbar.action">jQuery UI Progressbar AJAX 示例</s:a>
				</td>
			</tr>
			<tr>
				<td>
					<s:a action="jQplot.action">jQuery jqplot 示例</s:a>
				</td>
			</tr>
			<tr>
				<td>
					<s:a action="jQeryLoading.action">jQuery Loading 示例</s:a>
				</td>
			</tr>
			<tr>
				<td>
					<s:a action="menu!jQueryInfiniteScroll.action">jQuery Plugin Infinite Scroll示例<font color="red">*未完成</font></s:a>
				</td>
			</tr>
			<tr>
				<td>
					<s:a action="menu!htmlSpecialchars.action">HTML 转义字符工具</s:a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
