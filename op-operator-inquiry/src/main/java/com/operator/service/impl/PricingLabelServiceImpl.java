package com.operator.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.operator.common.ServiceResponse;
import com.operator.dao.PricingLabelDao;
import com.operator.service.IPricingLabelService;
import com.operator.util.Page;
import com.pricestrategy.front.operator.bean.Pcc;
import com.pricestrategy.front.operator.bean.PricingLabel;
import com.pricestrategy.front.operator.bean.User;

@Service("iPricingLabelService")
public class PricingLabelServiceImpl implements IPricingLabelService{

	@Resource
	private PricingLabelDao pricingLabelDao;
	
	@Override
	public ServiceResponse<String> checkLabelTitle(String title) {
		boolean exists = pricingLabelDao.checkOfficeNumAndProvider(title);
		if(exists){
			return ServiceResponse.createByErrorMessage("标签名称已存在");
		}
		return ServiceResponse.createBySuccess();
	}

	@Override
	public void save(PricingLabel pricingLabel, User user) {
		PricingLabel newPricingLabel = new PricingLabel();
		newPricingLabel.setTitle(pricingLabel.getTitle());
		newPricingLabel.setRemark(pricingLabel.getRemark());
		newPricingLabel.setOperatorKey(user.getId());
		newPricingLabel.setOperatorName(user.getName());
		newPricingLabel.setUpdateTime(new Date());
		pricingLabelDao.insert(newPricingLabel);
	}

	@Override
	public List<PricingLabel> findAll(Page page) {
		Query query = new Query();
		long count = pricingLabelDao.count(query, PricingLabel.class);
		page.setTotalResult(new Long(count).intValue());
		query.with(new Sort(Direction.DESC,"updateTime"));
		query.skip(page.getCurrentResult());
		query.limit(page.getShowCount());
		return pricingLabelDao.find(query, PricingLabel.class);
	}

}
