package com.operator.dao;

import com.intlgds.fare.mongoclient.MongodbClient;
import com.pricestrategy.front.operator.bean.User;

public interface UserDao extends MongodbClient<User>{

	void updateLastLogin(User user);
	
}
