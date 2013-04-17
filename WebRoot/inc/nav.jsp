<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id='header'>
	<div id='bar'>
		<div class='inner'>
			<a href='/' id='logo'>
				<img alt='有共同爱好的人在一起' src='/images/logo_top.jpg'>
			</a>
			<div id='nav' class='left'>
				<a href='/wait.jsp'>羽毛球</a>
				<a href='/wait.jsp'>桌球</a>
				<a href='/wait.jsp'>游泳</a>
				<a href='/wait.jsp'>英语</a>
			</div>
			<div id='login' class='right'>
				<c:if test="${sessionScope.uname!=null}">
					<a href='/user/userInfo.jsp'>欢迎 ${sessionScope.uname}</a>
					<a href='/user/logout'>注销</a>
				</c:if>
				<c:if test="${sessionScope.uname==null}">
					<a href='/user/login.jsp'>登录</a>
					<a href='/user/register.jsp'>注册</a>
				</c:if>
			</div>
		</div>
	</div>
	<div id='menu' class='inner'>
		<ul>
			<li>
				<a href='/'>首页</a>
			</li>
			<li>
				<a href='/wait.jsp'>活动</a>
			</li>
			<li>
				<a href='/wait.jsp'>群组</a>
			</li>
			<li>
				<a href='/wait.jsp'>成员</a>
			</li>
			<li>
				<a href='/unable.jsp'>发起活动</a>
			</li>
			<li>
				<a href='/about.jsp'>关于AntsClub</a>
			</li>
		</ul>
	</div>
</div>