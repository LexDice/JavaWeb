package com.adc.ssh.dao;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;

import com.adc.ssh.dao.UserDao;
import com.adc.ssh.model.User;

public class UserDaoTest {
	ApplicationContext ac = null;
	UserDao userDao = null;
	@Before
	public void testBefore() {
		ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		userDao = (UserDao) ac.getBean("userDao");
	}

	@After
	public void testAfter() {
	}

	@Test
	public void testFindOne() {
		
		UserDao userDao = (UserDao) ac.getBean("userDao");
		System.out.println(userDao.findOne(1l));
	}

	@Test
	public void test() {
		List<User> us = (List<User>)userDao.findAll();
		System.out.println(us.size());
	}
	

}
