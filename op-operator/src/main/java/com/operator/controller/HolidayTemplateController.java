package com.operator.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.operator.service.IHolidayTemplateService;
import com.operator.util.Page;
import com.pricestrategy.front.operator.bean.HolidayTemplate;

@Controller
@RequestMapping("/holidayTemplate")
public class HolidayTemplateController {
	
	@Resource
	private IHolidayTemplateService iHolidayTemplateService;
	
	@RequestMapping(value = "/list", method = {RequestMethod.GET})
	public String list(Page page, Model model){
		List<HolidayTemplate> holidayTemplateList = iHolidayTemplateService.findAll(page);
		model.addAttribute("holidayTemplateList", holidayTemplateList);
		return "holidayTemplate/list";
//		return "order/list";
	}
	
	@RequestMapping(value = "/goAddHoliday", method = {RequestMethod.GET})
	public String goAddHoliday(){
		return "holidayTemplate/edit";
	}
	
	@RequestMapping(value = "/addHolidayTemplate", method = {RequestMethod.POST})
	public String addHolidayTemplate(Model model, HolidayTemplate holidayTemplate){
		iHolidayTemplateService.save(holidayTemplate);
		
		return "redirect:list";
	}
	

}
