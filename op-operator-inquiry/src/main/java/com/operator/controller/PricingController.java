package com.operator.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.operator.common.ServiceResponse;
import com.operator.service.IPccService;
import com.operator.service.IPricingLabelService;
import com.operator.service.IPricingService;
import com.operator.util.Const;
import com.operator.util.Page;
import com.pricestrategy.front.operator.bean.Pcc;
import com.pricestrategy.front.operator.bean.Pricing;
import com.pricestrategy.front.operator.bean.PricingLabel;
import com.pricestrategy.front.operator.bean.User;

@Controller
@RequestMapping("/pricing")
public class PricingController {
	
	@Resource
	private IPricingService iPricingService;
	
	@Resource
	private IPccService iPccService;
	
	@Resource
	private IPricingLabelService iPricingLabelService;
	
	@RequestMapping(value = "/list", method = {RequestMethod.GET,RequestMethod.POST})
	public String list(Page page, Model model){
		
		
		return "pricing/list";
	}
	
	@RequestMapping(value = "/labelList", method = {RequestMethod.GET,RequestMethod.POST})
	public String labelList(Page page, Model model){
		List<PricingLabel> pricingLabels = iPricingLabelService.findAll(page);
		model.addAttribute("pricingLabels", pricingLabels);
		return "pricing/labelList";
	}
	@RequestMapping(value = "/labelListAjax", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Object[] labelListAjax(Page page, Model model){
		List<PricingLabel> pricingLabelList = iPricingLabelService.findAll(page);
		return pricingLabelList.toArray();
	}
	
	@RequestMapping(value = "/pccList", method = {RequestMethod.GET,RequestMethod.POST})
	public String pccList(Page page, Model model){
		List<Pcc> pccList = iPccService.findAll(page);
		model.addAttribute("pccList", pccList);
		return "pricing/pccList";
	}
	@RequestMapping(value = "/pccListAjax", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Object[] pccListAjax(Page page, Model model){
		List<Pcc> pccList = iPccService.findAll(page);
		return pccList.toArray();
	}
	
	@RequestMapping(value = "/goAddPricing", method = RequestMethod.GET)
	public String goAddprovider(Page page, Model model){
		//准备政策标签数据
		List<PricingLabel> pricingLabelList = iPricingLabelService.findAll(page);
		model.addAttribute("pricingLabelList", pricingLabelList);
		
		return "pricing/edit";
	}
	
	
	@RequestMapping(value = "/goAddpcc", method = RequestMethod.GET)
	public String goAddOffice(Page page, Model model){
		return "pricing/pccEdit";
	}
	
	
	@RequestMapping(value = "/goAddLabel", method = RequestMethod.GET)
	public String goAddLabel(){
		return "pricing/labelEdit";
	}
	
	@RequestMapping(value = "/addPricingLabel", method = RequestMethod.POST)
	@ResponseBody
	public ServiceResponse<String> addPricingLabel(PricingLabel pricingLabel){
		//校验title是否存在
		ServiceResponse<String> checkResult = iPricingLabelService.checkLabelTitle(pricingLabel.getTitle());
		if(!checkResult.isSuccess()){
			return ServiceResponse.createByErrorMessage("标签名称已存在");
		}
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		if(user == null){
			return ServiceResponse.createByErrorMessage("用户未登录");
		}
		iPricingLabelService.save(pricingLabel, user);
		return ServiceResponse.createBySuccess();
	}
	
	@RequestMapping(value = "/addPcc", method = RequestMethod.POST)
	@ResponseBody
	public ServiceResponse<String> addPcc(Pcc pcc){
		//校验officeNum是否存在
		ServiceResponse<String> checkResult = iPccService.checkOfficeNumAndProvider(pcc.getOffice(), pcc.getProvider());
		if(!checkResult.isSuccess()){
			return ServiceResponse.createByErrorMessage("pcc号和供应商已存在");
		}
		iPccService.save(pcc);
		return ServiceResponse.createBySuccess();
	}
	
	@RequestMapping(value = "/addPricing", method = RequestMethod.POST)
	public String savePolicy(Pricing pricing, HttpServletRequest request){
//		System.out.println("pcc=> " + pricing.getPcc());
		System.out.println("request pricing==> " + new Gson().toJson(pricing));
		iPricingService.save(pricing, request);
		
		return "redirect:list";
	}
	
	@RequestMapping("/test")
	@ResponseBody
    public String test(Date birthday){
        System.out.println(birthday);
        System.out.println(birthday);
        return birthday.toString();
    }

}
