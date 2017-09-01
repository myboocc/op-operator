package com.operator.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.operator.bean.User;
import com.operator.service.IUserService;
import com.operator.util.Page;

@Controller
@RequestMapping("/user")
public class UserController {

	@Resource
	private IUserService iUserService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listUser(Page page, Model model){
		List<User> userList = iUserService.findAll(page);
		
		model.addAttribute("userList", userList);
		return "system/user/user_list";
	}
	
	@RequestMapping(value = "/goAddUser", method = RequestMethod.GET)
	public String goAddUser(Model model){
		return "system/user/user_edit";
	}
	
	@RequestMapping(value = "/hasUserName", method = RequestMethod.GET)
	public String hasUserName(Model model){
		return "system/user/user_edit";
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
	
}
