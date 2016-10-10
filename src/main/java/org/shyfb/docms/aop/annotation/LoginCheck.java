package org.shyfb.docms.aop.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @desp 检查系统登录状态注解
 * @author liulichao <liulichao@ruc.edu.cn>
 *
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface LoginCheck {
	
	public String name()default "";
}
