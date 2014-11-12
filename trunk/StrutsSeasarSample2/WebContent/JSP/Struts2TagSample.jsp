<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Struts2标签用法示例</title>
<sx:head parseContent="true" />
</head>
<body>
	<s:a action="menu">回主菜单</s:a>
	<hr size="3" color="red">
	更多的标签说明可以参考我的blog:
	<a href="Struts2">http://blog.sina.com.cn/s/blog_57769b7b0100tkai.html">Struts2的标签库－UI标签</a>
	<br>
	<br> Struts 2.2 Tags
	<br />
	<br /> 一、控制标签
	<br />
	<hr size="3" color="red">
	#、if /elseif/ else @用于逻辑判断
	<br />
	<s:set name="bir" value="-12"></s:set>
	<s:if test="#bir>=180 || #bir<0">
       你是何方妖怪？
    </s:if>
	<s:elseif test="#bir<=18 && #bir>=0">
       未成年人不能进入！
    </s:elseif>
	<s:elseif test="#bir<=60 && #bir>=18">
       您已经成年！
    </s:elseif>
	<s:else>
       您已经老了！
    </s:else>
	<br />--------------------------------------------------------------
	<br /> #、append @用于将多个集合合并
	<br />
	<s:set name="appList1" value="{'111','222','333','444'}"></s:set>
	<s:set name="appList2" value="{'aaa','bbb','ccc','ddd'}"></s:set>
	<s:append var="newAppList">
		<s:param value="appList1"></s:param>
		<s:param value="appList2"></s:param>
	</s:append>
	<s:iterator value="#newAppList">
		<s:property /> |
    </s:iterator>
	<br />--------------------------------------------------------------
	<br /> #、generator
	<br />
	generator标签，该标签可以将指定字符串按指定分隔符分割成多个字串。生成的多个字串可以用iterator标签进行迭代输出。可以这么理解：generator标签将一个字符串转换成一个List集合。在该标签体内，整个临时生成的集合将为Valuestack的顶端，但一旦该标签结束，生成的集合将被移除Valuestack。generator标签有如下几个属性：
	<br /> 1、count属性：指定生成集合中元素的总数。可选属性。
	<br /> 2、val属性：必填属性，指定被解析的字符串。
	<br /> 3、separator属性：这是一个必填属性，指定用于分割字符串的分隔符。
	<br />
	4、converter属性：可选属性，指定一个转换器，转换器负责将生成的集合中的每个字符串转换成对象，通过这个转换器可以将一个含有分隔符的字符串解析成对象的集合。转换器必须一个继承org.apache.struts2.util.IteratorGenerator.Converter的对象。
	<br />
	5、var属性，可选属性。如果指定了该属性，则将生成的集合保存在StackContext中。如果不指定该属性，则将生成的集合放入ValueStack的顶端，该标签一结束，生成的集合就被移除。该属性也可替换成id。
	<br />
	<s:generator val="'aaa,bbb,ccc,ddd'" separator="," count="2">
		<s:iterator>
			<s:property />
		</s:iterator>
	</s:generator>
	<br />
	<br />--------------------------------------------------------------
	<br /> #、iterator 用于迭代数据
	<br />
	<s:set name="iterList"
		value="{'aaa','bbb','ccc','ddd','eee','fff','test'}"></s:set>
	<table border="1">
		<tr>
			<td>索引</td>
			<td>值</td>
			<td>奇数</td>
			<td>偶数</td>
			<td>首個</td>
			<td>尾個</td>
			<td>当前迭代数量</td>
		</tr>
		<s:iterator value="#iterList" begin="1" status="s">
			<tr bgcolor="<s:if test="#s.odd">pink</s:if>">
				<td><s:property value="#s.index" /></td>
				<td><s:property /></td>
				<td><s:property value="#s.even" /></td>
				<td><s:property value="#s.odd" /></td>
				<td><s:property value="#s.first" /></td>
				<td><s:property value="#s.last" /></td>
				<td><s:property value="#s.count" /></td>
			</tr>
		</s:iterator>
	</table>
	<br />--------------------------------------------------------------
	<br /> #、sort @用于排序
	<br />
	<%--  
	<s:bean var="myComparator" name="leo.test.MyComparator"></s:bean>
	<s:sort comparator="#myComparator" source="{1,45,56,0,345,3}">
		<s:iterator>
			<s:property />,
        </s:iterator>
	</s:sort>
	--%>
	<br />--------------------------------------------------------------
	<br /> #、subset @用户截取集合中的子集; 注：decider:可选属性,指定由开发者自己决定是否选中该元素.
	<br />
	<s:set name="subList" value="{'@@@','***','&&&','###'}"></s:set>
	<s:subset source="#subList" start="1" count="2">
		<s:iterator>
			<s:property />,
        </s:iterator>
	</s:subset>
	<br />--------------------------------------------------------------
	<br />
	<font color="blue"><b>token标签</b> </font>
	<br />token标签是用于防止多次提交的标签。避免了刷新页面时多次提交，如果需要该标签起作用，则应该在Struts2的配置文件中启用TokenInterceptor拦截器或TokenSessionStoreInterceptor拦截器。
	token标签的实现原理是在表单中拉架一个隐藏域，每次加载该页面时，该隐藏域的值都不相同。而TokenInterceptor拦截器则拦截所有用户请求，如果两次请求时该隐藏域的值相同，则阻止表单提交。
	<br> 使用该标签很简单，如下代码：
	<br>
	<font color="red"> &lt;h3&gt;使用s:token防止重复提交&lt;/h3&gt;<br>
		&lt;s:form&gt;<br> &lt;s:token/&gt;<br> &lt;/s:form&gt;<br>
	</font> 从访问后产生的HTML页面的源代码可以看到如下HTML代码：
	<br> &lt;input type=&quot;hidden&quot;
	name=&quot;struts.token.name&quot; value=&quot;struts.token&quot;/&gt;
	<br> &lt;input type=&quot;hidden&quot;
	name=&quot;struts.token&quot;
	value=&quot;NUM1WVZQO3QTGKNZAKD7OA7C2YKWULVJ&quot;/&gt;
	<br>
	<br />
	<br />--------------------------------------------------------------
	<br />
	<br /> 二、数据标签
	<hr size="3" color="red">
	<br />--------------------------------------------------------------
	<br /> #、date @用于格式化日期
	<br />
	<s:set name="dt" value="new java.util.Date()"></s:set>
	当期系统时间是：
	<s:date name="dt" format="yyyy-MM-dd HH:ss:mm" />
	<br />--------------------------------------------------------------
	<br /> #、debug @用于调试程序，让开发人员一目了然的知道当前请求、值栈、栈中的各项参数
	<br />
	<s:debug />
	<br />--------------------------------------------------------------
	<br /> #、set @用户声明对象或属性
	<br />--------------------------------------------------------------
	<br />
	<br />
	<br /> 三、UI标签
	<br />
	<hr size="3" color="red">
	<s:form>
    #、<font color="blue"><b>checkboxlist @复选框列表</b> </font>
		<br>
         1> .list 生成；~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
        name:checkboxlist的名字<br>
        list:checkboxlist要显示的列表<br>
        value:checkboxlist默认被选中的选项,checked=checked<br>
		<s:checkboxlist theme="simple" name="checkbox1"
			list="{'上网','看书','爬山','游泳','唱歌'}" value="{'上网','看书'}"></s:checkboxlist>
		<br>
		<br>
        2> .Map 生成；~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
        name:checkboxlist的名字<br>
        list:checkboxlist要显示的列表<br>
        listKey:checkbox 的value的值<br>
        listValue:checkbox 的lablel(显示的值)<br>
        value:checkboxlist默认被选中的选项,checked=checked<br>
		<s:checkboxlist theme="simple" name="checkbox2" label="请选择爱好"
			labelposition="top" list="#{1:'上网',2:'看书',3:'爬山',4:'游泳',5:'唱歌'}"
			listKey="key" listValue="value" value="{1,2,5}"></s:checkboxlist>
		<br />
		<br />-------------------------------------------------------------------------------<br />
		<br />
     #、<font color="blue"><b>combobox</b> </font>
		<br />
        用户可以自行输入，可也以选择下面的checkbox中的内容来进行输入。<br>
        需要注意的是，此时的下拉列表仅仅是用于辅助输入的，并没有任何实际意义，因此不能指定它的listKey和listValue属性。<br>
		<s:combobox theme="simple" label="选择你喜欢的颜色" name="colorNames"
			headerValue="------请选择------" headerKey="1"
			list="{'红','橙','黄','绿','青','蓝','紫'}" />
		<br />
		<br />-------------------------------------------------------------------------------<br />
		<br />
     #、<font color="blue"><b>radio @单选框</b> </font>
		<br />
                      这个与checkboxlist差不多；<br>
        1>.如果集合为list：
        <s:radio theme="simple" name="sexList" list="{'男','女'}"></s:radio>
		<br>
        2>.如果集合为map：
        <s:radio theme="simple" name="sexMap"
			list="#{1:'上网',2:'看书',3:'爬山',4:'游泳',5:'唱歌'}" listKey="key"
			listValue="value" value="3"></s:radio>
		<br />
		<br />-------------------------------------------------------------------------------<br />
		<br />
     #、<font color="blue"><b>select @下拉列表框</b> </font>
		<br />
        这个与s:checkboxlist差不多；<br>
        1>.如果集合为list：
        <s:select theme="simple" name="sexList" list="{'男','女'}"></s:select>
		<br>
        2>.如果集合为map：
        <s:select theme="simple" name="sexMap"
			list="#{1:'上网',2:'看书',3:'爬山',4:'游泳',5:'唱歌'}" listKey="key"
			listValue="value" headerKey="0" headerValue="请选择" value="4"></s:select>
		<br />
		<br />-------------------------------------------------------------------------------<br />
		<br />
     #、<b>doubleselect @级联菜单 </b>
		<br />
        doubleselect标签会生成一个级联列表框(两个下拉列表框)，当选择第一个下拉列表框时，第二个下拉列表框中的内容会随之改变。<br>
		<!--   可以用直接指定，当然也可以跟数据库绑定的 -->
		<s:set name="proviList" value="{'江西省','湖北省'}"></s:set>
		<s:set name="jxList" value="{'南昌市','赣州市','九江市','上饶市','鹰潭市'}"></s:set>
		<s:set name="hbList" value="{'武汉市','恩施市','十堰市','荆州市','襄樊市'}"></s:set>
		<s:doubleselect theme="simple" name="provi"
			doubleList="top=='江西省' ? #jxList : #hbList" list="#proviList"
			doubleName="city"></s:doubleselect>
		<br>
		<br>
        默认情况下，第一个下拉列表框只支持两项，如果超过两项则不能这样处理。<br>
        我们可以先定义一个Map对象，该Map对象的value都是list，<br>
        这样就能以Map对象的多个key创建一个下拉列表框的列表项，而每个key对应的集合则用于创建第二个下拉列表框的列表项。<br>
		<s:set name="bs"
			value="#{'李': {'Spring2.0', 'J2EE','Ajax'},'David': {'JavaScript: The Definitive Guide'},'Johnson': {'Expert One-on-One J2EE Design and Development'}}" />
		<s:doubleselect theme="simple" label="请选择您喜欢的图书" name="author"
			list="#bs.keySet()" doubleList="#bs[top]" doubleName="book" />
		<br />
		<br />-------------------------------------------------------------------------------<br />
		<br />
     #、<b>optiontransferselect</b>
		<br />
         optiontransferselect标签会创建两个选项用来转移下拉列表项，该标签会生成两个&lt;select&gt;标签，并且会生成系列的按钮，<br>
         这系列的按钮可以控制选项在两个下拉列表之间移动，升降，当提交该表单时，两个&lt;select&gt;标签的请求参数都会被提交<br>
		<s:optiontransferselect theme="simple" label="change" name="abc"
			doubleList="{'111','222','333','444'}"
			list="{'aaa','bbb','ccc','ddd'}" doubleName="number"></s:optiontransferselect>
		<br>
		<br>
		<s:optiontransferselect label="请选择你喜欢的图书" name="cnbook"
			leftTitle="中文图书：" rightTitle="外文图书"
			list="{'Spring2.0','J2EE','Ajax'}" multiple="true"
			addToLeftLabel="向左移动" selectAllLabel="全部选择" addAllToRightLabel="全部右移"
			headerKey="cnKey" headerValue="--- 选择中文图书 ---" emptyOption="true"
			doubleList="{'Expert One-on-One J2EE Design and Development', 'JavaScript: The Definitive Guide'}"
			doubleName="enBook" doubleHeaderKey="enKey"
			doubleHeaderValue="--- 选择外文图书 ---" doubleEmptyOption="true"
			doubleMultiple="true" />
		<br />
		<br />-------------------------------------------------------------------------------<br />
		<br />
     #、<b>updownselect @可上下选择的select</b>
		<br />
		<s:updownselect label="selectCity" emptyOption="true"
			name="selectCity" list="#jxList"
			headerValue="-Please Select The City-" headerKey="-1"></s:updownselect>
		<br>
		<s:updownselect name="b" label="请选择您想选择出版日期" labelposition="top"
			moveDownLabel="向下移动"
			list="#{'Spring2.0':'2006年10月' , 'J2EE':'2007月4月' , 'Ajax':'2007年6月'}"
			listKey="key" emptyOption="true" listValue="value" />
		<br />
		<br />-------------------------------------------------------------------------------<br />
		<br />
     #、<b>optgroup标签</b>
		<br />
        optgroup标签用于生成一个下拉列表框的选项组，因此，该标签必须放在&lt;s:select&gt;标签中使用，<br>
        一个下拉列表框中可以包含多个选项组，因此可以在一个&lt;s:select&gt;标签中使用多个&lt;s:optgroup&gt;标签。<br>
		<s:select label="选择您喜欢的图书" name="book"
			list="#{'Spring2.0':'李刚','J2EE':'李','Ajax宝典':'李'}" listKey="value"
			listValue="key">
			<s:optgroup label="Rod Johnson"
				list="#{'Expert One-on-One J2EE Design and Development':'Johnson'}"
				listKey="value" listValue="key" />
			<s:optgroup label="David Flanagan"
				list="#{'JavaScript: The Definitive Guide':'David'}" listKey="value"
				listValue="key" />
		</s:select>
		<br />
		<br />-------------------------------------------------------------------------------<br />
		<br />
     #、<font color="blue"><b>sx:datetimepicker @日期选择控件</b> </font>
		<br />
             使用步骤：声明：我这里用的是strut 2.1.8.1,在struts2.0的版本中可能有所不同；<br />
            1.导入struts2-dojo-plugin-2.1.8.1.jar DoJo 插件包；<br />
            2. 导入标签：&lt;%@ taglib prefix="sx" uri="/struts-dojo-tags"%&gt;<br />
            3.在需要使用的页面中的head标签之间加上&lt;sx:head parseContent="true" /&gt;<br />
            1.默认<br>
		<sx:datetimepicker label="birthday" name="bir" value="#dt"></sx:datetimepicker>
		<br>
            2.格式化<br>
		<sx:datetimepicker label="购买日期" name="buyDay"
			displayFormat="yyyy年MM月dd日"></sx:datetimepicker>
		<br>
            3.指定了weekStartsOn属性<br>
		<sx:datetimepicker label="购买日期" name="buyDay"
			displayFormat="yyyy年MM月dd日" weekStartsOn="2"></sx:datetimepicker>
		<br>
		<br />
		<br />-------------------------------------------------------------------------------<br />
		<br />
     #、sx:tabbedpanel @选项卡控件 <br />
		<!-- tabbedpanel标签 -->
		<!-- 最简单的选项卡，两个选项卡加载都是本页面 -->
		<hr color="blue">
		<b>最简单的选项卡：</b>
		<br>
		<sx:tabbedpanel id="tab1" beforeSelectTabNotifyTopics="/beforeSelect">
			<sx:div label="Tab 1">
                 Local Tab 1
             </sx:div>
			<sx:div label="Tab 2">
                 Local Tab 2
             </sx:div>
		</sx:tabbedpanel>
		<!-- 加载其他页面的选项卡 -->
		<hr color="blue">
		<b>加载其他页面的选项卡：</b>
		<br>
		<sx:tabbedpanel id="tab2">
			<sx:div label="Remote Tab 1" href="JSP/Index.jsp">
                     Remote Tab 1
                </sx:div>
			<sx:div label="Remote Tab 2" href="JSP/Result.jsp">
                     Remote Tab 1
                </sx:div>
		</sx:tabbedpanel>
		<!-- 设置选项卡底下的内容懒加载，即等需要的时候再加载，使用属性preload="false"-->
		<hr color="blue">
		<b>设置选项卡底下的内容懒加载，即等需要的时候再加载，使用属性preload="false"：</b>
		<br>
		<sx:tabbedpanel id="tab3">
			<sx:div label="Remote Tab 1" href="JSP/Index.jsp">
                 Remote Tab 1
             </sx:div>
			<sx:div label="Remote Tab 2" href="JSP/Result.jsp" preload="false">
                 Remote Tab 1
             </sx:div>
		</sx:tabbedpanel>
		<!-- 固定大小的选项卡 -->
		<hr color="blue">
		<b>固定大小的选项卡,使用属性cssStyle和doLayout：</b>
		<br>
		<sx:tabbedpanel cssStyle="width: 200px; height: 100px;"
			doLayout="true" id="tab4">
			<sx:div label="Tab 1">
                 Local Tab 1
             </sx:div>
			<sx:div label="Tab 2">
                 Local Tab 2
             </sx:div>
		</sx:tabbedpanel>
		<!-- 每次点击选项卡时都重新刷新内容 -->
		<hr color="blue">
		<b>每次点击选项卡时都重新刷新内容，使用属性refreshOnShow：</b>
		<br>
		<sx:tabbedpanel id="tab5">
			<sx:div label="Remote Tab 1" href="JSP/Index.jsp"
				refreshOnShow="true">
                 Remote Tab 1
             </sx:div>
			<sx:div label="Remote Tab 2" href="JSP/Result.jsp"
				refreshOnShow="true">
                 Remote Tab 2
             </sx:div>
		</sx:tabbedpanel>
		<!-- 使得其中一个选项卡失效 -->
		<hr color="blue">
		<b>使得其中一个选项卡失效：</b>
		<br>
		<sx:tabbedpanel id="tab6">
			<sx:div label="Tab 1">
                Local Tab 1
            </sx:div>
			<sx:div label="Tab 2" disabled="true">
                Local Tab 2
            </sx:div>
		</sx:tabbedpanel>

		<!-- 设置选项卡在底部显示 (可以是: top, right, bottom, left) -->
		<hr color="blue">
		<b>设置选项卡在底部显示 (可以是: top, right, bottom, left)：</b>
		<br>
		<sx:tabbedpanel id="tab7" labelposition="bottom"
			cssStyle="width:200px;height:100px;" doLayout="true">
			<sx:div label="Tab 1">
                 Local Tab 1
             </sx:div>
			<sx:div label="Tab 2">
                 Local Tab 2
             </sx:div>
		</sx:tabbedpanel>
		<!-- 设置选项卡允许关闭，使用属性closeable -->
		<hr color="blue">
		<b>设置选项卡允许关闭，使用属性closeable：</b>
		<br>
		<sx:tabbedpanel id="tab8">
			<sx:div label="Tab 1">
                 Local Tab 1
             </sx:div>
			<sx:div label="Tab 2" closable="true">
                 Local Tab 2
             </sx:div>
		</sx:tabbedpanel>
		<br />--------------------------------------------------------------<br />
     #、sx:textarea @textarea控件 <br />
		<sx:textarea label="简介"
			value="sx:textarea test<br> aaaaaaaaaaaaabbbbbbb<br>ccccccccccccccddddddddddddd<br>eeeeeeeeeeeffffffffff"></sx:textarea>
		<br />--------------------------------------------------------------<br />
     #、sx:tree @树控件 <br />
		<sx:tree id="tree1" label="根节点">
			<sx:treenode id="tn1" label="财务部" />
			<sx:treenode id="tn2" label="开发部">
				<sx:treenode id="tn3" label="JAVA">
					<sx:treenode id="tn4" label="Struts2" />
					<sx:treenode id="tn5" label="Spring" />
					<sx:treenode id="tn5" label="SeaSar2" />
				</sx:treenode>
				<sx:treenode id="tn6" label=".NET" />
			</sx:treenode>
			<sx:treenode id="tn7" label="人事部" />
		</sx:tree>
	</s:form>
</body>
</html>
