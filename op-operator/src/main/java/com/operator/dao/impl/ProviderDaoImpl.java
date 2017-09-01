package com.operator.dao.impl;

import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.intlgds.fare.mongoclient.MongodbClientHandler;
import com.intlgds.fare.mongoclient.MongodbHelper;
import com.operator.dao.ProviderDao;
import com.pricestrategy.front.operator.bean.Provider;

@Repository
public class ProviderDaoImpl extends MongodbClientHandler<Provider> implements ProviderDao{

	@Override
	public boolean checkOfficeNum(String officeNum) {
		Query query = new Query();
		query.addCriteria(Criteria.where("officeNumber").is(officeNum));
		return MongodbHelper.getMongoTemplate().exists(query, Provider.class);
	}

}
