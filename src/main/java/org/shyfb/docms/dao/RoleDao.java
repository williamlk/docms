package org.shyfb.docms.dao;

import org.shyfb.docms.entity.Role;
import java.util.List;
public interface RoleDao {

	int insert(Role role);
	
	int delete(int id);
	
	int update(Role role);
	
	Role queryById(int id);
	
	Role queryByName(String name);
	
	List<Role> queryAll(int offset,int limit);
}
