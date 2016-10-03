package org.shyfb.docms.dao;

import java.util.List;

import org.shyfb.docms.entity.User;

public interface UserDao {
	
	int insert(User user);
	
	int delete(int id);
	
	int update(User user);
	
	User queryById(int id);
	
	User queryByName(String name);
	
	List<User> queryAll(int offset,int limit);
	
}
