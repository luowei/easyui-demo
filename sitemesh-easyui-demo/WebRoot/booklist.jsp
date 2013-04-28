<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Book详细列表页面</title>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="easyui/jquery-1.6.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/jquery.edatagrid.js"></script>
<script type="text/javascript" src="js/jquery.edatagrid.lang.js"></script>
<style type="text/css">
	body{
		margin: 0;
	}
</style>
<script type="text/javascript">
	$(function(){
		$('#bookview').edatagrid({
			saveUrl: '${pageContext.request.contextPath}/AddBookServlet',
			updateUrl: '${pageContext.request.contextPath}/UpdateBookServlet',
			destroyUrl: '${pageContext.request.contextPath}/DeleteBookServlet'
		});
	});
</script>
</head>
<body style="visibility: visible;">
	<table id="bookview" 
		rownumbers="true" 
		pagination="true"
		fitColumns="true" 
		singleSelect="true"
		pageSize=20
		toolbar="#tb"
		url="${pageContext.request.contextPath }/BookServlet"
		>
		<thead>  
	        <tr>  
	            <th field="bookId" width="80" align="center" >图书编号</th>  
	            <th field="bookName"align="center" width="80" editor="{type:'validatebox',options:{required:true}}">图书名称</th>  
	            <th field="author" align="center" width="80" editor="{type:'validatebox',options:{required:true}}">作者</th>  
	            <th field="price"  align="center" width="80" editor="{type:'validatebox',options:{required:true}}">单价</th>  
	            <th field="pubInfo" align="center" width="150" editor="{type:'validatebox',options:{required:true}}">出版社</th>  
	            <th field="date" align="center" width="80" editor="{type:'validatebox',options:{required:true}}">出版日期</th>  
	        </tr>  
    	</thead>
	</table>
	
	<div id="tb">  
	    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:$('#bookview').edatagrid('addRow')">新增</a>  
	    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:$('#bookview').edatagrid('destroyRow')">删除</a>
	    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="javascript:$('#bookview').edatagrid('saveRow')">保存</a>  
	    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="javascript:$('#bookview').edatagrid('cancelRow')">取消</a>  
	</div> 
	
</body>
</html>