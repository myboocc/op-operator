package com.operator.dao.impl;

import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.intlgds.fare.mongoclient.MongodbClientHandler;
import com.intlgds.fare.mongoclient.MongodbHelper;
import com.operator.dao.PccDao;
import com.pricestrategy.front.operator.bean.Pcc;

@Repository
public class PccDaoImpl extends MongodbClientHandler<Pcc> implements PccDao{

	@Override
	public boolean checkOfficeNumAndProvider(String officeNum, String provider) {
		Query query = new Query();
		query.addCriteria(Criteria.where("office").is(officeNum).and("provider").is(provider));
		return MongodbHelper.getMongoTemplate().exists(query, Pcc.class);
	}
	
}
