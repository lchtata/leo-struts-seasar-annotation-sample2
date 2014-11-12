<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HTML 转义字符工具 - 把HTML代码转换为相应的转义字符</title>
<style type="text/css">
h1,h2,h3,h4 {
	font: bold 1em/1.5em 'Lucida Grande', 'Lucida Sans Unicode', Geneva,
		Verdana, Sans-Serif;
}
h1 {
	font-size: 2.0em;
	font-weight: normal;
	letter-spacing: -2px;
	text-align: center;
}
h2 {
	font-size: 1.8em;
	font-weight: normal;
}
h3 {
	font-size: 1.5em;
	font-weight: normal;
	letter-spacing: -0.5px;
	padding-top: 15px;
}
h4 {
	font-size: 0.8em;
	font-weight: normal;
}
#content {
	width: 600px;
	margin: 0 auto;
}
#result {
	width: 600px;
	margin: 0 auto;
	background-color: #ddd;
}
</style>
<script type="text/javascript">
	function doConvert() {
		var vHtmlcodes = document.getElementById('htmlcodes');
		var vResult = htmlspecialchars(vHtmlcodes.value);
		document.getElementById('result').innerHTML = "<xmp>" + vResult + "</xmp>";
	}
	function htmlspecialchars(str) {
		str = str.replace(/&/g, '&amp;');
		str = str.replace(/\|/g, '&#124;');
		str = str.replace(/</g, '&lt;');
		str = str.replace(/>/g, '&gt;');
		str = str.replace(/"/g, '&quot;');
		str = str.replace(/'/g, '&#039;');
		return str;
	}
</script>
</head>
<body>
	<br>
	<s:a action="menu.action">回主菜单</s:a>
	<hr size="3" color="red">
	<div id="content">
		<h1>HTML 转义字符工具</h1>
		<h4>制作HTML静态页面的时候，有时候会需要将代码贴出来做演示，这时候就要将<, >, &, "等字符转换成&amp;lt;,
			&amp;gt;, &amp;amp;, &amp;quot;的转义字符形式。比如 &lt;body&gt; 会被转义成
			&amp;lt;body&amp;gt;</h4>
		<h4>下面这个小工具可以快速实现这个转换</h4>
		<form method="POST">
			<textarea id="htmlcodes" cols="70" rows="10"></textarea>
			<br/><br/>
			<input type="button" name="submit" value="convert" onclick="doConvert();">
		</form>
		<br />
		<pre id="result"></pre>
	</div>
</body>
</html>
