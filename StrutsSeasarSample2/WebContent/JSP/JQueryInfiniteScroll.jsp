<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="/Struts2Seasar2Sample/JS/jquery-1.6.2.min.js"></script>
<script type="text/javascript"
	src="/Struts2Seasar2Sample/JS/jquery.infinitescroll.js"></script>
<title>jQuery Infinite Scroll 测试</title>
</head>
<script language="JavaScript" type="text/javascript">
//jQuery Onload
$(document).ready(function() {
	alert("请用鼠标中间的滑轮滑到页面下方.");
	$('#content').infinitescroll({
		navSelector  	: "a#next:last", // 分页导航的选择器(成功后隐藏)
		nextSelector 	: "a#next:last", // 需要点击的下一页链接的选择器
		itemSelector 	: "#content p", // 返回后文章对应的插入位置
		debug		 	: true,
		loadingImg      : "/Struts2Seasar2Sample/IMAGE/loading.gif", // 加载图片路径
		msgText     : "加载中,请稍后.............", // 显示的提示文字
		animate         : true, // 加载完毕是否采用动态效果
		extraScrollPx   : 150, // 向下滚动的像素，必须开启动态效果(上面的[animate=true])
		donetext        : "后面没有了内容了 :( ", // 返回404，即到头了显示的文字
		bufferPx        : 40, // 加载速度(默认40)如果增加这个数字意味着用户将无法看到加载信息
		errorCallback   : function () { alert("infinitescroll errorCallback!!!"); }
	}, function(arrayOfNewElems){
		alert(arrayOfNewElems);
	});
});
</script>
<body>
	<div align="center">

		<div id="content">

			<h1>jQuery Infinite Scroll 测试(这是一个半成品,因为资料太少,没有完成!)<font color="red">现在读取的第2页是WebContent下的index2.html</font></h1>

			<p>One for all and all for one, Muskehounds are always ready. One
				for all and all for one, helping everybody. One for all and all for
				one, it's a pretty story. Sharing everything with fun, that's the
				way to be. One for all and all for one, Muskehounds are always
				ready. One for all and all for one, helping everybody. One for all
				and all for one, can sound pretty corny. If you've got a problem
				chum, think how it could be.</p>
			<p>Barnaby The Bear's my name, never call me Jack or James, I
				will sing my way to fame, Barnaby the Bear's my name. Birds taught
				me to sing, when they took me to their king, first I had to fly, in
				the sky so high so high, so high so high so high, so - if you want
				to sing this way, think of what you'd like to say, add a tune and
				you will see, just how easy it can be. Treacle pudding, fish and
				chips, fizzy drinks and liquorice, flowers, rivers, sand and sea,
				snowflakes and the stars are free. La la la la la, la la la la la la
				la, la la la la la la la, la la la la la la la la la la la la la, so
				- Barnaby The Bear's my name, never call me Jack or James, I will
				sing my way to fame, Barnaby the Bear's my name.</p>
			<p>There's a voice that keeps on calling me. Down the road,
				that's where I'll always be. Every stop I make, I make a new friend.
				Can't stay for long, just turn around and I'm gone again. Maybe
				tomorrow, I'll want to settle down, Until tomorrow, I'll just keep
				moving on.</p>
			<p>Top Cat! The most effectual Top Cat! Who's intellectual close
				friends get to call him T.C., providing it's with dignity. Top Cat!
				The indisputable leader of the gang. He's the boss, he's a pip, he's
				the championship. He's the most tip top, Top Cat.</p>
			<p>Hong Kong Phooey, number one super guy. Hong Kong Phooey,
				quicker than the human eye. He's got style, a groovy style, and a
				car that just won't stop. When the going gets tough, he's really
				rough, with a Hong Kong Phooey chop (Hi-Ya!). Hong Kong Phooey,
				number one super guy. Hong Kong Phooey, quicker than the human eye.
				Hong Kong Phooey, he's fan-riffic!</p>
			<p>Barnaby The Bear's my name, never call me Jack or James, I
				will sing my way to fame, Barnaby the Bear's my name. Birds taught
				me to sing, when they took me to their king, first I had to fly, in
				the sky so high so high, so high so high so high, so - if you want
				to sing this way, think of what you'd like to say, add a tune and
				you will see, just how easy it can be. Treacle pudding, fish and
				chips, fizzy drinks and liquorice, flowers, rivers, sand and sea,
				snowflakes and the stars are free. La la la la la, la la la la la la
				la, la la la la la la la, la la la la la la la la la la la la la, so
				- Barnaby The Bear's my name, never call me Jack or James, I will
				sing my way to fame, Barnaby the Bear's my name.</p>
			<p>There's a voice that keeps on calling me. Down the road,
				that's where I'll always be. Every stop I make, I make a new friend.
				Can't stay for long, just turn around and I'm gone again. Maybe
				tomorrow, I'll want to settle down, Until tomorrow, I'll just keep
				moving on.</p>
			<p>Top Cat! The most effectual Top Cat! Who's intellectual close
				friends get to call him T.C., providing it's with dignity. Top Cat!
				The indisputable leader of the gang. He's the boss, he's a pip, he's
				the championship. He's the most tip top, Top Cat.</p>
			<p>Hong Kong Phooey, number one super guy. Hong Kong Phooey,
				quicker than the human eye. He's got style, a groovy style, and a
				car that just won't stop. When the going gets tough, he's really
				rough, with a Hong Kong Phooey chop (Hi-Ya!). Hong Kong Phooey,
				number one super guy. Hong Kong Phooey, quicker than the human eye.
				Hong Kong Phooey, he's fan-riffic!</p>
		</div>
		<br> <br>
		<a id="next" href="index2.html">next page?</a>
		<!-- 
		<s:a id="next" action="jQueryInfiniteScroll.action">下一页</s:a>
		 -->
	</div>
</body>
</html>
