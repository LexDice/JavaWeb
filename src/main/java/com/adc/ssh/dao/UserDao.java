package com.adc.ssh.dao;

import org.springframework.data.repository.CrudRepository;

import com.adc.ssh.model.User;
/**
 * 用户Dao
 *
 */
public interface UserDao extends CrudRepository<User,Long>{
}
