package antsclub.activity;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * ActivityValidator.
 */
public class ActivityValidator extends Validator {
	
	protected void validate(Controller controller) {
		validateRequiredString("activity.title", "titleMsg", "请输入活动标题!");
		validateRequiredString("activity.content", "contentMsg", "请输入活动内容!");
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Activity.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/activity/save"))
			controller.render("add.jsp");
		else if (actionKey.equals("/activity/update"))
			controller.render("edit.jsp");
	}
}
