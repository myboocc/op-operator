package com.operator.service;

import java.util.List;

import com.operator.util.Page;
import com.pricestrategy.front.operator.bean.HolidayTemplate;

public interface IHolidayTemplateService {

	List<HolidayTemplate> findAll(Page page);

	void save(HolidayTemplate holidayTemplate);

	HolidayTemplate getById(String holidayTemplateId);

}
