package com.operator.service;

import java.util.List;

import com.operator.common.ServiceResponse;
import com.operator.util.Page;
import com.pricestrategy.front.operator.bean.Pcc;

public interface IPccService {

	ServiceResponse<String> checkOfficeNumAndProvider(String officeNum, String provider);

	void save(Pcc pcc);

	List<Pcc> findAll(Page page);
	
}
