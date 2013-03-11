package antsclub.user;

import java.util.List;
import java.util.UUID;

import com.jfinal.core.Controller;

public class UserController extends Controller{
	public void index(){
		
	}
	public void save(){
		User user=getModel(User.class);
		user.set("id", UUID.randomUUID().toString());
		user.save();
		redirect("/index.html");
	}	
	public void login(){
		String name=getPara("user.name");
		String password=getPara("user.password");
		List<User> l=User.dao.find("select * from user where name='"
									+name+"' and password='"+password+"'");
		if(l.size()>0){
			redirect("/index.html");
		}
	}
}
