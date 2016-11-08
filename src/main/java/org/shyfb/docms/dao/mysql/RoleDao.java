package org.shyfb.docms.dao.mysql;

import org.shyfb.docms.entity.Role;
import java.util.List;
import java.util.Map;

/**
 * 角色管理Dao层
 * @desp
 * @author huyinghao@abchina.com
 * @date 2016年10月12日
 */
public interface RoleDao {
	
	/**
	 * 插入一条记录
	 * @param role
	 * @return
	 */
	int insert(Role role);
		
	/**
	 * 更新操作
	 * map中必须含有id
	 * @param map
	 * @return
	 */
	int update(Map<String,Object> map);
	
	/**
	 * 根据id查询角色
	 * @param id
	 * @return
	 */
	Role queryById(int id);
	
	
	/**
	 * 查询角色
	 * @param map
	 * @return
	 */
	List<Role> query(Map<String, Object> map);
	
}
