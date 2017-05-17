package com.adc.ssh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adc.ssh.dao.UserDao;
import com.adc.ssh.model.User;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;

	@Override
	public User addUser(User user) {
		return userDao.save(user);
	}

	@Override
	public User getUser(Long id) {
		return userDao.findOne(id);
	}

	@Override
	public void deleteUser(Long id) {
		userDao.delete(id);
	}

	@Override
	public List<User> getUsers() {
		return (List<User>) userDao.findAll();
	}


}
