<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/Struts2Seasar2Sample/CSS/jquery-ui-1.8.16.redmond.css" />
<script type="text/javascript" src="/Struts2Seasar2Sample/JS/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="/Struts2Seasar2Sample/JS/jquery-ui-1.8.16.min.js"></script>
<title>JQuery Dialog</title>
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
		$("#selectBtn").click(function() {
			openPopup();
		});
	});
	function openPopup() {
		var horizontalPadding = 35;
		var verticalPadding = 30;
		var maxWidth = 400;
		var maxHeight = 300;
		// 选择的集团
		var vCheckedRadioVal = $("input[name='groupRadio'][type='radio']:checked").val();
		if (!vCheckedRadioVal) {
			alert('请选择集团')
			return false;
		}
		//if (!$('#myPopupFrame').attr('src')) {
			var vUrl = 'jQueryDialog!openPopup.action?groupType=' + vCheckedRadioVal;
			$('#myPopupFrame').attr('src', vUrl);
		//}
		$('#myPopupFrame').dialog({
			title : '集团设定',
			autoOpen : true,
			width : maxWidth,
			height : maxHeight,
			modal : true,
			resizable : false,
			autoResize : true,
			overlay : {
				opacity : 0.5,
				background : "black"
			}
		}).width(maxWidth - horizontalPadding).height(maxHeight - verticalPadding);
	}
</script>
<body>
	<br>
	<s:a action="menu.action">回主菜单</s:a>
	<hr size="3" color="red">
	<br>
	<s:form theme="simple" action="jQueryDialog">
		<div align="center">
			<table style="width: 300px; height: 70px;" border="1">
				<tr>
					<th><s:radio name="groupRadio" label="集团" labelposition="top"
							list="#{'a':'集团A' , 'b':'集团B'}" listKey="key" listValue="value" />
						<br>
						请选择所属部门
						<input type="button" id="selectBtn" value="选择" width="60" height="18" />
					</th>
				</tr>
				<tr>
					<td>
						<div id="dispDepartment">未选择</div>
						<div id="submitDepartment"></div>
					</td>
				</tr>
			</table>
			<br>
			<s:submit value="提交" method="input"></s:submit>
		</div>
	</s:form>
	<iframe id="myPopupFrame" style="display: none"></iframe>
</body>
</html>
