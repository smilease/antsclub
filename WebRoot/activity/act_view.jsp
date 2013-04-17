<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="zh-CN" xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
	<jsp:include page="/inc/easyui_css.jsp"></jsp:include>
	<jsp:include page="/inc/inc_css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/inc/nav.jsp"></jsp:include>
	<div id="wrapper">
		<div id="content">
			<div id="left">
				<div class="info">
					<div class="hd">
						<h2>活动详情
						<span class="more" id="span_signNum"></span>	
						</h2>
					</div>
					<form id='form_act' action="/activity/save" method="post">
						<div class="row">
							<label class="field">活动分类
							</label>
							<label class="field_content" id="type">
							</label>
						</div>
						<div class="row">
							<label class="field">活动标题
							</label>
							<label class="field_content" id='title'>
							</label>
						</div>
						      
						<div class="row">
							<label class="field">活动地点
							</label>
							<label class="field_content" id="address">
							</label>
						</div>
						<div class="row">
							<label class="field">开始时间
							</label>
							<label class="field_content" id="startTime">
							</label>
						</div>
						<div class="row">
							<label class="field">结束时间
							</label>
							<label class="field_content" id="endTime">
							</label>
						</div>
						<div class="row">
							<label class="field">活动详情
							</label>
							<label class="field_content" id="detail">
							</label>
						</div>
						<hr class="hrline"/>
						<div class="row">
							<label class="field">报名人员
							</label>
							<label class="field_content" id="signUsers">
							</label>
						</div>
						<div class="row footer">
							<div class="item">
								<input class="loc-btn" type="button" id="btn_sign" value="报名"/>
								<input class="lnk-flat" type="button" id="btn_undo" value="取消报名"/>
							</div>
						</div>
					</form>
				</div>
				

				
			</div>
			<div id="right">
				<div class="active_info">
					<div class="hd">
						<h2>报名说明
						</h2>
					</div>
					<ul>
						<li class="info_l active">
							<div class="title_l">1、登陆用户才能报名</div>
							<div class="title_l">2、每个登陆用户只能给自己报名</div>
							<div class="title_l">3、已报名的登陆用户可以取消自己的报名</div>
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
			var id="<%=request.getParameter("id")%>";
			var uid="<%=session.getAttribute("uid")%>";
			var uname="<%=session.getAttribute("uname")%>";
			var signUsers='';
			var len=0;
			var sign_num=0;
			$.ajax({
				url : "/activity/view/"+id,
				success : function(r){
					$('#type').html(r[0].typeName);
					$('#title').html(r[0].title);
					$('#address').html(r[0].address);
					$('#startTime').html(removeDotZero(r[0].startTime));
					$('#endTime').html(removeDotZero(r[0].endTime));
					$('#detail').html(r[0].detail);
					len=r.length;
					for(var i=0;i<len;i++){
						if(r[i].uname!=null&&r[i].uname!=""){
							signUsers=signUsers+', '+r[i].uname;
							sign_num++;
						}
					}
					if(signUsers.length>1){
						signUsers=signUsers.substring(1,signUsers.length);
						$('#signUsers').html(signUsers+'</br> 共 '+sign_num+' 人');
						$('#span_signNum').html('已报名：<strong>'+sign_num+'</strong>人');
					}else{
						$('#signUsers').html('共  0  人');
						$('#span_signNum').html('已报名：<strong>0</strong>人');
					}
					
				}
			});
			
			$('#btn_sign').click(function(){
				if(uid.length==36){
					$.ajax({
						url : '/activity/sign/'+id,
						success : function(r){
							$.messager.show({
								title:'提示',
								msg:r.msg,
								timeout:3000,
								showType:'slide'
							});
							if(r.success){
								sign_num++;
								signUsers=signUsers+', '+uname;
								signUsers=signUsers.substring(1,signUsers.length);
								$('#signUsers').html(signUsers+'</br> 共 '+sign_num+' 人');
								$('#span_signNum').html('已报名：<strong>'+sign_num+'</strong>人');
							}
						}
					});
				}else{
					alert('请先登录才能报名');
				}
			});
			$('#btn_undo').click(function(){
				if(uid.length==36){
					$.ajax({
						url : '/activity/undoSign/'+id,
						success : function(r){
							$.messager.show({
								title:'提示',
								msg:r.msg,
								timeout:3000,
								showType:'slide'
							});
							if(r.success){
								sign_num--;
								signUsers=signUsers.replace(uname+',', '')
											.replace(', '+uname, '').replace(uname, '');
								$('#signUsers').html(signUsers+'</br> 共 '+sign_num+' 人');
								$('#span_signNum').html('已报名：<strong>'+sign_num+'</strong>人');
							}
						}
					});
				}else{
					alert('请先登录才能取消报名');
				}
			});
		});
	</script>
</body>
</html>
