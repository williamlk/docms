package org.shyfb.docms.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.shyfb.docms.aop.exception.NotLoginException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 基础控制类
 * @desp 定义公用变量和控制类使用常量
 * @author huyinghao@abchina.com
 * @date 2016年10月11日
 */
@Scope("prototype")
public class BaseController {
	protected static final String INTERNAL_SERVER_ERROR = "Internal Server Error";

	/**
	 * @desp Json返回数据
	 */
	protected Map<String, Object> resMap;

	protected final static Integer STATUS_OK = 1000;

	protected final static Integer STATUS_FAILED = 1001;

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

	@ExceptionHandler(value = NotLoginException.class)
	protected String loginException(HttpServletRequest request, HttpSession session) {
//		resMap=new HashMap<>();
//		resMap.put("msg", "用户未登录");
		return "user/login";
	}
}
