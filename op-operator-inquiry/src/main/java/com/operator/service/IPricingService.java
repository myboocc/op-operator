package com.operator.service;

import javax.servlet.http.HttpServletRequest;

import com.pricestrategy.front.operator.bean.Pricing;

public interface IPricingService {

	void save(Pricing pricing, HttpServletRequest request);


}
