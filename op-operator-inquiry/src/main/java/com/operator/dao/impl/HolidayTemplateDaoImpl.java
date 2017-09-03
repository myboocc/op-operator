package com.operator.dao.impl;

import org.springframework.stereotype.Repository;

import com.intlgds.fare.mongoclient.MongodbClientHandler;
import com.operator.dao.HolidayTemplateDao;
import com.pricestrategy.front.operator.bean.HolidayTemplate;

@Repository
public class HolidayTemplateDaoImpl extends MongodbClientHandler<HolidayTemplate> implements HolidayTemplateDao{
	
	

}
