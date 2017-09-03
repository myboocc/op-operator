package com.operator.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.operator.common.ServiceResponse;
import com.operator.service.IHolidayTemplateService;
import com.operator.service.IProviderService;
import com.operator.util.Const;
import com.operator.util.Page;
import com.pricestrategy.front.operator.bean.HolidayTemplate;
import com.pricestrategy.front.operator.bean.PrintTicketPcc;
import com.pricestrategy.front.operator.bean.Provider;
import com.pricestrategy.front.operator.bean.User;

@Controller
@RequestMapping("/provider")
public class ProviderController {

	@Resource
	private IProviderService iProviderService;
	
	@Resource
	private IHolidayTemplateService iHolidayTemplateService;
	
	@RequestMapping(value = "/list", method = {RequestMethod.GET,RequestMethod.POST})
	public String list(Page page, Model model){
		List<Provider> providerList = iProviderService.findAll(page);
		model.addAttribute("providerList", providerList);
		return "provider/list";
//		return "order/list";
	}
	
	@RequestMapping(value = "/goAddprovider", method = RequestMethod.GET)
	public String goAddprovider(Page page, Model model){
		page.setPage(false);
		List<HolidayTemplate> holidayTemplateList = iHolidayTemplateService.findAll(page);
		model.addAttribute("holidayTemplateList", holidayTemplateList);
		return "provider/edit";
	}
	
	@RequestMapping(value = "/addProvider", method = RequestMethod.POST)
	public String addProvider(Model model, Provider provider){
//		ServiceResponse<String> checkResult = iProviderService.checkOfficeNum(provider.getOfficeNumber());
//		if(!checkResult.isSuccess()){
//			return ServiceResponse.createByErrorMessage("office号不能为空或已存在");
//		}
		iProviderService.save(provider);
		return "redirect:list";
	}
	
	@RequestMapping(value = "/checkOfficeNum", method = RequestMethod.POST)
	@ResponseBody
	public ServiceResponse<String> checkOfficeNum(String officeNum){
		if(StringUtils.isBlank(officeNum)){
			return ServiceResponse.createByErrorMessage("office号不能为空");
		}
		return iProviderService.checkOfficeNum(officeNum);
	}
	
	@RequestMapping(value = "/goEditprovider", method = RequestMethod.GET)
	public String goEditprovider(String providerId,Model model){
		if(StringUtils.isBlank(providerId)){
			return "";
		}
		ServiceResponse<Provider> response = iProviderService.findProviderById(providerId);
		if(!response.isSuccess()){
			return "";
		}
		model.addAttribute("provider", response.getData());
		return "provider/edit";
	}
	
	@RequestMapping(value = "/editProvider", method = RequestMethod.POST)
	@ResponseBody
	public ServiceResponse<String> editProvider(Model model, Provider provider,String isAuthorize){
		if(StringUtils.isBlank(provider.getId())){
			return ServiceResponse.createByErrorMessage("参数不正确");
		}
//		if("true".equals(isAuthorize)){
//			provider.setAuthorizePrintTicket(true);
//		}else if("fasle".equals(isAuthorize)){
//			provider.setAuthorizePrintTicket(false);
//		}
		return iProviderService.update(provider);
	}
	
	@RequestMapping(value = "/deleteProvider", method = RequestMethod.GET)
	@ResponseBody
	public ServiceResponse<String> deleteProvider(String providerId){
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		if(user == null){
			return ServiceResponse.createByErrorMessage("用户未登录");
		}
		if(StringUtils.isBlank(providerId)){
			return ServiceResponse.createByErrorMessage("参数不完整");
		}
		//删除
		return iProviderService.deleteById(providerId);
	}
	
	@RequestMapping(value = "/deleteMultiProviders", method = RequestMethod.POST)
	@ResponseBody
	public ServiceResponse<String> deleteMultiProviders(String providerIds){
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		if(user == null){
			return ServiceResponse.createByErrorMessage("用户未登录");
		}
		if(StringUtils.isBlank(providerIds)){
			return ServiceResponse.createByErrorMessage("参数不完整");
		}
		String ids[] = providerIds.split(",");
		return iProviderService.removeMultiProviders(ids);
	}
	
}
