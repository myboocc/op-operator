package com.operator.service;

import java.util.List;

import com.operator.common.ServiceResponse;
import com.operator.util.Page;
import com.pricestrategy.front.operator.bean.PricingLabel;
import com.pricestrategy.front.operator.bean.User;

public interface IPricingLabelService {

	ServiceResponse<String> checkLabelTitle(String title);

	void save(PricingLabel pricingLabel, User user);

	List<PricingLabel> findAll(Page page);

}
