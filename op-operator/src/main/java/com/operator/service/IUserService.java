package com.operator.service;

import java.util.List;

import com.operator.common.ServiceResponse;
import com.operator.util.Page;
import com.pricestrategy.front.operator.bean.User;

public interface IUserService {
	
	ServiceResponse<User> login(String username, String password);

    ServiceResponse<String> register(User user);

    /**
     * 查询所有用户列表
     * @param page 
     * @return
     */
	List<User> findAll(Page page);

	/**
	 * 根据id查询
	 * @param userId
	 * @return
	 */
	User findById(String userId);

	void save(User newUser);

	int findByUserName(String userName);

	ServiceResponse<String> deleteById(String userId);

	ServiceResponse<String> removeMultiProviders(String[] ids);

	void updateLastLogin(User user);
	

}
