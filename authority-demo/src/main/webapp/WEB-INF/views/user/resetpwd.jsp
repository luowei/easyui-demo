<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="/WEB-INF/views/commons/taglibs.jsp"%>
<title><fmt:message key="login.title" /></title>
<link href="${ctx}/resources/idealforms/css/normalize-min.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/resources/idealforms/css/idealforms/idealforms-min.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body {
	width: 500px;
	margin: 50px auto;
	line-height: 1.5;
}

h1 {
	line-height: 1;
	margin-bottom: 1em;
}
h2 {
	color: red;
}

p {
	margin-bottom: 2em;
}

#myform {
	width: 500px;
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${error!=null}">
			<form id="myform">
				<fieldset>
					<h1>${error}</h1>
				</fieldset>
			</form>
		</c:when>
		<c:otherwise>
			<form id="myform" action="${ctx}/resetpwd" method="post">
				<fieldset>
					<h1>重新设置密码</h1>
					<h2>${msg}</h2>
					<input type="hidden" size="40" name="u" value="${u}" /> 
					<input type="hidden" size="40" name="t" value="${t}" />
					<div>
						<label class="required">新密码:</label> <input type="password" size="40" name="newpwd" />
					</div>
					<div>
						<label class="required">确认密码:</label> <input type="password" size="40" name="renewpwd" />
					</div>
					<div>
						<label>&nbsp;</label> <button id="submit">提交</button> <input type="reset" value="重置" />
					</div>
				</fieldset>
			</form>
			<script type="text/javascript" src="${ctx}/resources/jquery/jquery-1.7.1.min.js"></script>
			<script type="text/javascript" src="${ctx}/resources/idealforms/js/jquery.idealforms-min.js"></script>
			<script type="text/javascript">
				$(function() {
					$('#myform').idealforms();
				});
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>
