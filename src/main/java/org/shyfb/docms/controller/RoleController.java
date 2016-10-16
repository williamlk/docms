package org.shyfb.docms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.shyfb.docms.entity.Role;
import org.shyfb.docms.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 角色控制类
 * @desp
 * @author huyinghao@abchina.com
 * @date 2016年10月11日
 */
@Controller
@Scope("prototype")
public class RoleController extends BaseController{
	
	@Autowired
	private RoleService roleService;
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="/role/roleData",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> roleData(){
		resMap=new HashMap<String,Object>();
		List<Role> roles= roleService.getRoleData();
		
		if(roles != null && roles.size()>0){
			resMap.put("status", STATUS_OK);
		}else{
			resMap.put("status", STATUS_FAILED);
		}
		resMap.put("data",roles);
		return resMap;
	}
	
	public Map<String,Object> insert(){
		return resMap;
	}
	
	
}
