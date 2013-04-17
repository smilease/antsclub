package antsclub.common;

import com.jfinal.core.Controller;

/**
 * CommonController
 */
public class CommonController extends Controller {
	
	public void index() {
		//render("/common/index.jsp");
		render("/index.jsp");
	}
}
