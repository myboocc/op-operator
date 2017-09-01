package com.operator.service.impl;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import com.operator.common.ServiceResponse;
import com.operator.dao.ProviderDao;
import com.operator.service.IProviderService;
import com.operator.util.Page;
import com.pricestrategy.front.operator.bean.Provider;

@Service("iProviderService")
public class ProviderServiceImpl implements IProviderService{

	@Resource
	private ProviderDao providerDao;
	
	@Override
	public List<Provider> findAll(Page page) {
		Query query = new Query();
		long count = providerDao.count(query, Provider.class);
		page.setTotalResult(new Long(count).intValue());
		query.with(new Sort(Direction.DESC,"createTime"));
		query.skip(page.getCurrentResult());
		query.limit(page.getShowCount());
		return providerDao.find(query, Provider.class);
	}

	@Override
	public void save(Provider provider) {
		Provider newProvider = new Provider();
		newProvider.setName(provider.getName());
		newProvider.setSellArea(provider.getSellArea());
		newProvider.setEfficiency(provider.getEfficiency());
		newProvider.setTimeZone(provider.getTimeZone());
		newProvider.setContacts(provider.getContacts());
		newProvider.setPccInfos(provider.getPccInfos());
		newProvider.setPrintTime(provider.getPrintTime());
		newProvider.setRefundTime(provider.getRefundTime());
		newProvider.setResignTime(provider.getResignTime());
		newProvider.setHolidayTemplateId(provider.getHolidayTemplateId());
		newProvider.setCreateTime(new Date());
		providerDao.insert(newProvider);
	}

	@Override
	public ServiceResponse<String> checkOfficeNum(String officeNum) {
		boolean exists = providerDao.checkOfficeNum(officeNum);
		if(exists){
			return ServiceResponse.createByErrorMessage("office号已存在");
		}
		return ServiceResponse.createBySuccessMessage("该office号可以使用");
	}

	@Override
	public ServiceResponse<String> deleteById(String providerId) {
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(providerId));
		int rowCount = providerDao.remove(query, Provider.class).getN();
		if(rowCount > 0){
			return ServiceResponse.createBySuccessMessage("删除成功");
		}
		return ServiceResponse.createByErrorMessage("删除失败");
	}

	@Override
	public ServiceResponse<Provider> findProviderById(String providerId) {
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(providerId));
		Provider provider = providerDao.findOne(query, Provider.class);
		if(provider != null){
			return ServiceResponse.createBySuccess(provider);
		}
		return ServiceResponse.createByErrorMessage("供应商不存在");
	}

	@Override
	public ServiceResponse<String> update(Provider provider) {
		//校验是否存在
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(provider.getId()));
		Provider oldProvider = providerDao.findOne(query, Provider.class);
		if(oldProvider == null){
			return ServiceResponse.createByErrorMessage("供应商不存在");
		}
		Update update = new Update();
		update.set("name", provider.getName());
//		update.set("address", provider.getAddress());
//		update.set("urgentContact", provider.getUrgentContact());
//		update.set("telephone", provider.getTelephone());
//		update.set("augentPhone", provider.getAugentPhone());
//		update.set("moneySettlementType", provider.getMoneySettlementType());
//		update.set("providerTimeZone", provider.getProviderTimeZone());
//		update.set("ticketContact", provider.getTicketContact());
//		update.set("settlementContact", provider.getSettlementContact());
//		update.set("workStartTime", provider.getWorkStartTime());
//		update.set("workEndTime", provider.getWorkEndTime());
//		update.set("isAuthorizePrintTicket", provider.getIsAuthorizePrintTicket());
		int resultCount = providerDao.update(query, update, Provider.class).getN();
		if(resultCount > 0){
			return ServiceResponse.createBySuccessMessage("更新成功");
		}
		return ServiceResponse.createByErrorMessage("更新失败");
	}

	@Override
	public ServiceResponse<String> removeMultiProviders(String[] ids) {
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").in(Arrays.asList(ids)));
		int rowCount = providerDao.remove(query, Provider.class).getN();
		if(rowCount == ids.length){
			//删除成功
			return ServiceResponse.createBySuccessMessage("批量删除成功");
		}
		return ServiceResponse.createByErrorMessage("批量删除失败");
	}

}
