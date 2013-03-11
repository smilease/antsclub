<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="zh-CN" xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<jsp:include page="/inc/inc.jsp"></jsp:include>
</head>
<body>
	<div class="manage_container">
		<jsp:include page="/inc/nav.jsp"></jsp:include>
		<div class="main">
			<h1>用户管理 ---&gt; 注册用户
			</h1>
			<div class="form_box">
				<form action="/user/save" method="post">
				<%@ include file="/user/_form.jsp"%>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
