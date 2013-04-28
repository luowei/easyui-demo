<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户登录</title>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="easyui/jquery-1.6.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
</head>
<body style="height:100%;width:100%;overflow:hidden;border:none;visibility:visible;" >
<div class="easyui-window" style="width:500px;height:300px;background:#fafafa;overflow:hidden"
			title="登录系统" border="false" resizable="false" draggable="false" minimizable="false" maximizable="false">
		<div class="header" style="height:60px;">
			<div class="toptitle" style="margin-top: 20px;">后台管理系统</div>
		</div>
		<div style="padding:60px 0;">
			<form action="main.jsp" method="post" id="loginForm">
				<div style="padding-left:150px">
					<table cellpadding="0" cellspacing="3">
						<tr>
							<td>登录帐号</td>
							<td><input name="username"></input></td>
						</tr>
						<tr>
							<td>登录密码</td>
							<td><input type="password" name="password"></input></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td>
								<a class="easyui-linkbutton" onclick="javascript:document.getElementById('loginForm').submit();">登 录</a>
								<a class="easyui-linkbutton" onclick="javascript:document.getElementById('loginForm').reset();">重 置</a>
							</td>
						</tr>
					</table>
				</div>
				
			</form>
		</div>
	</div> 
</body>
</html>