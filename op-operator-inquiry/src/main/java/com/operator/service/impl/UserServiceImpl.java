package com.operator.service.impl;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.operator.common.ServiceResponse;
import com.operator.dao.UserDao;
import com.operator.service.IUserService;
import com.operator.util.Page;
import com.pricestrategy.front.operator.bean.User;

@Service("iUserService")
public class UserServiceImpl implements IUserService{
	
	@Resource
	private UserDao userDao;

	@Override
	public ServiceResponse<User> login(String username, String password) {
//		if("admin".equals(username) && "1".equals(password)){
//			User user = new User();
//			user.setName("admin");
//			user.setUserName(username);
//			return ServiceResponse.createBySuccess(user);
//		}
		Query query = new Query();
		query.addCriteria(Criteria.where("userName").is(username).and("password").is(password));
		User user = userDao.findOne(query, User.class);
		if(user != null){
			user.setPassword(StringUtils.EMPTY);
			return ServiceResponse.createBySuccess(user);
		}
		return ServiceResponse.createByErrorMessage("userError");
	}

	@Override
	public ServiceResponse<String> register(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> findAll(Page page) {
		Query query = new Query();
		long count = userDao.count(query, User.class);
		page.setTotalResult(new Long(count).intValue());
		query.with(new Sort(Direction.DESC,"createTime"));
		query.skip(page.getCurrentResult());
		query.limit(page.getShowCount());
		return userDao.find(query, User.class);
	}

	@Override
	public User findById(String userId) {
		
		return null;
	}

	@Override
	public void save(User newUser) {
		userDao.insert(newUser);
	}

	@Override
	public int findByUserName(String userName) {
		Query query = new Query();
		query.addCriteria(new Criteria().where("userName").is(userName));
		User user = userDao.findOne(query, User.class);
		if(user != null){
			return 1;
		}
		return 0;
	}

	@Override
	public ServiceResponse<String> deleteById(String userId) {
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(userId));
		int rowCount = userDao.remove(query, User.class).getN();
		if(rowCount > 0){
			return ServiceResponse.createBySuccessMessage("删除成功");
		}
		return ServiceResponse.createByErrorMessage("删除失败");
	}

	@Override
	public ServiceResponse<String> removeMultiProviders(String[] ids) {
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").in(Arrays.asList(ids)));
		int rowCount = userDao.remove(query, User.class).getN();
		if(rowCount == ids.length){
			//删除成功
			return ServiceResponse.createBySuccessMessage("批量删除成功");
		}
		return ServiceResponse.createByErrorMessage("批量删除失败");
	}

	@Override
	public void updateLastLogin(User user) {
		userDao.updateLastLogin(user);
	}

}
