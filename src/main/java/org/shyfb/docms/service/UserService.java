package org.shyfb.docms.service;

import java.util.List;
import java.util.Map;

import org.shyfb.docms.entity.User;


public interface UserService {

	/**
	 * 删除
	 * @param id
	 * @return 0:正常，-1:修改失败,-2:id为空
	 */
	int delete(Integer id);
	
	/**
	 * 更新
	 * @param map
	 * @return 0:正常，-1:修改失败,-2:id为空
	 */
	int updateById(Map<String,Object> map);

	
	/**
	 * 通过id查询用户
	 * @param id
	 * @return
	 */
	User queryById(Integer id);
	
	
	/**
	 * 查询用户
	 * @param map
	 * @return 
	 */
	List<User> query(Map<String, Object> map);
	
	/**
	 * 登录  
	 * @param name
	 * @param password
	 * @return 0：成功，-1：用户不存在，-2：密码错误，-3：系统错误
	 */
	int login(String name,String password);
	
	/**
	 * 注册
	 * @param name
	 * @param password
	 * @param email
	 * @param phone
	 * @return 0：成功，-1:失败，-2:用户名已注册，
	 */
	int register(String name,String password,String email,String phone);

}
