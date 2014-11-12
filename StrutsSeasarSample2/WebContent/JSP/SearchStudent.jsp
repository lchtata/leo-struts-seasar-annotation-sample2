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
<title>学生查询</title>
</head>
<%--解决jqueryui太大问题--%>
<style type="text/css">
.ui-widget{
font-size:12px !important;
}
</style>
<script language="javascript" type="text/javascript">
//jQuery Onload
$(document).ready(function() {
	$("input[name='editBtn']").click(function() {
		if (confirm("您要编辑这条数据吗?")) {
			var vSelectId = $(this).attr("id"); 
			var vUrl = "student!gotoUpdate.action?studentId=" + vSelectId;
			$("#serachForm").attr("action", vUrl);
			$("#serachForm").submit();
		}
	}).button();

	$("input[name='deleteBtn']").click(function() {
		if (confirm("删除这条数据将无法恢复,继续吗?")) {
			var vSelectId = $(this).attr("id"); 
			var vUrl = "student!delete.action?studentId=" + vSelectId;
			$("#serachForm").attr("action", vUrl);
			$("#serachForm").submit();
		}
	}).button();

	$("#addBtn").click(function() {
		$("#serachForm").attr("action", "student!gotoAdd.action");
		$("#serachForm").submit();
	}).button();
});
</script>
<body>
<div align="center">
	<br>
	<h2>
		学生查询画面
	</h2>
	<font color="blue">
		<s:actionmessage />
	</font>
	<table class="rounded-corner">
		<tr>
			<th>
				操作
			</th>
			<th>
				学生ID
			</th>
			<th>
				学生姓名
			</th>
			<th>
				学生年龄
			</th>
			<th>
				学生性别
			</th>
		</tr>
		<s:iterator value="dispStudents" id="element" status="s">
			<tr>
				<td>
					<input type="button" name="editBtn" id="<s:property value="studentId" />" value="编辑" />
					<input type="button" name="deleteBtn" id="<s:property value="studentId" />" value="删除" />
				</td>
				<td>
					<s:property value="studentId" />
					<s:hidden name="studentId" value="%{#element.studentId}" />
				</td>
				<td>
					<s:property value="studentName" />
				</td>
				<td>
					<s:property value="studentAge" />
				</td>
				<td>
					<s:property value="studentSex" />
				</td>
			</tr>
		</s:iterator>
	</table>
	<br>
	<input type="button" id="addBtn" value="新增" />
	<br><br>
	<s:a action="menu.action">回主菜单</s:a>
	<br><br>
	<a href="http://s2dao.seasar.org/ja/s2pager.html">Seasar2的S2Pager功能请参照这里</a>
</div>
<s:form id="serachForm" method="post">
</s:form>
</body>
</html>
