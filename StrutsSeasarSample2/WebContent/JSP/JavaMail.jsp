<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/Struts2Seasar2Sample/CSS/common.css" />
<title>Java Mail 例子</title>
</head>
<body>
	<div align="center">
		<font color="red">
			<s:actionmessage/>
			<s:actionerror/>
		</font>
		<s:form action="sendMail" method="POST" enctype="multipart/form-data">
			<table id="mailTable" class="rounded-corner">
				<tr>
					<th align="center">smtp服务器</th>
					<td>
						<s:textfield id="mailSmtpHost" name="mailSmtpHost"></s:textfield>
					</td>
				</tr>
				<tr>
					<th align="center">smtp端口</th>
					<td>
						<s:textfield id="mailSmtpPort" name="mailSmtpPort"></s:textfield>
					</td>
				</tr>
				<tr>
					<th align="center">接收服务器</th>
					<td>
						<s:textfield id="mailHost" name="mailHost"></s:textfield>
					</td>
				</tr>
				<tr>
					<th align="center">用户名</th>
					<td>
						<s:textfield id="userId" name="userId"></s:textfield>
					</td>
				</tr>
				<tr>
					<th align="center">密码</th>
					<td>
						<s:password id="userPwd" name="userPwd"></s:password>
					</td>
				</tr>
				<tr>
					<th align="center">主题</th>
					<td>
						<s:textfield id="subject" name="subject"></s:textfield>
					</td>
				</tr>
				<tr>
					<th align="center">内容</th>
					<td>
						<s:textarea id="mailContext" name="mailContext"></s:textarea>
					</td>
				</tr>
				<tr>
					<th align="center">发送者姓名</th>
					<td>
						<s:textfield id="fromAddressName" name="fromAddressName"></s:textfield>
					</td>
				</tr>
				<tr>
					<th align="center">发送者地址</th>
					<td>
						<s:textfield id="fromAddress" name="fromAddress"></s:textfield>
					</td>
				</tr>
				<tr>
					<th align="center">接收者姓名</th>
					<td>
						<s:textfield id="toAddressName" name="toAddressName"></s:textfield>
					</td>
				</tr>
				<tr>
					<th align="center">接收者地址</th>
					<td>
						<s:textfield id="toAddress" name="toAddress"></s:textfield>
					</td>
				</tr>
				<tr>
					<th align="center">请选择附件</th>
					<td>
						<s:file name="attachmentFile" />
					</td>
				</tr>
			</table>
			<s:submit value="发送" method="send" />
		</s:form>
		<br><br>
		<s:a action="menu.action">回主菜单</s:a>
	</div>
</body>
</html>
