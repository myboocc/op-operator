package com.operator.dao;

import com.intlgds.fare.mongoclient.MongodbClient;
import com.pricestrategy.front.operator.bean.Provider;

public interface ProviderDao extends MongodbClient<Provider>{

	boolean checkOfficeNum(String officeNum);

}
