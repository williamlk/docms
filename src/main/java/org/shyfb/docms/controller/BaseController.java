package org.shyfb.docms.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.shyfb.docms.aop.exception.NotLoginException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Scope("prototype")
public class BaseController {
protected static final String INTERNAL_SERVER_ERROR = "Internal Server Error";
	
	/**
	 * @desp Json返回数据
	 */
	protected Map<String, Object> resMap;
	
	@Autowired
	protected HttpServletRequest request;
	@Autowired
	protected HttpSession session;
	
	public Map<String, Object> getResMap() {
		return resMap;
	}
	public void setResMap(Map<String, Object> resMap) {
		this.resMap = resMap;
	}
	
	@ExceptionHandler(value=NotLoginException.class)
	protected String loginException(HttpServletRequest request,HttpSession session){
		return  "user/login";
	}
}
