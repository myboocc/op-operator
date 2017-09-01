package com.operator.service;

import java.util.List;

import com.operator.common.ServiceResponse;
import com.operator.util.Page;
import com.pricestrategy.front.operator.bean.Provider;

public interface IProviderService {

	List<Provider> findAll(Page page);

	void save(Provider provider);

	ServiceResponse<String> checkOfficeNum(String officeNum);

	ServiceResponse<String> deleteById(String providerId);

	ServiceResponse<Provider> findProviderById(String providerId);

	ServiceResponse<String> update(Provider provider);

	ServiceResponse<String> removeMultiProviders(String[] ids);

}
