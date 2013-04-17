<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <title></title>
  <link rel="shortcut icon" href="resources/fc/images/icon/favicon.ico">
  <!--[if lt IE 9]>
   <script src="/plugin/login/js/html5.js"></script>
  <![endif]-->
  <!--[if lt IE 7]>
  <script src="/plugin/login/js/iepng.js" type="text/javascript"></script>
  <script type="text/javascript">
	EvPNG.fix('div, ul, img, li, input'); //EvPNG.fix('包含透明PNG图片的标签'); 多个标签之间用英文逗号隔开。
</script>
  <![endif]-->
  <link href="/plugin/login/css/zice.style.css" rel="stylesheet" type="text/css" />
  <link href="/plugin/login/css/buttons.css" rel="stylesheet" type="text/css" />
  <link href="/plugin/login/css/icon.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" type="text/css" href="/plugin/login/css/tipsy.css" media="all" />
  <style type="text/css">
html {
	background-image: none;
}

label.iPhoneCheckLabelOn span {
	padding-left: 0px
}

#versionBar {
	background-color: #212121;
	position: fixed;
	width: 100%;
	height: 35px;
	bottom: 0;
	left: 0;
	text-align: center;
	line-height: 35px;
	z-index: 11;
	-webkit-box-shadow: black 0px 10px 10px -10px inset;
	-moz-box-shadow: black 0px 10px 10px -10px inset;
	box-shadow: black 0px 10px 10px -10px inset;
}

.copyright {
	text-align: center;
	font-size: 10px;
	color: #CCC;
}

.copyright a {
	color: #A31F1A;
	text-decoration: none
}

#login .logo {
	width: 500px;
	height: 51px;
}
</style>
 </head>
 <body>
  <div id="alertMessage"></div>
  <div id="successLogin"></div>
  <div class="text_success">
   <img src="/plugin/login/images/loader_green.gif" alt="Please wait" />
   <span>登陆成功!请稍后....</span>
  </div>
  <div id="login">
   <div class="ribbon" style="background-image:url(/plugin/login/images/typelogin.png);"></div>
   <div class="inner">
    <div class="logo">
     <img src="/plugin/login/images/logo_admin_login.png"/>
    </div>
    <div class="formLogin">
     <form name="formLogin" id="formLogin" action="loginController.do?login" check="loginController.do?checkuser" method="post">
      <input name="userKey" type="hidden" id="userKey" value="D1B5CC2FE46C4CC983C073BCA897935608D926CD32992B5900"/>
      <div class="tip">
       <input class="userName" name="userName" type="text" id="userName" title="用户名" iscookie="true" value="admin"  nullmsg="请输入用户名!"/>
      </div>
      <div class="tip">
       <input class="password" name="password" type="password" id="password" title="密码" value="123456" nullmsg="请输入密码!"/>
      </div>
      <div class="loginButton">
       <div style="float: left; margin-left: -9px;">
        <input type="checkbox" id="on_off" name="remember" checked="ture" class="on_off_checkbox" value="0" />
        <span class="f_help">是否记住用户名 ?</span>
       </div>
       <div style="float: right; padding: 3px 0; margin-right: -12px;">
        <div>
         <ul class="uibutton-group">
          <li>
           <a class="uibutton normal" href="/admin/main/main.jsp" id="but_login">登陆</a>
          </li>
          <li>
           <a class="uibutton normal" href="#" id="forgetpass">重置</a>
          </li>
         </ul>
        </div>
       </div>
       <div class="clear"></div>
      </div>
     </form>
    </div>
   </div>
   <div class="shadow"></div>
  </div>
  <!--Login div-->
  <div class="clear"></div>
  <div id="versionBar">
   <div class="copyright">
    &copy; 版权所有
    <span class="tip"><a href="#" title="AntsClub 演示系统">AntsClub</a> (推荐使用IE8+,谷歌浏览器可以获得更快,更安全的页面响应速度)技术支持:<a href="#" title="AntsClub演示系统">AntsClub</a></span>
   </div>
  </div>
    <!-- Link JScript-->
  <script type="text/javascript" src="/js/jquery-1.8.0.min.js"></script>
  <script type="text/javascript" src="/js/jquery.cookie.js"></script>
  <script type="text/javascript" src="/plugin/login/js/jquery-jrumble.js"></script>
  <script type="text/javascript" src="/plugin/login/js/jquery.tipsy.js"></script>
  <script type="text/javascript" src="/plugin/login/js/iphone.check.js"></script>
  <script type="text/javascript" src="/plugin/login/js/login.js"></script>
 </body>
</html>