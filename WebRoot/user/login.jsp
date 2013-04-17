<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="zh-CN" xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<jsp:include page="/inc/inc_css.jsp"></jsp:include>
<jsp:include page="/inc/easyui_css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/inc/nav.jsp"></jsp:include>
	<div id="wrapper">
		<div id="content">
			<div id="left">
				<div class="info">
					<div class="hd">
						<h2>用户登陆
						</h2>
					</div>
					<form id='form_login' action="/user/login" method="post">
						<div class="row">
							<label class="field">登陆名
							</label>
							<div class="item">
								<input id="address" class="basic-input" name="user.uname" maxlength="70" size="46"/>
							</div>
						</div>
						<div class="row">
							<label class="field">密码
							</label>
							<div class="item">
								<input id="pwd" class="basic-input" type="password"  name="user.pwd" maxlength="70" size="46"/>
							</div>
						</div>
						<hr class="hrline"/>
						<div class="row footer">
							<div class="item">
								<input class="loc-btn" type="button" id="submit_form" value="提交"/>
								<input class="lnk-flat" type="button" id="cancel_form" value="取消"/>
							</div>
						</div>
					</form>
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
							<div class="title_l">菁英公寓羽毛球协会</div>
							<ul class="detail_l">
								<li>成员 80 人</li>
								<li>活动场地 菁英公寓文体中心二楼</li>
								<li>活动时间 每周六</li>
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
							<div class="title_l">土龙</div>
							<ul class="detail_l">
								<li>活跃项目： 羽毛球</li>
								<li>参加群组：AGS羽毛球社等</li>
								<li>活动频率：每周3次</li>
							</ul>
						</li>	
						
						
						<li class="info_l active">
							<div class="title_l">Fred</div>
							<ul class="detail_l">
								<li>活跃项目： 羽毛球</li>
								<li>参加群组：AGS羽毛球社等</li>
								<li>活动频率：每周3次</li>
							</ul>
						</li>	
					</ul>
				</div>	
			</div>
		</div>
	</div>
	<div id="footer"></div>
	<jsp:include page="/inc/inc_js.jsp"></jsp:include>
	<jsp:include page="/inc/easyui_js.jsp"></jsp:include>
	<script type="text/javascript">
		$(function(){
			var msg="<%=request.getAttribute("msg")%>";
			if(msg!='null'&&msg!=''){
				$.messager.show({
					title:'提示',
					msg:msg,
					timeout:3000,
					showType:'slide'
				});
			}
			$('#submit_form').click(function(){
				$('#form_login').submit();
			});
		});
	</script>
</body>
</html>
