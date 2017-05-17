package com.adc.ssh.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.adc.ssh.model.User;

public interface UserService {
	/**
	 * 增加一个用户
	 * @param user
	 */
	User addUser(User user);
	
	/**
	 * 得到一个用户
	 * @param id
	 * @return
	 */
	User getUser(Long id);
	
	/**
	 * 删除一个用户
	 * @param id
	 */
	void deleteUser(Long id);
	
	/**
	 * 得到所有用户
	 */
	
	List<User> getUsers();

}
