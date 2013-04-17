<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="zh-CN" xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<jsp:include page="/inc/inc_css.jsp"></jsp:include>
</head>
<body>
	<div class="manage_container">
		<jsp:include page="/inc/nav.jsp"></jsp:include>
		<div class="main">
			<h1>活动管理&nbsp;&nbsp;
			<a href="/activity/add">创建活动</a>
			</h1>
			<div class="table_box">
				<table class="list">
					<tbody>
						<tr>
							<th width="4%">id</th>
							<th width="35%">标题</th>
							<th width="12%">操作</th>
						</tr>
						<c:forEach items="${activityList}" var="activity">
						<tr>
							<td style="text-align:left;"><c:out value="${activity.id}" default=""/></td>
							<td style="text-align:left;">${activity.title}</td>
							<td style="text-align:left;">
								&nbsp;&nbsp;<a href="/activity/delete/${activity.id}">删除</a>
								&nbsp;&nbsp;<a href="/activity/edit/${activity.id}">修改</a>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="/inc/inc_js.jsp"></jsp:include>
</body>
</html>