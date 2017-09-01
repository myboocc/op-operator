package com.operator.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.operator.bean.User;
import com.operator.common.ServiceResponse;
import com.operator.service.IUserService;
import com.operator.util.Page;

@Service("iUserService")
public class UserServiceImpl implements IUserService{

	@Override
	public ServiceResponse<User> login(String username, String password) {
		if("admin".equals(username) && "1".equals(password)){
			User user = new User();
			user.setName("admin");
			user.setUserName(username);
			return ServiceResponse.createBySuccess(user);
		}
		return ServiceResponse.createByErrorMessage("userError");
	}

	@Override
	public ServiceResponse<String> register(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> findAll(Page page) {
		List<User> userList = new ArrayList<User>();
		//dao层访问
		return userList;
	}

	@Override
	public User findById(String userId) {
		
		return null;
	}

}
