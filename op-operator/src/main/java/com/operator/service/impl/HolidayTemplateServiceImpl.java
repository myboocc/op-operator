package com.operator.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.operator.dao.HolidayTemplateDao;
import com.operator.service.IHolidayTemplateService;
import com.operator.util.Page;
import com.pricestrategy.front.operator.bean.HolidayTemplate;

@Service("iHolidayTemplateService")
public class HolidayTemplateServiceImpl implements IHolidayTemplateService{

	@Resource
	private HolidayTemplateDao dao;
	
	@Override
	public List<HolidayTemplate> findAll(Page page) {
		Query query = new Query();
		query.with(new Sort(Direction.DESC,"createTime"));
		if(page.isPage()){
			long count = dao.count(query, HolidayTemplate.class);
			page.setTotalResult(new Long(count).intValue());
			query.skip(page.getCurrentResult());
			query.limit(page.getShowCount());	
		}
		return dao.find(query, HolidayTemplate.class);
	}

	@Override
	public void save(HolidayTemplate hoTemplate) {
		HolidayTemplate holidayTemplate = new HolidayTemplate();
		holidayTemplate.setName(hoTemplate.getName());
		holidayTemplate.setWeekends(hoTemplate.getWeekends());
		holidayTemplate.setDates(hoTemplate.getDates());
		holidayTemplate.setCreateTime(new Date());
		holidayTemplate.setUpdateTime(new Date());
		dao.insert(holidayTemplate);
	}

	@Override
	public HolidayTemplate getById(String holidayTemplateId) {
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(holidayTemplateId));
		return dao.findOne(query, HolidayTemplate.class);
	}
	

}
