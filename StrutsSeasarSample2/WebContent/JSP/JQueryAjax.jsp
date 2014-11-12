<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/Struts2Seasar2Sample/JS/jquery-1.6.2.min.js"></script>
<title>jQuery AJAX 例子 (JSON)</title>
</head>
<script language="JavaScript" type="text/javascript">
	//jQuery Onload
	$(document).ready(function() {
		$("#jqAjaxBtn").click(function() {
			doGetJQueryAjax();
		});
	});
	//定义JSON数据
	var tableData = {
		tableId : 'table001',
		trDataList : [ 
			{
				id : '001',
				name : '张三',
				hobbyList : [
					{
						hobby : '足球'
					},
					{
						hobby : '篮球'
					},
					{
						hobby : '排球'
					}
				]
			},
			{
				id : '002',
				name : '李四',
				hobbyList : [
				{
					hobby : '台球'
				},
				{
					hobby : '乒乓球'
				},
				{
					hobby : '旱冰'
				} ]
			}
		]
	}
	// ajax
	function doGetJQueryAjax() {
		//var vJsonData = {'tableId'    : tableData.tableId,
		//                 'trDataList'  : tableData.trDataList};
		$.ajax({
			type : 'POST',
			url : 'jQueryAjax!getAjaxJSON.action',
			data : {
				'submitData' : tableData
			},
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : 'json',
			success : function(result) {
				if (result.returnCode == 1) {
					alert("ajax success is scuess.");
					var vResultTableData = result.returnData;
					var vDebugMsg = "";
					vDebugMsg += "tableId:" + vResultTableData.tableId + "\r\n";
					var vtrDataList = vResultTableData.trDataList;
					for ( var i = 0; i < vtrDataList.length; i++) {
						var vTrId = vtrDataList[i].id;
						var vStuName = vtrDataList[i].name;
						var vHobbyList = vtrDataList[i].hobbyList;
						vDebugMsg += "tr id:" + vTrId;
						vDebugMsg += "  |  student name:" + vStuName;
						vDebugMsg += "  |   student hobby:";
						var vHobbyDetail = "";
						for ( var j = 0; j < vHobbyList.length; j++) {
							var vHobby = vHobbyList[j].hobby;
							vHobbyDetail += vHobby;
							vHobbyDetail += ",";
						}
						vDebugMsg += vHobbyDetail;
						vDebugMsg += "\r\n";
					}
					alert(vDebugMsg);
				} else {
					alert("ajax success is failed.");
				}
			},
			error : function(obj, err) {
				alert("ajax is failed.");
			}
		});
	}

	jQuery.extend({
		// Serialize an array of form elements or a set of
		// key/values into a query string
		param : function(a, traditional) {
			var s = [];
			// Set traditional to true for jQuery <= 1.3.2 behavior.
			if (traditional === undefined) {
				traditional = jQuery.ajaxSettings.traditional;
			}
			// If an array was passed in, assume that it is an array of form elements.
			if (jQuery.isArray(a) || a.jquery) {
				// Serialize the form elements
				jQuery.each(a, function() {
					add(this.name, this.value);
				});
			} else {
				// If traditional, encode the "old" way (the way 1.3.2 or older
				// did it), otherwise encode params recursively.
				for ( var prefix in a) {
					buildParams(prefix, a[prefix]);
				}
			}
			// Return the resulting serialization
			return s.join("&").replace(/ /g, "+");
			function buildParams(prefix, obj) {
				if (jQuery.isArray(obj)) {
					// Serialize array item.
					jQuery.each(obj, function(i, v) {
						if (traditional || /\[\]$/.test(prefix)) {
							// Treat each array item as a scalar.
							add(prefix, v);
						} else {
							// If array item is non-scalar (array or object), encode its
							// numeric index to resolve deserialization ambiguity issues.
							// Note that rack (as of 1.0.0) can't currently deserialize
							// nested arrays properly, and attempting to do so may cause
							// a server error. Possible fixes are to modify rack's
							// deserialization algorithm or to provide an option or flag
							// to force array serialization to be shallow.
							buildParams(prefix
									+ "["
									+ (typeof v === "object"
											|| jQuery.isArray(v) ? i : "")
									+ "]", v);
						}
					});
				} else if (!traditional && obj != null
						&& typeof obj === "object") {
					// Serialize object item.
					jQuery.each(obj, function(k, v) {
						//                    buildParams( prefix + "[" + k + "]", v );
						buildParams(prefix + "." + k + "", v);
					});
				} else {
					// Serialize scalar item.
					add(prefix, obj);
				}
			}
			function add(key, value) {
				// If value is a function, invoke it and return its value
				value = jQuery.isFunction(value) ? value() : value;
				s[s.length] = encodeURIComponent(key) + "="
						+ encodeURIComponent(value);
			}
		}
	});
</script>
<body>
	<div align="center">
		<h2>我的JQuery Ajax测试JSP</h2>
		<input type="button" id="jqAjaxBtn" value="点击开始测试" />
		<div></div>
		<br>
		<s:a action="menu.action">回主菜单</s:a>
	</div>
</body>
</html>