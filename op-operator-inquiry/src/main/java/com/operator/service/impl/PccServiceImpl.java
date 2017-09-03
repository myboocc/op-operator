package com.operator.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.operator.common.ServiceResponse;
import com.operator.dao.PccDao;
import com.operator.service.IPccService;
import com.operator.util.Page;
import com.pricestrategy.front.operator.bean.Pcc;

@Service("iPccService")
public class PccServiceImpl implements IPccService{
	
	@Resource
	private PccDao pccDao;

	@Override
	public ServiceResponse<String> checkOfficeNumAndProvider(String officeNum, String provider) {
		boolean exists = pccDao.checkOfficeNumAndProvider(officeNum, provider);
		if(exists){
			return ServiceResponse.createByErrorMessage("pcc号和供应商已存在");
		}
		return ServiceResponse.createBySuccess();
	}

	@Override
	public void save(Pcc pcc) {
		Pcc newPcc = new Pcc();
		newPcc.setOffice(pcc.getOffice());
		newPcc.setProvider(pcc.getProvider());
		newPcc.setRemark(pcc.getRemark());
		newPcc.setCreateTime(new Date());
		pccDao.insert(newPcc);
	}

	@Override
	public List<Pcc> findAll(Page page) {
		Query query = new Query();
		long count = pccDao.count(query, Pcc.class);
		page.setTotalResult(new Long(count).intValue());
		query.with(new Sort(Direction.DESC,"createTime"));
		query.skip(page.getCurrentResult());
		query.limit(page.getShowCount());
		return pccDao.find(query, Pcc.class);
	}

}
