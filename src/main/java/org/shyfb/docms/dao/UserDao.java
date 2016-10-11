package org.shyfb.docms.dao;

import java.util.List;
import java.util.Map;

import org.shyfb.docms.entity.User;

/**
 * 用户dao
 * @desp
 * @author huyinghao@abchina.com
 * @date 2016年10月10日
 */
public interface UserDao {
	
	/**
	 * 插入一个用户
	 * @param user
	 * @return 0表示插入失败，1表示插入成功
	 */
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