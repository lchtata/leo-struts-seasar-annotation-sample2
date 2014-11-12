<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/Struts2Seasar2Sample/CSS/common.css" />
<link rel="stylesheet" type="text/css" href="/Struts2Seasar2Sample/CSS/jquery-ui-1.8.16.redmond.css" />
<script type="text/javascript" src="/Struts2Seasar2Sample/JS/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="/Struts2Seasar2Sample/JS/jquery-ui-1.8.16.min.js"></script>
<title><s:text name="logic.title" /></title>
</head>
<%--解决jqueryui太大问题--%>
<style type="text/css">
.ui-widget{
font-size:12px !important;
}
</style>
<script language="JavaScript" type="text/javascript">
	$(document).ready(function() {
		$("#submitBtn").button();
	});
</script>
<body>
	<div align="center">
		<s:form action="login" method="post">
			<br>
			<h1>
				<s:text name="logic.welcome" />
			</h1>
			<br>
			<font color="red">
				<s:actionerror/>
			</font>
			<table class="rounded-corner">
				<tr>
					<th align="center"><s:text name="logic.username" /></th>
					<td><s:textfield id="userName" name="userName" />
					</td>
				</tr>
				<tr>
					<th align="center"><s:text name="logic.passwrod" /></th>
					<td><s:password id="password" name="password" />
					</td>
				</tr>
			</table>
			<s:submit id="submitBtn" method="input" key="logic.submit" />
			<br><br>
			<s:a action="menu.action">回主菜单</s:a>
		</s:form>
	</div>
</body>
</html>