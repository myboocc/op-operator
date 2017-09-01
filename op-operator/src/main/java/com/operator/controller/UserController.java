package com.operator.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.operator.common.ServiceResponse;
import com.operator.service.IUserService;
import com.operator.util.Const;
import com.operator.util.Page;
import com.pricestrategy.front.operator.bean.User;

@Controller
@RequestMapping("/user")
public class UserController {

	@Resource
	private IUserService iUserService;
	
	@RequestMapping(value = "/list", method = {RequestMethod.GET,RequestMethod.POST})
	public String listUser(Page page, Model model, String keyWords){
		if(StringUtils.isNotBlank(keyWords)){
//			iUserService.findByKeyWords();
		}
		List<User> userList = iUserService.findAll(page);
		model.addAttribute("userList", userList);
		return "system/user/user_list";
	}
	
	@RequestMapping(value = "/goAddUser", method = RequestMethod.GET)
	public String goAddUser(Model model){
		return "system/user/user_edit";
	}
	
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String addUser(Model model, User user){
		User newUser = new User();
		newUser.setName(user.getName());
		newUser.setUserName(user.getUserName());
		newUser.setPassword(new SimpleHash("SHA-1", user.getUserName(), user.getPassword()).toString());
		newUser.setIp("");
		newUser.setLastLoginTime("");
		iUserService.save(newUser);
		model.addAttribute("msg", "success");
		return "common/saveResult";
	}
	
	@RequestMapping(value = "/hasUserName", method = RequestMethod.POST)
	@ResponseBody
	public ServiceResponse<String> hasUserName(Model model, String userName){
		int result = iUserService.findByUserName(userName);
		if(result > 0){
			return ServiceResponse.createByErrorMessage("用户名已存在");
		}
		return ServiceResponse.createBySuccess();
	}
	
	@RequestMapping(value = "/goEditUser", method = RequestMethod.GET)
	public String goEditUser(Model model,String userId){
		User user = iUserService.findById(userId);
		if(user != null){
			model.addAttribute("user", user);
			return "system/user/user_edit";
		}
		return null;
	}
	
	@RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
	@ResponseBody
	public ServiceResponse<String> deleteUser(String userId){
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		if(user == null){
			return ServiceResponse.createByErrorMessage("用户未登录");
		}
		if(StringUtils.isBlank(userId)){
			return ServiceResponse.createByErrorMessage("参数不完整");
		}
		//删除
		return iUserService.deleteById(userId);
	}
	
	@RequestMapping(value = "/deleteMultiUsers", method = RequestMethod.POST)
	@ResponseBody
	public ServiceResponse<String> deleteMultiUsers(String userIds){
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		if(user == null){
			return ServiceResponse.createByErrorMessage("用户未登录");
		}
		if(StringUtils.isBlank(userIds)){
			return ServiceResponse.createByErrorMessage("参数不完整");
		}
		String ids[] = userIds.split(",");
		return iUserService.removeMultiProviders(ids);
	}
	
}
