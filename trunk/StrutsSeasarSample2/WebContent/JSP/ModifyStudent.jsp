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
<title>学生信息</title>
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
	$("#addBtn").button();

	$("#returnBtn").click(function() {
		$("#addForm").attr("action", "student!init.action");
		$("#addForm").submit();
	}).button();
});
</script>
<body>
<s:form id="addForm" action="student" method="post">
<div align="center">
	<br>
	<h2>
		学生
		<%-- s:if 和 枚举比较 --%>
		<s:if test="runModel.toString() == @edu.leo.common.CommonConst$RunModel@ADD.toString()">
			添加
		</s:if>
		<s:else>
			修改
		</s:else>
	</h2>
	<br>
	<font color="red">
		<s:actionerror/>
	</font>
	<table class="rounded-corner">
		<tr>
			<th>
				学生姓名
			</th>
			<td>
				<s:textfield id="studentName" name="studentName" />
				<s:hidden id="studentId" name="studentId" />
			</td>
		</tr>
		<tr>
			<th>
				学生年龄
			</th>
			<td>
				<s:select name="studentAge" list="#{18:'18岁',19:'19岁',20:'20岁',21:'21岁',22:'22岁'}"
					listKey="key" listValue="value" headerKey="0" headerValue="请选择"></s:select>
			</td>
		</tr>
		<tr>
			<th>
				学生性别
			</th>
			<td>
				<s:radio name="studentSex" list="{'男','女'}"></s:radio>
			</td>
		</tr>
	</table>
	<br>
	<%-- s:if 和 枚举比较 --%>
	<s:if test="runModel.toString() == @edu.leo.common.CommonConst$RunModel@ADD.toString()">
		<s:submit id="addBtn" value="新增" method="add" />
	</s:if>
	<s:else>
		<s:submit id="addBtn" value="修改" method="update" />
	</s:else>
	&nbsp;&nbsp;&nbsp;
	<input type="button" id="returnBtn" value="返回" />
</div>
</s:form>
</body>
</html>
