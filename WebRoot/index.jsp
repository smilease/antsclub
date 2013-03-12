<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="zh-CN" xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href='css/index.css' rel='stylesheet' type='text/css'>
</head>
<body>
	<div id='header'>
		<div id='bar'>
			<div class='inner'>
				<a href='/' id='logo'>
					<img alt='有共同爱好的人在一起' src='images/logo_top.jpg'>
				</a>
				<div id='nav' class='left'>
					<a href='#'>羽毛球</a>
					<a href='#'>桌球</a>
					<a href='#'>游泳</a>
					<a href='#'>英语</a>
				</div>
				<div id='login' class='right'>
					<c:if test="${sessionScope.username!=null}">
						<a href='/user/userInfo.jsp'>欢迎 ${sessionScope.username}</a>
						<a href='/user/logout'>注销</a>
					</c:if>
					<c:if test="${sessionScope.username==null}">
						<a href='/user/login.jsp'>登录</a>
						<a href='/user/register.jsp'>注册</a>
					</c:if>
				</div>
			</div>
		</div>
		<div id='menu' class='inner'>
			<ul>
				<li>
					<a href='#'>首页</a>
				</li>
				<li>
					<a href='#'>活动</a>
				</li>
				<li>
					<a href='#'>群组</a>
				</li>
				<li>
					<a href='#'>成员</a>
				</li>
				<li>
					<a href='#'>分享</a>
				</li>
				<li>
					<a href='/activity'>发起活动</a>
				</li>
			</ul>
		</div>
	</div>
	<div id="wrapper">
		<div id="content">
			<div id="left">
				<div class="info">
					<div class="hd">
						<h2>羽毛球
							<span class="more">更多>></span>	
						</h2>
					</div>
					<ul>
						<li class="info_l">
							<div class="title_l">AGS周五苏大羽毛球活动</div>
							<ul class="detail_l">
								<li>2月28日 周五 18:00-19:30</li>
								<li>苏大独墅湖校区 公共体育楼</li>
								<li>已报名10人  上限12人</li>
							</ul>
						</li>	
						<li class="info_r">
							<div class="title_r">AGS周五苏大羽毛球活动</div>
							<ul class="detail_r">
								<li>2月28日 周五 18:00-19:30</li>
								<li>苏大独墅湖校区 公共体育楼</li>
								<li>已报名10人  上限12人</li>
							</ul>	
						</li>	
					</ul>
				</div>
				

				<div class="info">
					<div class="hd">
						<h2>桌球
							<span class="more">更多>></span>	
						</h2>
					</div>
					<ul>
						<li class="info_l">
							<div class="title_l">AGS周五苏大羽毛球活动</div>
							<ul class="detail_l">
								<li>2月28日 周五 18:00-19:30</li>
								<li>苏大独墅湖校区 公共体育楼</li>
								<li>已报名10人  上限12人</li>
							</ul>
						</li>	
						<li class="info_r">
							<div class="title_r">AGS周五苏大羽毛球活动</div>
							<ul class="detail_r">
								<li>2月28日 周五 18:00-19:30</li>
								<li>苏大独墅湖校区 公共体育楼</li>
								<li>已报名10人  上限12人</li>
							</ul>	
						</li>	
					</ul>
				</div>
				
				<div class="info">
					<div class="hd">
						<h2>游泳
							<span class="more">更多>></span>	
						</h2>
					</div>
					<ul>
						<li class="info_l">
							<div class="title_l">AGS周五苏大羽毛球活动</div>
							<ul class="detail_l">
								<li>2月28日 周五 18:00-19:30</li>
								<li>苏大独墅湖校区 公共体育楼</li>
								<li>已报名10人  上限12人</li>
							</ul>
						</li>	
						<li class="info_r">
							<div class="title_r">AGS周五苏大羽毛球活动</div>
							<ul class="detail_r">
								<li>2月28日 周五 18:00-19:30</li>
								<li>苏大独墅湖校区 公共体育楼</li>
								<li>已报名10人  上限12人</li>
							</ul>	
						</li>	
					</ul>
				</div>
			</div>
			<div id="right">
				<div class="active_info">
					<div class="hd">
						<h2>热门群组
							<span class="more">更多>></span>	
						</h2>
					</div>
					<ul>
						<li class="info_l active">
							<div class="title_l">AGS羽毛球社</div>
							<ul class="detail_l">
								<li>成员 40 人</li>
								<li>活动场地 苏大独墅湖校区</li>
								<li>活动时间 每周五</li>
							</ul>
						</li>	
						
						
						<li class="info_l active">
							<div class="title_l">AGS桌球社</div>
							<ul class="detail_l">
								<li>成员 20 人</li>
								<li>活动场地 文星广场文星广场</li>
								<li>活动时间 每周三</li>
							</ul>
						</li>	
					</ul>
				</div>	
				<div class="active_info">
					<div class="hd">
						<h2>活跃成员
							<span class="more">更多>></span>	
						</h2>
					</div>
					<ul>
						<li class="info_l active">
							<div class="title_l">AGS羽毛球社</div>
							<ul class="detail_l">
								<li>成员 40 人</li>
								<li>活动场地 苏大独墅湖校区</li>
								<li>活动时间 每周五</li>
							</ul>
						</li>	
						
						
						<li class="info_l active">
							<div class="title_l">AGS桌球社</div>
							<ul class="detail_l">
								<li>成员 20 人</li>
								<li>活动场地 文星广场文星广场</li>
								<li>活动时间 每周三</li>
							</ul>
						</li>	
					</ul>
				</div>	
			</div>
		</div>
	</div>
	<div id="footer"></div>
</body>
</html>
