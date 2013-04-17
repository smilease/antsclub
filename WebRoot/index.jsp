<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="zh-CN" xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<link href='/css/index.css' rel='stylesheet' type='text/css'></link>
<jsp:include page="/inc/easyui_css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/inc/nav.jsp" />
	<div id="wrapper">
		<div id="content">
			<div id="left">
				<div class="info">
					<div class="hd">
						<h2>羽毛球
						</h2>
					</div>
					<ul>
						<li class="info_l">
							<div class="title_l" id="b_title_0"></div>
							<ul class="detail_l">
								<li id='b_startTime_0'></li>
								<li id='b_endTime_0'></li>
								<li id='b_address_0'></li>
								<li id='b_detail_0'></li>
							</ul>
						</li>	
						<li class="info_r">
							<div class="title_r" id="b_title_1"></div>
							<ul class="detail_r">
								<li id='b_startTime_1'></li>
								<li id='b_endTime_1'></li>
								<li id='b_address_1'></li>
								<li id='b_detail_1'></li>
							</ul>	
						</li>	
					</ul>
				</div>
				<div class="info">
					<div class="hd">
						<h2>桌球
						</h2>
					</div>
					<ul>
						<li class="info_l">
							<div class="title_l" id="bl_title_0"></div>
							<ul class="detail_l">
								<li id='bl_startTime_0'></li>
								<li id='bl_endTime_0'></li>
								<li id='bl_address_0'></li>
								<li id='bl_detail_0'></li>
							</ul>
						</li>	
						<li class="info_r">
							<div class="title_r" id="b_title_1"></div>
							<ul class="detail_r">
								<li id='bl_startTime_1'></li>
								<li id='bl_endTime_1'></li>
								<li id='bl_address_1'></li>
								<li id='bl_detail_1'></li>
							</ul>	
						</li>	
					</ul>
				</div>
				
				<div class="info">
					<div class="hd">
						<h2>游泳
						</h2>
					</div>
					<ul>
						<li class="info_l">
							<div class="title_l" id="s_title_0"></div>
							<ul class="detail_l">
								<li id='s_startTime_0'></li>
								<li id='s_endTime_0'></li>
								<li id='s_address_0'></li>
								<li id='s_detail_0'></li>
							</ul>
						</li>	
						<li class="info_r">
							<div class="title_r" id="s_title_1"></div>
							<ul class="detail_r">
								<li id='s_startTime_1'></li>
								<li id='s_endTime_1'></li>
								<li id='s_address_1'></li>
								<li id='s_detail_1'></li>
							</ul>	
						</li>
					</ul>
				</div>
			</div>
			<div id="right">
				<div class="active_info">
					<div class="hd">
						<h2>热门群组
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
	<jsp:include page="/inc/inc_js.jsp" />
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
			$.ajax({
			    url : "/activity",
			    dataType : "json",
			    success : function(data) {
			    	var len=data.badmintonList.length;
			    	for(var i=0;i<len;i++){
			    		var act=data.badmintonList[i];
				    	if(act){
				    		$('#b_title_'+i).html('<a href="/activity/act_view.jsp?id='+act.id+'">'+act.title+'</a>');
				    		if(act.startTime){
				    			$('#b_startTime_'+i).html('开始时间: '+removeDotZero(act.startTime));
				    		}
				    		if(act.endTime){
				    			$('#b_endTime_'+i).html('结束时间: '+removeDotZero(act.endTime));
				    		}
				    		if(act.address){
				    			$('#b_address_'+i).html('地点: '+act.address);
				    		}
				    		if(act.detail){
				    			$('#b_detail_'+i).html('详情: '+act.detail);
				    		}
				    	}
			    	}
			    	len=data.billiardsList.length;
			    	for(var i=0;i<len;i++){
			    		var act=data.billiardsList[i];
				    	if(act){
				    		$('#bl_title_'+i).html('<a href="/activity/act_view.jsp?id='+act.id+'">'+act.title+'</a>');
				    		if(act.startTime){
				    			$('#bl_startTime_'+i).html('开始时间: '+removeDotZero(act.startTime));
				    		}
				    		if(act.endTime){
				    			$('#bl_endTime_'+i).html('结束时间: '+removeDotZero(act.endTime));
				    		}
				    		if(act.address){
				    			$('#bl_address_'+i).html('地点: '+act.address);
				    		}
				    		if(act.detail){
				    			$('#bl_detail_'+i).html('详情: '+act.detail);
				    		}
				    	}
			    	}
			     	len=data.swimmingList.length;
			    	for(var i=0;i<len;i++){
			    		var act=data.swimmingList[i];
				    	if(act){
				    		$('#s_title_'+i).html('<a href="/activity/act_view.jsp?id='+act.id+'">'+act.title+'</a>');
				    		if(act.startTime){
				    			$('#s_startTime_'+i).html('开始时间: '+removeDotZero(act.startTime));
				    		}
				    		if(act.endTime){
				    			$('#s_endTime_'+i).html('结束时间: '+removeDotZero(act.endTime));
				    		}
				    		if(act.address){
				    			$('#s_address_'+i).html('地点: '+act.address);
				    		}
				    		if(act.detail){
				    			$('#s_detail_'+i).html('详情: '+act.detail);
				    		}
				    	}
			    	}
			    },
			    error : function(textStatus) {
			        alert("error");
			    }
			});
			
		});
	</script>
</body>
</html>
