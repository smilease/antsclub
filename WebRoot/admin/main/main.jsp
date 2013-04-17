<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
 <head>
	<title>AntsClub 开源社团管理系统</title>
	<link href="/plugin/lhgDialog/skins/iblue.css" rel="stylesheet" id="lhgdialoglink">
	<link id="easyuiTheme" rel="stylesheet" href="/plugin/easyui132/themes/default/easyui.css" type="text/css">
	<link rel="stylesheet" href="/plugin/easyui132/themes/icon.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="/plugin/accordion/css/accordion.css">
	<link href="/plugin/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="/resources/css/base.css" type="text/css">
	<link rel="shortcut icon" href="images/favicon.ico">
	<link href='/css/form.css' rel='stylesheet' type='text/css'>
	<style type="text/css">
		a {
			color: Black;
			text-decoration: none;
		}
		
		a:hover {
			color: black;
			text-decoration: none;
		}
	</style>
 </head>
 <body class="easyui-layout" style="overflow-y: hidden" scroll="no">
  <!-- 顶部-->
  <div region="north" border="false" title="AntsClub 开源社团管理系统" style="BACKGROUND:#E6E6FA;height: 85px; padding: 1px; overflow: hidden;">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
     <td align="left" style="vertical-align:text-bottom" >
      <img src="/plugin/login/images/logo_admin.png" >
      <!--
      <img src="/plugin/login/images/toplogo.png" width="550" height="52" alt="">-->
     </td>
     <td align="right" nowrap>
      <table>
       <tr>
        <td valign="top" height="50">
         <span style="color: #CC33FF">当前用户:</span><span style="color: #666633">(${userName }) <span style="color: #CC33FF">职务</span>:<span style="color: #666633">${roleName }</span>
        </td>
       </tr>
       <td>
        <div style="position: absolute; right: 0px; bottom: 0px;">
         <a href="javascript:void(0);" class="easyui-menubutton" menu="#layout_north_kzmbMenu" iconCls="icon-help">控制面板</a><a href="javascript:void(0);" class="easyui-menubutton" menu="#layout_north_zxMenu" iconCls="icon-back">注销</a>
        </div>
        <div id="layout_north_kzmbMenu" style="width: 100px; display: none;">
         <div onclick="openwindow('用户信息','userController.do?userinfo')">
          	个人信息
         </div>
         <div class="menu-sep"></div>
         <div onclick="add('修改密码','userController.do?changepassword')">
          	修改密码
         </div>
         <div class="menu-sep"></div>
         <div>
          	<a href="/index.jsp">前往首页</a>
         </div>
        </div>
        <div id="layout_north_zxMenu" style="width: 100px; display: none;">
         <div class="menu-sep"></div>
         <div onclick="exit('loginController.do?logout','确定退出该系统吗 ?',1);">
          退出系统
         </div>
        </div>
       </td>
       </tr>
      </table>
     </td>
     <td align="right">
      &nbsp;&nbsp;&nbsp;
     </td>
    </tr>
   </table>
  </div>
  <!-- 左侧-->
  <div region="west" split="true" href="left.jsp" title="导航菜单" style="width: 150px; padding: 1px;">
  
  
  </div>
  <!-- 中间-->
  <div id="mainPanle" region="center" style="overflow: hidden;">
   <div id="maintabs" class="easyui-tabs" fit="true" border="false">
    <div class="easyui-tab" title="首页" href="home.jsp" style="padding:2px; overflow: hidden;">
   				 
    </div>
   </div>
  </div>
  <!-- 右侧 -->
  <div collapsed="true"  region="east" iconCls="icon-reload" title="辅助工具" split="true" style="width: 190px;">
   <div id="tabs"  class="easyui-tabs" border="false" style="height: 240px">
    <div title="日历" style="padding: 0px; overflow: hidden; color: red;">
     <div id="layout_east_calendar"></div>
    </div>
   </div>
   <div id="tabs" class="easyui-tabs" border="false">
    <div title="在线人员" style="padding: 20px; overflow: hidden; color: red;">
    </div>
   </div>
  </div>
  <!-- 底部 -->
  <div region="south" border="false" style="height: 25px; overflow: hidden;">
    <div align="center" style="color: #CC99FF; padding-top: 2px">
    &copy; 版权所有
     <span class="tip"><a href="http://antsclub.cloudfoundry.com" title="AntsClub开源社团管理系统">Antsclub</a> (推荐谷歌浏览器，获得更快响应速度)  技术支持:<a href="#" title="AntsClub开源社团管理系统">AntsClub</a></span>
   </div>
  </div>
  <div id="mm" class="easyui-menu" style="width:150px;">
        <div id="mm-tabclose">关闭</div>
        <div id="mm-tabcloseall">全部关闭</div>
        <div id="mm-tabcloseother">除此之外全部关闭</div>
        <div class="menu-sep"></div>
        <div id="mm-tabcloseright">当前页右侧全部关闭</div>
        <div id="mm-tabcloseleft">当前页左侧全部关闭</div>
        
</div>
	<script type="text/javascript" src="/js/jquery-1.8.0.min.js"></script>
 	<script type="text/javascript" src="/plugin/tools/dataformat.js"></script>
  	<script type="text/javascript" src="/plugin/My97DatePicker/WdatePicker.js"></script>
  	<script type="text/javascript" src="/plugin/lhgDialog/lhgdialog.min.js?skin=iblue"></script>
 	<script type="text/javascript" src="/plugin/tools/curdtools.js"></script>
 	<script type="text/javascript" src="/plugin/tools/easyuiextend.js"></script>
	<jsp:include page="/inc/inc_js.jsp"></jsp:include>
	<jsp:include page="/inc/easyui_js.jsp"></jsp:include>
 <SCRIPT type="text/javascript">
	$(function() {
		$('#layout_east_calendar').calendar({
			fit : true,
			current : new Date(),
			border : false,
			onSelect : function(date) {
				$(this).calendar('moveTo', new Date());
			}
		});

	});
</SCRIPT>
 </body>
</html>