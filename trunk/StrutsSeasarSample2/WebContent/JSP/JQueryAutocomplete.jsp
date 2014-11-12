<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/Struts2Seasar2Sample/CSS/jquery-ui-1.8.16.redmond.css" />
<script type="text/javascript" src="/Struts2Seasar2Sample/JS/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="/Struts2Seasar2Sample/JS/jquery-ui-1.8.16.min.js"></script>
<title>jQuery UI Autocomplete AJAX 示例</title>
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

		var availableTags = [ "ActionScript", "AppleScript",
				"Asp", "BASIC", "C", "C++", "Clojure", "COBOL",
				"ColdFusion", "Erlang", "Fortran", "Groovy",
				"Haskell", "Java", "JavaScript", "Lisp",
				"Perl", "PHP", "Python", "Ruby", "Scala",
				"Scheme" ];
		
		$("#tagTxt1").autocomplete({source : availableTags });

		$("#tagTxt2").autocomplete({
			source : function(request, response) {
				$.ajax({
					type : 'POST',
					url : 'jQueryAutocomplete!getAjaxJSON.action',
					data : {
						maxRows : 12,
						inputVal : request.term
					},
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					dataType : 'json',
					success : function(result) {
						response($.map(result, function(eachElement) {
							return {
								label : eachElement.rst_id + " --> " + eachElement.rst_name,
								value : eachElement.rst_name
							}
						}));
					},
					error : function(obj, err) {
						alert("ajax is failed.");
					}
				});
			},
			minLength : 1,
			select : function(event, ui) {
				log(ui.item ? "Selected: " + ui.item.label : "Nothing selected, input was " + this.value);
			},
			open : function() {
				$(this).css("background-color", "#fff8dc");
			},
			close : function() {
				$(this).css("background-color", "");
			}
		});

		function log(message) {
			$("<div/>").text(message).prependTo("#tagTxt2log");
			$("#tagTxt2log").scrollTop(0);
		}
	});
</script>
<body>
	<div align="center">
	<br>
	<s:a action="menu.action">回主菜单</s:a>
	<hr size="3" color="red">
		<table cellpadding="3" border="1">
			<tr>
				<td>1.js定义资源</td>
				<td>Tags: <input type="text" id="tagTxt1">
				</td>
			</tr>
			<tr>
				<td>2.访问ajax取得资源</td>
				<td>Tags: <input type="text" id="tagTxt2"><br>
					<div class="ui-widget" style="margin-top: 2em; font-family: Arial">
						Result:
						<div id="tagTxt2log" style="height: 200px; width: 300px; overflow: auto;" class="ui-widget-content"></div>
					</div>
				</td>
			</tr>
		</table>
		<br> <br> <a href="http://jqueryui.com/demos/autocomplete/">更多请参照jQuery主页</a>
	</div>
</body>
</html>
