package org.shyfb.docms.dao;

import java.util.List;
import java.util.Map;

import org.shyfb.docms.entity.User;

public interface UserDao {
	
	int insert(User user);
	/**
	 * 更新，要给id
	 * @param map
	 * @return
	 */
	int update(Map<String,Object> map);
	
	User queryById(Integer id);
	
	List<User> query(Map<String,Object> map);
	
}