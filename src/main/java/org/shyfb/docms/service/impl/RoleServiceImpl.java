package org.shyfb.docms.service.impl;

import java.util.HashMap;
import java.util.List;

import org.shyfb.docms.dao.RoleDao;
import org.shyfb.docms.entity.Role;
import org.shyfb.docms.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl implements RoleService{
	
	@Autowired
	private RoleDao roleDao;
	
	@Override
	public List<Role> getRoleData() {
		return roleDao.query(new HashMap<String,Object>());
	}

	@Override
	public Role getRoleById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
