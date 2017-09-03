package com.operator.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.operator.service.IHolidayTemplateService;
import com.operator.util.Page;
import com.pricestrategy.front.operator.bean.DateConfig;
import com.pricestrategy.front.operator.bean.EmailTemplate;
import com.pricestrategy.front.operator.bean.HolidayTemplate;
import com.pricestrategy.front.operator.bean.WeekendConfig;

@Controller
@RequestMapping("/emailTemplate")
public class EmailTemplateController {
	
//	@Resource
//	private IEmailTemplateService iEmailTemplateService;
	
	@RequestMapping(value = "/list", method = {RequestMethod.GET})
	public String list(Page page, Model model){
//		List<EmailTemplate> EmailTemplateList = iEmailTemplateService.findAll(page);
//		model.addAttribute("emailTemplateList", emailTemplateList);
		return "emailTemplate/list";
//		return "order/list";
	}
	
	@RequestMapping(value = "/goAddEmail", method = {RequestMethod.GET})
	public String goAddEmail(){
		return "emailTemplate/edit";
	}
	
	@RequestMapping(value = "/addEmailTemplate", method = {RequestMethod.POST})
	public String addEmailTemplate(Model model, EmailTemplate emailTemplate){
//		iEmailTemplateService.save(emailTemplate);
		
		return "redirect:list";
	}
	

}
