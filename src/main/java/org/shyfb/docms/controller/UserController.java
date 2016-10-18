package org.shyfb.docms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.shyfb.docms.aop.annotation.LoginCheck;
import org.shyfb.docms.entity.Role;
import org.shyfb.docms.entity.User;
import org.shyfb.docms.service.RoleService;
import org.shyfb.docms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 用户控制类
 * @desp
 * @author huyinghao@abchina.com
 * @date 2016年10月11日
 */

//TODO 修改RequestMethod,讨论明确要不要参数验证
@Controller
@Scope("prototype")
public class UserController extends BaseController{
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> login(HttpServletRequest request, HttpSession session) {
		resMap = new HashMap<String, Object>();
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		int status = userService.login(name, password);
		if (status == 0) {
			Map<String,Object> map = new HashMap<>();
			map.put("name", name);
			User user= userService.query(map).get(0);
			Role role=roleService.getRoleById(user.getRoleId());
			user.setRole(role);
			session.setAttribute("user",user);
//			session.setAttribute("role", userRole);
			resMap.put("status", STATUS_OK);
		} else if (status == -1) {
			resMap.put("error", "用户不存在");
		} else if (status == -2) {
			resMap.put("error", "密码错误");
		}
//		else if (status == -3) {
//			resMap.put("error", "系统错误");
//		}
		return resMap;
	}
	
	@RequestMapping(value="/user/register",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> register(HttpServletRequest request, HttpSession session){
		resMap=new HashMap<>();
		//TODO 明确前端工作
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		int status = userService.register(name, password, email, phone);
		if(status == 0){
			resMap.put("status", STATUS_OK);
		}
		else if(status == -1){
			resMap.put("error", "系统错误");
		}else if(status == -2){
			resMap.put("error", "该用户名已经被注册");
		}
		return resMap;
	}
	
	@LoginCheck
	@RequestMapping(value="/user/userData",method= RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> userData(){
		resMap=new HashMap<String,Object>();
		List<User> users=userService.query(new HashMap<String,Object>());
		resMap.put("data", users);
		return resMap;
	}
	
	
	
	
//	@LoginCheck
	@RequestMapping(value="/user/logout",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> logout(HttpSession session){
		resMap=new HashMap<String,Object>();
		session.removeAttribute("user");
		resMap.put("status", STATUS_OK);
		resMap.put("msg","用户已注销");
		return resMap;
	}
	
}
