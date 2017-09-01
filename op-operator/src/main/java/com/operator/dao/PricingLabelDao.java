package com.operator.dao;

import com.intlgds.fare.mongoclient.MongodbClient;
import com.pricestrategy.front.operator.bean.PricingLabel;

public interface PricingLabelDao extends MongodbClient<PricingLabel> {

	boolean checkOfficeNumAndProvider(String title);

}
