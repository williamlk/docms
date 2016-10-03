package org.shyfb.docms.service;

import java.util.List;

import org.shyfb.docms.entity.User;
import org.springframework.stereotype.Service;

@Service
public interface UserService {

	int insert(String name,String password,String email,String phone);

	int delete(int id);

	int update(User user);

	User queryById(int id);

	User queryByName(String name);

	List<User> queryAll(int offset, int limit);

}
