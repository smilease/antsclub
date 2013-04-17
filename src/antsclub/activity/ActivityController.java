package antsclub.activity;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import antsclub.common.EasyuiDataGridJson;
import antsclub.common.Json;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

/**
 * ActivityController
 */
@Before(ActivityInterceptor.class)
public class ActivityController extends Controller {
	
	public void index() {
		String typeCode=getPara(0);
		typeCode="badminton";
		List<Activity> badmintonList=Activity.dao.find("select * from activity " +
				" where typeCode='"+typeCode+"' "+
				" order by createTime desc");
		typeCode="billiards";
		List<Activity> billiardsList=Activity.dao.find("select * from activity " +
				" where typeCode='"+typeCode+"' "+
				" order by createTime desc");
		typeCode="swimming";
		List<Activity> swimmingList=Activity.dao.find("select * from activity " +
				" where typeCode='"+typeCode+"' "+
				" order by createTime desc");
		//render("act_add.jsp");
		JSONObject json = new JSONObject();
		json.put("badmintonList", badmintonList);
		json.put("billiardsList", billiardsList);
		json.put("swimmingList", swimmingList);
		renderJson(JsonKit.toJson(json));
	}
	public void datagrid() {
		List<Activity> rows=Activity.dao.find("select * from activity order by id asc");
		EasyuiDataGridJson j=new EasyuiDataGridJson();
		j.setTotal(new Long(3));
		j.setRows(rows);
		renderJson(JsonKit.toJson(j));
	}
	public void add() {
	}
	
	//@Before(ActivityValidator.class)
	public void save() {
		try{
			Activity a=getModel(Activity.class);
			a.set("id", UUID.randomUUID().toString());
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			String currentTime=df.format(new Date());// new Date()为获取当前系统时间
			a.set("createTime", currentTime);
			a.set("updateTime", currentTime);
			boolean b=a.save();
			if(b){
				setAttr("msg", "活动发布成功");
				render("/index.jsp");
			}else{
				setAttr("msg", "活动发布失败");
				render("/activity/act_add.jsp");
			}
		}catch(Exception e){
			setAttr("msg", e);
			render("/activity/act_add.jsp");
		}
		
		
	}
	
	public void edit() {
		Activity a=Activity.dao.findById(getPara(0));
		renderJson(a);
	}
	public void view() {
		String actId=getPara(0);
		String sql="select a.*,ua.user_name as uname from activity a "
					+" left join user_activity ua on a.id=ua.activity_id "
					+" where a.id='"+actId+"' order by ua.sign_time";
		List l=Db.find(sql);
		renderJson(l);
	}
	
	public void update() {
		getModel(Activity.class).update();
		renderJson("");
	}
	
	public void delete() {
		String[] ids= getPara().split(",");
		for(int i=0,len=ids.length;i<len;i++){
			Activity.dao.deleteById(ids[i]);
		}
		redirect("/activity");
	}
	
	//报名
	public void sign(){
		String actId=getPara(0);
		String uid=getSessionAttr("uid");
		String uname=getSessionAttr("uname");
		JSONObject json = new JSONObject();
		UserActivity ua=new UserActivity();
		Record r= Db.findFirst("select count(*) as num from " +
				" user_activity where activity_id='"+actId+"' and" +
						" user_id='"+uid+"'");
		if(r.getLong("num").intValue()>0){
			json.put("msg","这个活动您已经报过名了，不能重复报名");
			json.put("success", false);
		}else{
			ua.set("id", UUID.randomUUID().toString());
			ua.set("activity_id", actId);
			ua.set("user_id",uid);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			String currentTime=df.format(new Date());// new Date()为获取当前系统时间
			ua.set("sign_time", currentTime);
			ua.set("user_name", uname);
			ua.save();
			json.put("msg", "报名成功");
			json.put("success", true);
		}
		renderJson(JsonKit.toJson(json));
	}
	
	//取消报名
	public void undoSign(){
		String actId=getPara(0);
		String uid=getSessionAttr("uid");
		JSONObject json = new JSONObject();
		UserActivity ua=new UserActivity();
		Record r= Db.findFirst("select count(*) as num from " +
				" user_activity where activity_id='"+actId+"' and" +
						" user_id='"+uid+"'");
		if(r.getLong("num").intValue()==0){
			json.put("msg","亲，这个活动你还没有报名呢");
			json.put("success", false);
		}else{
			Db.update("delete from user_activity where activity_id='"+actId
					+"' and user_id='"+uid+"'");
			json.put("msg", "报名取消成功");
			json.put("success", true);
		}
		renderJson(JsonKit.toJson(json));
	}
}


