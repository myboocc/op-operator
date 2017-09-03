package com.operator.dao;

import com.intlgds.fare.mongoclient.MongodbClient;
import com.pricestrategy.front.operator.bean.Pcc;

public interface PccDao extends MongodbClient<Pcc>{
	
	boolean checkOfficeNumAndProvider(String officeNum, String provider);
	
}
