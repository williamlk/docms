package org.shyfb.docms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.shyfb.docms.common.util.EncoderHandler;
import org.shyfb.docms.dao.UserDao;
import org.shyfb.docms.entity.User;
import org.shyfb.docms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao ;
	
	
	@Override
	public int delete(Integer id) {
		if(id==null){
			return -2;
		}
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("del", 1);
		int result = userDao.update(map);
		if(result==1){
			return 0;
		}else{
			return -1;
		}
	}

	@Override
	public int updateById(Map<String,Object> map) {
		//update 返回的数字代表改动的行数
		int result = userDao.update(map);
		if(map.get("id")!=null){
			if(result==1){
				return 0;
			}else{
				return -1;
			}
		}else{
			return -2;
		}
	}

	@Override
	public User queryById(Integer id) {
		User user= userDao.queryById(id);
		return user;
	}

	@Override
	public List<User> query(Map<String, Object> map) {
		List<User> users = userDao.query(map);
		return users;
	}
	
	@Override
	public int login(String name, String password) {
		Map<String,Object> map = new HashMap<>();
		map.put("name", name);
		List<User> users;
		try{
			users = userDao.query(map);
		}catch(Exception e){
			return -3;
		}
		if(users.size()>0){
			User user = users.get(0);
			if(user.getPassword().equals(EncoderHandler.encodeByMD5(password))){
				return 0;
			}else{
				return -2;
			}
		}else{
			return -1;
		}
	}

	@Override
	public int register(String name, String password, String email, String phone) {
		Map<String,Object> map = new HashMap<>();
		map.put("name",name);
		List<User> users= userDao.query(map);
		if(users.size()!=0){
			return -2;
		}
		User user = new User();
		user.setName(name);
		user.setPassword(EncoderHandler.encodeByMD5(password));
		user.setPhone(phone);
		user.setEmail(email);
		user.setDel(0);
		user.setStatus(1);
		int result= userDao.insert(user);
		if(result == 1) 
			return 0;
		else{
			return -1;
		}
	}
	
}
