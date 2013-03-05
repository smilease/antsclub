<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="zh-CN" xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<link href="/css/manage.css" media="screen" rel="stylesheet" type="text/css" />
<script src="/js/jquery-1.4.4.min.js" type="text/javascript" ></script>
</head>
<body>
	<div class="manage_container">
		<div class="manage_head">
			<div class="manage_logo"><a href="http://code.google.com/p/jfinal" target="_blank">JFinal web framework</a></div>
			<div id="nav">
				<ul>
					<li><a href="/"><b>首页</b></a></li>
					<li><a href="/blog"><b>Blog管理</b></a></li>
				</ul>
			</div>
		</div>
		<div class="main">
<h1>Blog管理&nbsp;&nbsp;
<a href="/blog/add">创建Blog</a>
</h1>
<div class="table_box">
	<table class="list">
		<tbody>
			<tr>
				<th width="4%">id</th>
				<th width="35%">标题</th>
				<th width="12%">操作</th>
			</tr>
			<c:forEach items="${blogList}" var="blog">
			<tr>
				<td style="text-align:left;"><c:out value="${blog.id}" default=""/></td>
				<td style="text-align:left;">${blog.title}</td>
				<td style="text-align:left;">
					&nbsp;&nbsp;<a href="/blog/delete/${blog.id}">删除</a>
					&nbsp;&nbsp;<a href="/blog/edit/${blog.id}">修改</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
		</div>
	</div>
</body>
</html>