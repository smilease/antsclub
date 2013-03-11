package com.demo.common;

import antsclub.activity.Activity;
import antsclub.activity.ActivityController;
import antsclub.user.User;
import antsclub.user.UserController;

import com.alibaba.fastjson.JSONObject;
import com.demo.blog.Blog;
import com.demo.blog.BlogController;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.kit.StringKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;

/**
 * API引导式配置
 */
public class DemoConfig extends JFinalConfig {
	
	/**
	 * 配置常量
	 */
	public void configConstant(Constants me) {
		loadPropertyFile("a_little_config.txt");				// 加载少量必要配置，随后可用getProperty(...)获取值
		me.setDevMode(getPropertyToBoolean("devMode", false));
		me.setViewType(ViewType.JSP); 							// 设置视图类型为Jsp，否则默认为FreeMarker
	}
	
	/**
	 * 配置路由
	 */
	public void configRoute(Routes me) {
		me.add("/", CommonController.class);
		me.add("/blog", BlogController.class);
		me.add("/activity", ActivityController.class);
		me.add("/user",UserController.class);
	}
	
	/**
	 * 配置插件
	 */
	public void configPlugin(Plugins me) {
		// 配置C3p0数据库连接池插件
		//C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcUrl"), getProperty("user"), getProperty("password").trim());
		//me.add(c3p0Plugin);
		
		String json = java.lang.System.getenv("VCAP_SERVICES");
		String dbname,username,password,host,port;
		C3p0Plugin c3p0Plugin;
		if(StringKit.isBlank(json)){
			c3p0Plugin=new C3p0Plugin(getProperty("jdbcUrl"), getProperty("user"), getProperty("password").trim());
		}else{
			JSONObject credentials = JSONObject.parseObject(json).getJSONArray("mysql-5.1").getJSONObject(0).getJSONObject("credentials");
			dbname =  credentials.getString("name");
		    username = credentials.getString("username");
			password = credentials.getString("password");
			host      = credentials.getString("host");
			port      = credentials.getString("port");
			c3p0Plugin = new C3p0Plugin("jdbc:mysql://" + host + ":" + port + "/" + dbname, username, password);
		}
		me.add(c3p0Plugin);
		// 配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		me.add(arp);
		arp.addMapping("blog", Blog.class);	// 映射blog 表到 Blog模型
		arp.addMapping("activity", Activity.class);	// 映射Activity 表到 Activity模型
		arp.addMapping("user", User.class);
	}
	
	/**
	 * 配置全局拦截器
	 */
	public void configInterceptor(Interceptors me) {
		
	}
	
	/**
	 * 配置处理器
	 */
	public void configHandler(Handlers me) {
		
	}
	
	/**
	 * 运行此 main 方法可以启动项目，此main方法可以放置在任意的Class类定义中，不一定要放于此
	 */
	public static void main(String[] args) {
		JFinal.start("WebRoot", 80, "/", 5);
	}
}
