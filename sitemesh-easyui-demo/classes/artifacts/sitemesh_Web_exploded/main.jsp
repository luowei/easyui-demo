<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>网站后台管理系统</title>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="easyui/jquery-1.6.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
<style type="text/css">
	body{
		margin-top: 0px;
		margin-left: 0px;
		margin-bottom: 0px;
		margin-right: 0px;
	}
	
	ul li{
		/*margin-top: 15;*/
		cursor: pointer;
	}
	
</style>

<script type="text/javascript">
	/*
	* view(url) 在layout中打开页面
	*/
	function view(url){
		$('#iframe').attr('src',url);
	}
	
	/*
	*添加选项卡方法
	*/
	function addTab(title,url){
		//先判断是否存在标题为title的选项卡
		var tab=$('#tt').tabs('exists',title);
		if(tab){
			//若存在，则直接打开
			$('#tt').tabs('select',title);
		}else{
			//否则创建
			$('#tt').tabs('add',{
				title:title,
				content:"<iframe width='100%' height='100%'  id='iframe' frameborder='0' scrolling='auto'  src='"+url+"'></iframe>",
				closable:true
			});
		}
		
	}
	
	/*
	*根据title,选中Accordion对应的面板
	*/
	function selectAccordion(title){
		$('#accordionPanel').accordion('select',title);
	}
	
	
	/*
	*刷新时间
	*/
	function showTime(){
		var date=new Date();
		$('#timeInfo').html();
		$('#timeInfo').html('欢迎你，<%=request.getParameter("username") %>&nbsp;&nbsp;&nbsp;&nbsp;'+date.toLocaleString()+"&nbsp;&nbsp;");
	}
	setInterval(showTime,1000);
	
	/*
	*检测浏览器窗口大小改变,来改变页面layout大小
	*/
	$(function(){
		$(window).resize(function(){
			$('#cc').layout('resize');
		});
	});
	
	
	
</script>


</head>
<body style="border:none;visibility:visible;width: 100%;height: 100%;" onload="showTime();">
	<!-- 子菜单开始 -->
	<div id="mm1" class="easyui-menu" style="width:120px;">  
	    <div href="javascript:addTab('查看栏目','booklist.jsp')">查看栏目</div> 
	    <div class="menu-sep"></div>   
	    <div>  
	        <span>增删改栏目</span>  
	        <div style="width:100px;">  
	            <div href="javascript:addTab('新增栏目','booklist.jsp')">新增栏目</div>  
	            <div class="menu-sep"></div>  
	            <div href="javascript:addTab('修改栏目','booklist.jsp')">修改栏目</div>  
	            <div class="menu-sep"></div>  
	            <div href="javascript:addTab('删除栏目','booklist.jsp')">删除栏目</div>  
	        </div>  
	    </div>  
	</div> 
	
	<div id="mm2" class="easyui-menu" style="width:120px;">  
	    <div href="javascript:addTab('查看分类','booklist.jsp')">查看分类</div>  
	    <div class="menu-sep"></div> 
	    <div>
	    	<span>增删改分类</span>
	    	<div style="width:100px;">  
	            <div href="javascript:addTab('新增分类','booklist.jsp')">新增分类</div>  
	            <div class="menu-sep"></div>  
	            <div href="javascript:addTab('修改分类','booklist.jsp')">修改分类</div>  
	            <div class="menu-sep"></div>  
	            <div href="javascript:addTab('删除分类','booklist.jsp')">删除分类</div>  
	        </div>  
	    </div>  
	</div>
	
	<div id="mm4" class="easyui-menu" style="width:120px;">  
	    <div href="javascript:addTab('关 于','info.jsp')">关 于</div>  
	</div>
	
	<!-- 子菜单结束 -->
	
	<div id="cc" class="easyui-layout" style="width:100%;height:100%;">
		<!-- 页面顶部top及菜单栏 -->  
	    <div region="north" style="height:89%;width: 100%;">
	    	<div class="header">
				<div style="text-align:right;padding-right: 20px;padding-top: 22px;">
					<span style="color:#ddd" id="timeInfo"></span>
					<a href="/index.jsp" style="color:#fff;text-decoration:none;">退出</a>
				</div>
				<div class="maintitle" style="top: 12;">后台管理系统</div>
			</div>
	    	<div class="topmenu">
				<a href="javascript:addTab('主 页','http://www.blogjava.net/sxyx2008')" class="easyui-linkbutton" plain="true">主 页</a>
				<a href="#" class="easyui-menubutton" menu="#mm1">栏目管理</a>
				<a href="#" class="easyui-menubutton" menu="#mm2">分类管理</a>
				<a href="#" class="easyui-menubutton">部门管理</a>
				<a href="#" class="easyui-menubutton" menu="#mm4">帮助信息</a>
			</div>
	    </div>  
	    <!-- 页面底部信息 -->
	    <div region="south" style="height: 35px;" >
	    	<center>
	    		<span>联系我们　 |　 法律声明　 |　合作伙伴　|　客户服务　|　隐私声明</span><br>
	    		<span>唯为论坛 @ rootls.com |  维唯为为 http://rootls.com </span>
	    	</center>
	    </div>  
		<!-- 左侧导航菜单 -->	    
	    <div region="west"  title="导航菜单栏" style="width:180px;">
			<div class="easyui-accordion" fit="true" style="text-align: center;" id="accordionPanel">
				<div title="主 页">
					<ul>
						<li onclick="javascript:addTab('回到主页','booklist.jsp');">回到主页</li>
					</ul>
				</div>
				<div title="栏目管理">
					<ul>
						<li onclick="javascript:addTab('查看栏目','booklist.jsp');">查看栏目</li>
						<li onclick="javascript:addTab('新增栏目','booklist.jsp');">新增栏目</li>
						<li onclick="javascript:addTab('修改栏目','booklist.jsp');">修改栏目</li>
						<li onclick="javascript:addTab('删除栏目','booklist.jsp');">删除栏目</li>
					</ul>
				</div>
				<div title="分类管理">
					<ul>
						<li onclick="javascript:addTab('查看分类','booklist.jsp');">查看分类</li>
						<li onclick="javascript:addTab('新增分类','booklist.jsp');">新增分类</li>
						<li onclick="javascript:addTab('修改分类','booklist.jsp');">修改分类</li>
						<li onclick="javascript:addTab('删除分类','booklist.jsp');">删除分类</li>
					</ul>
				</div>
				<div title="部门管理">
					<ul>
						<li onclick="javascript:addTab('查看部门','booklist.jsp');">查看部门</li>
						<li onclick="javascript:addTab('新增部门','booklist.jsp');">新增部门</li>
						<li onclick="javascript:addTab('修改部门','booklist.jsp');">修改部门</li>
						<li onclick="javascript:addTab('删除部门','booklist.jsp');">删除部门</li>
					</ul>
				</div>
			</div>	   
	    </div>  
	    <!-- 右侧快捷操作栏目 -->
	    <div region="east"  title="相关操作" style="width:120px;">
	    	<ul>
	    		<li onclick="javascript:selectAccordion('主 页');">回到主页</li>
	    		<li onclick="javascript:selectAccordion('栏目管理');">栏目管理</li>
	    		<li onclick="javascript:selectAccordion('分类管理');">分类管理</li>
	    		<li onclick="javascript:selectAccordion('部门管理');">部门管理</li>
	    	</ul>
	    </div>
	    <!-- 主显示区域选项卡界面 title="主显示区域"-->
	    <div region="center">
	    	<div class="easyui-tabs" fit="true" id="tt"> 
	    		<div title="主页">
	    			<iframe width='100%' height='100%'  id='iframe' frameborder='0' scrolling='auto'  src='booklist.jsp'></iframe>
	    		</div>
	    	</div>
	    </div>  
	</div>
</body>
</html>