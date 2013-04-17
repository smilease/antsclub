package antsclub.user;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import antsclub.common.Encrypt;

import com.alibaba.fastjson.JSON;
import com.jfinal.core.Controller;
import javax.servlet.http.HttpSession;

public class UserController extends Controller{
	public void index(){
		
	}
	public void save(){
		try{
			User user=getModel(User.class);
			user.set("id", UUID.randomUUID().toString());
			user.set("pwd", Encrypt.md5(user.getStr("pwd")));
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			String currentTime=df.format(new Date());// new Date()为获取当前系统时间
			user.set("create_time", currentTime);
			boolean b=user.save();
			if(b){
				String uname=user.getStr("uname");
				String pwd=user.getStr("pwd");
				List<User> l=User.dao.find("select id,nickname from user where uname='"
											+uname+"' and pwd='"+pwd+"'");

				if(l.size()>0){
					HttpSession session=getSession();
					String nickname=l.get(0).getStr("nickname");
					if(nickname!=null&&!("").equals(nickname)){
						uname=nickname;
					}
					session.setAttribute("uname", uname);
					session.setAttribute("uid", l.get(0).get("id"));
					setAttr("msg", "注册成功,欢迎: "+uname);
					render("/index.jsp");
				}else{
					setAttr("msg", "注册成功，请登录");
					render("/user/login.jsp");
				}
			}else{
				setAttr("msg", "注册失败");
				render("/user/register.jsp");
			}
		}catch(Exception e){
			setAttr("msg", e);
			render("/user/register.jsp");
		}
		
		
	}	
	public void login(){
		String uname=getPara("user.uname");
		String pwd=Encrypt.md5(getPara("user.pwd"));
		List<User> l=User.dao.find("select id,nickname from user where uname='"
									+uname+"' and pwd='"+pwd+"'");

		if(l.size()>0){
			HttpSession session=getSession();
			String nickname=l.get(0).getStr("nickname");
			if(nickname!=null&&!("").equals(nickname)){
				session.setAttribute("uname", nickname);
			}else{
				session.setAttribute("uname", uname);
			}
			session.setAttribute("uid", l.get(0).get("id"));
			setAttr("msg", "登陆成功");
			render("/index.jsp");
		}else{
			setAttr("msg", "用户名或者密码错误");
			render("/user/login.jsp");
		}
	}
	public void logout(){
		getSession().removeAttribute("uname");
		redirect("/index.jsp");
	}
}
