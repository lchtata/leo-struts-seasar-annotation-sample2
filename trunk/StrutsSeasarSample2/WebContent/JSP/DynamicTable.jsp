<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/Struts2Seasar2Sample/CSS/common.css" />
<script type="text/javascript" src="/Struts2Seasar2Sample/JS/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="/Struts2Seasar2Sample/JS/prototype.js"></script>
<title>jQuery + Prototype 实现动态加载 table 和 添加行，删除行</title>
</head>
<script language="javascript" type="text/javascript">
	//jQuery名称冲突解决 - 替换$为jq
	var jq = jQuery.noConflict();
	// 定义数据保存的Class - TABLE_DATA_CLASS
	var TABLE_DATA_CLASS = Class.create();
	TABLE_DATA_CLASS.prototype = {
		// 构造方法
		initialize : function() {
		},
		// 测试ID
		testId : 'test 00001',
		// table1的数据，直接赋值
		tblData1 : {
			tableId : 'table001',
			trDataList : [ {
				id : '001',
				name : '张三',
				hobbyList : [ {
					hobby : '足球'
				}, {
					hobby : '篮球'
				}, {
					hobby : '排球'
				} ]
			}, {
				id : '002',
				name : '李四',
				hobbyList : [ {
					hobby : '台球'
				}, {
					hobby : '乒乓球'
				}, {
					hobby : '旱冰'
				} ]
			} ]
		},
		// table2的数据，之后循环赋值
		tblData2 : {
			tableId : 'table002',
			trDataList : []
		},
		tblData3 : []
	}
	// 定义数据保存的Class结束
	// 定义tr操作的Class - TR_WORK_CLASS
	var TR_WORK_CLASS = Class.create();
	TR_WORK_CLASS.prototype = {
		// 构造方法
		initialize : function(pId, pName, pHobbyDetail) {
			this.id = pId;
			this.name = pName;
			this.hobbyDetail = pHobbyDetail;
		},
		id : null,
		name : null,
		hobbyDetail : null,
		createTr : function() {
			var tr = jq('<tr></tr>');
			return tr;
		},
		createTd : function() {
			var tr = jq('<td></td>');
			return tr;
		},
		createButton : function(pBtnId) {
			var vButton = jq("<input>", {
				type : 'button',
				id : 'delBtn' + pBtnId,
				name : 'delBtn' + pBtnId,
				value : '删除'
			});
			return vButton;
		},
		getResultTr : function() {
			var tdDel = this.createTd();
			var delBtn = this.createButton(this.id).toggleClass('btn');
			delBtn.click(function() {
				delRow(jq(this));
			});
			delBtn.appendTo(tdDel);
			var tdId = this.createTd();
			tdId.html(this.id);
			var tdname = this.createTd();
			tdname.html(this.name);
			var tdhobby = this.createTd();
			tdhobby.html(this.hobbyDetail);
			var vResultTr = this.createTr();
			tdDel.appendTo(vResultTr);
			tdId.appendTo(vResultTr);
			tdname.appendTo(vResultTr);
			tdhobby.appendTo(vResultTr);
			return vResultTr;
		}
	}
	// 定义tr操作的Class结束
	// 实例化定义数据保存的Class
	var vWorkData = new TABLE_DATA_CLASS();
	var vIndex = 0;
	// 为vWorkData对象里面的 [tblData2] 赋值
	for (vIndex = 3; vIndex < 10; vIndex++) {
		vTrData = {
			id : '00' + vIndex,
			name : '名字' + vIndex,
			hobbyList : [ {
				hobby : '足球' + vIndex
			}, {
				hobby : '篮球' + vIndex
			}, {
				hobby : '排球' + vIndex
			} ]
		}
		// 为vWorkData对象里面的 [tblData2] 赋值
		vWorkData.tblData2.trDataList.push(vTrData);
	}
	function delRow(pDelBtn) {
		var vTaretTbody = pDelBtn.parent().parent().parent();
		if (vTaretTbody.find("tr").length < 4) {
			alert("剩下最后一行了,无法删除!");
			return false;
		}
		var vTargetTr = pDelBtn.parent().parent();
		vTargetTr.remove();
	}
	function addRow(pNode) {
		var newIndex = vIndex++;
		var vId = '00' + newIndex;
		var vName = '名字' + newIndex;
		var vHobbyDetail = '足球' + newIndex + ", " + '篮球' + newIndex + ", "
				+ '排球' + newIndex;
		// 实例化tr操作的Class
		var vTrWork = new TR_WORK_CLASS(vId, vName, vHobbyDetail);
		var vResultTr = vTrWork.getResultTr();
		// 在[添加button的tr]之前加入新建的tr
		var vAddTr = pNode.parent().parent();
		vResultTr.insertBefore(vAddTr);
		jq('#idx_div').html(vIndex);
	}
	// jQuery Onload
	jq(document).ready(function() {
		jq("#btn1").click(function() {
			jq(".class_p_info").hide();
		});
		jq("#btn2").click(function() {
			jq(".class_p_info").show();
		});
		jq("#tbl1_addBtn").click(function() {
			addRow(jq(this));
		});
		jq("#tbl2_addBtn").click(function() {
			addRow(jq(this));
		});
		// 生成table1的数据
		//alert(vWorkData.tblData1.tableId + "create start");
		for ( var i = 0; i < vWorkData.tblData1.trDataList.length; i++) {
			var vId = vWorkData.tblData1.trDataList[i].id;
			var vName = vWorkData.tblData1.trDataList[i].name;
			var vHobbyList = vWorkData.tblData1.trDataList[i].hobbyList;
			var vHobbyDetail = "";
			for ( var j = 0; j < vHobbyList.length; j++) {
				var vElement = vHobbyList[j].hobby;
				if (j > 0) {
					vHobbyDetail += ", ";
				}
				vHobbyDetail += vElement;
			}
			// 实例化tr操作的Class
			var vTrWork = new TR_WORK_CLASS(vId, vName, vHobbyDetail);
			var vResultTr = vTrWork.getResultTr();
			// 得到[添加button的tr]
			var vAddTr = jq('#tbl1_add_tr');
			// 在[添加button的tr]之前加入新建的tr
			vResultTr.insertBefore(vAddTr);
		}
		//alert(vWorkData.tblData1.tableId + "create end");
		// 生成table2的数据
		//alert(vWorkData.tblData2.tableId + "create start");
		for ( var i = 0; i < vWorkData.tblData2.trDataList.length; i++) {
			var vId = vWorkData.tblData2.trDataList[i].id;
			var vName = vWorkData.tblData2.trDataList[i].name;
			var vHobbyList = vWorkData.tblData2.trDataList[i].hobbyList;
			var vHobbyDetail = "";
			for ( var j = 0; j < vHobbyList.length; j++) {
				var vElement = vHobbyList[j].hobby;
				if (j > 0) {
					vHobbyDetail += ", ";
				}
				vHobbyDetail += vElement;
			}
			// 实例化tr操作的Class
			var vTrWork = new TR_WORK_CLASS(vId, vName, vHobbyDetail);
			var vResultTr = vTrWork.getResultTr();
			// 得到[添加button的tr]
			var vAddTr = jq('#tbl2_add_tr');
			// 在[添加button的tr]之前加入新建的tr
			vResultTr.insertBefore(vAddTr);
		}
		//alert(vWorkData.tblData2.tableId + "create end");
		// index表示
		jq('#idx_div').html(vIndex);
	});
</script>
<body>
	<s:a action="menu.action">回主菜单</s:a>
	<hr>
	<h2>jQuery测试用</h2>
	<p class="class_p_info">This is a paragraph.</p>
	<p class="class_p_info">This is another paragraph.</p>
	<button type="button" id="btn1">hide</button>
	<button type="button" id="btn2">show</button>
	<hr>
	<h2>从Prototype的Class中取出数据，利用jQuery动态生成table</h2>
	<h3>
		<div>生成ID的index:</div>
		<div id="idx_div" style="color: red;"></div>
	</h3>
	<h3>table1</h3>
	<table id="tbl1" border="1" bordercolor="blue">
		<tr>
			<th style="background-color: #fff8dc;">操作</th>
			<th style="background-color: #fff8dc;">ID</th>
			<th style="background-color: #fff8dc;">名字</th>
			<th style="background-color: #fff8dc;">爱好</th>
		</tr>
		<tr id="tbl1_add_tr">
			<td colspan="4" align="right"><input type="button"
				id="tbl1_addBtn" name="tbl1_addBtn" class="btn" value="添加" /></td>
		</tr>
	</table>
	<br>
	<h3>table2</h3>
	<table id="tbl2" border="1" bordercolor="blue">
		<tr>
			<th style="background-color: #fff8dc;">操作</th>
			<th style="background-color: #fff8dc;">ID</th>
			<th style="background-color: #fff8dc;">名字</th>
			<th style="background-color: #fff8dc;">爱好</th>
		</tr>
		<tr id="tbl2_add_tr">
			<td colspan="4" align="right"><input type="button"
				id="tbl2_addBtn" name="tbl2_addBtn" class="btn" value="添加" /></td>
		</tr>
	</table>
</body>
</html>
