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
						<h2>创建活动
						</h2>
					</div>
					<form id='form_act' action="/activity/save" method="post">
						<input type="hidden" id="typeName" name="activity.typeName" value="羽毛球"/> 
						<div class="row">
							<label class="field">活动分类
							</label>
							<div class="item">
								<select id="type" class="basic-input" name="activity.typeCode">
									<option value="badminton">羽毛球</option>
									<option value="billiards">桌球</option>
									<option value="swimming">游泳</option>
								</select>
								<select id="subtype" class="basic-input hide" name="subtype" style="display:none">
								</select>
							</div>
						</div>
						<div class="row">
							<label class="field">活动标题
							</label>
							<div class="item">
								<input id="title" class="basic-input" name="activity.title" maxlength="70" size="46"/>
							</div>
						</div>
						      
						<div class="row">
							<label class="field">活动地点
							</label>
							<div class="item">
								<input id="address" class="basic-input" name="activity.address" maxlength="70" size="46"/>
							</div>
						</div>
						<div class="row">
							<label class="field">开始时间
							</label>
							<div class="item">
								<input id="startTime" name="activity.startTime"></input>
							</div>
						</div>
						<div class="row">
							<label class="field">结束时间
							</label>
							<div class="item">
								<input id="endTime" name="activity.endTime"></input>
							</div>
						</div>
						<div class="row">
							<label class="field">活动详情
							</label>
							<div class="item">
								<textarea clas="basic-input" rows="10" cols="42" 
								max_length="4000" name="activity.detail"></textarea>
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
						<h2>活动创建说明
						</h2>
					</div>
					<ul>
						<li class="info_l active">
							<div class="title_l">1、活动标题、地点、开始时间、结束时间为必填项</div>
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
			$('#startTime').datetimebox({});
			$('#endTime').datetimebox({});
			$('#submit_form').click(function(){
				$('#form_act').submit();
			});
			$('#type').change(function(){
				$('#typeName').val($('#type option:selected').text());
			});
		});
	</script>
</body>
</html>
