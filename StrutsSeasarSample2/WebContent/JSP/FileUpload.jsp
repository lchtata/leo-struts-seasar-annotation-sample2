<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/Struts2Seasar2Sample/CSS/common.css" />
<script type="text/javascript" src="/Struts2Seasar2Sample/JS/jquery-1.6.2.min.js"></script>
<title>文件上传例子</title>
<script language="JavaScript" type="text/javascript">
	$(document).ready(function() {
		$("#addBtn").click(function(){
			// 复制第一个tr
			var tr = $("#updTable tr").eq(0).clone();
			tr.appendTo("#updTable");
			// 在[添加button的tr]之前加入新建的tr
			var vAddTr = $("#addTr");
			tr.insertBefore(vAddTr);
		});
	});
</script>
</head>
<body>
	<div align="center">
		<font color="blue">
			<s:actionmessage/>
		</font>
		<s:form action="fileUpload" method="POST" enctype="multipart/form-data">
			<table id="updTable" class="rounded-corner">
				<tr>
					<th align="center">请选择文件</th>
					<td>
						<s:file name="updFile" />
					</td>
				</tr>
				<tr id="addTr">
					<td colspan="2" align="right">
						<input type="button" id="addBtn" value="添加" />
					</td>
				</tr>
			</table>
			<s:submit value="上传" />
		</s:form>
		<br><br>
		<s:a action="menu.action">回主菜单</s:a>
	</div>
</body>
</html>
