package org.shyfb.docms.aop.aspect;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.shyfb.docms.aop.exception.NotLoginException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * @desp 用户动作AOP切入点
 * @author liulichao <liulichao@ruc.edu.cn>
 *
 */
@Aspect
@Component
@Scope("prototype")
public class UserAspect {
	
	@Autowired
	private HttpSession session;
	
	/**
	 * @desp 登录验证
	 */
	@Before("execution(@org.shyfb.docms.aop.annotation.LoginCheck * org.shyfb.docms.controller..*.*(..))")
	public void loginCheck() throws Throwable{
		if(session.getAttribute("user") == null){
			throw new NotLoginException();
		}
	}

}
