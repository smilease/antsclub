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
						<h2>用户注册
						</h2>
					</div>
					<form id='form_act' action="/user/save" method="post">
						<div class="row">
							<label class="field">登录名
							</label>
							<div class="item">
								<input id="title" class="basic-input" name="user.uname" maxlength="70" size="46"/><span style="color:red">*</span>
							</div>
						</div>
						      
						<div class="row">
							<label class="field">密码
							</label>
							<div class="item">
								<input id="pwd" class="basic-input" type="password" name="user.pwd" maxlength="70" size="46"/><span style="color:red">*</span>
							</div>
						</div>
						<div class="row">
							<label class="field">邮箱
							</label>
							<div class="item">
								<input id="title" class="basic-input" name="user.email" maxlength="70" size="46"/>
							</div>
						</div>
						<div class="row">
							<label class="field">昵称
							</label>
							<div class="item">
								<input id="address" class="basic-input" name="user.nickname" maxlength="70" size="46"/>
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
						<h2>注册说明
						</h2>
					</div>
					<ul>
						<li class="info_l active">
							<div class="title_l">1、登录名和密码是必填项</div>
							<div class="title_l">2、输入昵称，则登陆和报名后显示昵称，否则显示登录名</div>
							<div class="title_l">3、登录名、邮箱、昵称都必须唯一，不能重复</div>
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
				//alert('123');
				$('#form_act').submit();
			});
		});
	</script>
</body>
</html>
