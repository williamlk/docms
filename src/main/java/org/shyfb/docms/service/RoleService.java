package org.shyfb.docms.service;

import java.util.List;

import org.shyfb.docms.entity.Role;


public interface RoleService {
	
	
	
	List<Role> getRoleData();
	
	/**
	 * 通过id获得role
	 * @param id
	 * @return Role
	 */
	Role getRoleById(Integer id);
	
	
}
