package antsclub.activity;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

/**
 * ActivityController
 */
@Before(ActivityInterceptor.class)
public class ActivityController extends Controller {
	
	public void index() {
		setAttr("activityList", Activity.dao.find("select * from activity order by id asc"));
		render("activity.jsp");
	}
	
	public void add() {
	}
	
	@Before(ActivityValidator.class)
	public void save() {
		getModel(Activity.class).save();
		redirect("/activity");
	}
	
	public void edit() {
		setAttr("activity", Activity.dao.findById(getParaToInt()));
	}
	
	@Before(ActivityValidator.class)
	public void update() {
		getModel(Activity.class).update();
		redirect("/activity");
	}
	
	public void delete() {
		Activity.dao.deleteById(getParaToInt());
		redirect("/activity");
	}
}


