<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/Struts2Seasar2Sample/JS/jquery-1.6.2.min.js"></script>
<title>JQuery Dialog Popup</title>
</head>
<script language="JavaScript" type="text/javascript">
	//jQuery Onload
	$(document).ready(function() {
		$("#setBtn").click(function() {
			// 选择的部门
			var vDepartmentAry = $("input[name='departmentId'][type='checkbox']:checked");
			if (!vDepartmentAry || vDepartmentAry.length == 0) {
				alert("请选择部门");
			} else {
				// 父画面的hidden全部消除(所有名字以department开头的input)
				var vOrigHiddenList = window.parent.$("input[name^='department']");
				vOrigHiddenList.each(function() {
					$(this).remove();
				});
				var vDispMsg = "";
				var vIndex = 0;
				var vParentSubmitDiv = window.parent.$("#submitDepartment");
				vDepartmentAry.each(function() {
					if (vDispMsg != "") {
						vDispMsg += ",";
					}
					var vDepartmentId = $(this).val();
					var vDepartmentName = $("#departmentLabel_" + vDepartmentId).html();
					vDispMsg += vDepartmentName;
					// 在父画面建hidden(为model的List<String>赋值)
					var vHidden = createHidden();
					vHidden.attr("name", "departmentIdList");
					vHidden.val(vDepartmentId);
					vHidden.appendTo(vParentSubmitDiv);
					// 在父画面建hidden(为model的List<Department>赋值)
					var vHiddenId = createHidden();
					vHiddenId.attr("name", "departmentList[" + vIndex + "].departmentId");
					vHiddenId.val(vDepartmentId);
					vHiddenId.appendTo(vParentSubmitDiv);
					var vHiddenName = createHidden();
					vHiddenName.attr("name", "departmentList[" + vIndex + "].departmentName");
					vHiddenName.val(vDepartmentName);
					vHiddenName.appendTo(vParentSubmitDiv);
					vIndex++;
				});
				// 为父画面div赋值
				window.parent.$("#dispDepartment").html(vDispMsg);
				clolse();
			}
		});
	});
	function createHidden() {
		var vHidden = $("<input>", {type : 'hidden'});
		return vHidden;
	}
	function clolse() {
		window.parent.$('#myPopupFrame').dialog().dialog('close');
		window.parent.$('#myPopupFrame').dialog = null;
	}
</script>
<body>
	<s:form theme="simple">
		<div align="center">
			<!--
		   <s:checkboxlist name="departmentId" list="departmentMap"
		    listKey="key" listValue="value"  />
		    -->
			<s:iterator value="departmentMap" id="element" status="stt">
				<s:checkbox name="departmentId" fieldValue="%{#element.key}" />
				<label id="departmentLabel_<s:property value="#element.key" />"><s:property value="#element.value" /></label>
				<br>
			</s:iterator>
			<br>
			<br>
			<input type="button" value="设置" id="setBtn">
		</div>
	</s:form>
</body>
</html>
