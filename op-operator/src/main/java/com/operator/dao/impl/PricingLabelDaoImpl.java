package com.operator.dao.impl;

import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.intlgds.fare.mongoclient.MongodbClientHandler;
import com.intlgds.fare.mongoclient.MongodbHelper;
import com.operator.dao.PricingLabelDao;
import com.pricestrategy.front.operator.bean.PricingLabel;

@Repository
public class PricingLabelDaoImpl extends MongodbClientHandler<PricingLabel> implements PricingLabelDao{

	@Override
	public boolean checkOfficeNumAndProvider(String title) {
		Query query = new Query();
		query.addCriteria(Criteria.where("title").is(title));
		return MongodbHelper.getMongoTemplate().exists(query, PricingLabel.class);
	}

}
