package com.operator.dao.impl;

import org.springframework.stereotype.Repository;

import com.intlgds.fare.mongoclient.MongodbClientHandler;
import com.operator.dao.PricingDao;
import com.pricestrategy.front.operator.bean.Pricing;

@Repository
public class PricingDaoImpl extends  MongodbClientHandler<Pricing> implements PricingDao{

}
