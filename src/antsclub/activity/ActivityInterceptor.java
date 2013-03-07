package antsclub.activity;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;

/**
 * ActivityInterceptor
 */
public class ActivityInterceptor implements Interceptor {
	
	public void intercept(ActionInvocation ai) {
		System.out.println("Before invoking " + ai.getActionKey());
		ai.invoke();
		System.out.println("After invoking " + ai.getActionKey());
	}
}
