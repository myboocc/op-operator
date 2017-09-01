package com.operator.dao.impl;

import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.intlgds.fare.mongoclient.MongodbClientHandler;
import com.intlgds.fare.mongoclient.MongodbHelper;
import com.operator.dao.UserDao;
import com.pricestrategy.front.operator.bean.User;

@Repository
public class UserDaoImpl extends MongodbClientHandler<User> implements UserDao{

	@Override
	public void updateLastLogin(User user) {
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(user.getId()));
		Update update = new Update();
		update.set("lastLoginTime", user.getLastLoginTime());
		MongodbHelper.getMongoTemplate().updateFirst(query, update, User.class);
	}

}
