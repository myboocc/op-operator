package com.operator.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.google.gson.Gson;
import com.operator.dao.PricingDao;
import com.operator.service.IPricingService;
import com.pricestrategy.front.operator.bean.CabinGroup;
import com.pricestrategy.front.operator.bean.Pricing;
import com.pricestrategy.front.operator.bean.TimeGroup;
import com.pricestrategy.front.operator.bean.WorkTimes;
import com.pricestrategy.front.operator.bean.component.Condition;
import com.pricestrategy.front.operator.bean.component.Hourline;
import com.pricestrategy.front.operator.bean.component.WorkTime;
import com.pricestrategy.front.operator.bean.enums.CommonSelect;
import com.pricestrategy.front.operator.bean.enums.Day;

@Service("iPricingService")
public class IPricingServiceImpl implements IPricingService{
	
	private static final Logger LOG = LoggerFactory.getLogger(IPricingServiceImpl.class);
	
	@Resource
	private PricingDao dao;

	@Override
	public void save(Pricing pricing, HttpServletRequest request) {
		pricing = convertRequestToPrincing(pricing, request);
		LOG.info("entern Pricing is :" + new Gson().toJson(pricing));
		dao.insert(pricing);
	}
	
	private Pricing convertRequestToPrincing(Pricing pricing, HttpServletRequest request) {
		// 政策标签
		pricing.setPricingLabelKey(str2list(pricing.getPricingLabelKey().get(0)));
		// 工作时间 处理
		pricing.setWorkTime(toWorkTime(request));
		// 航程信息， 出发机场，到达机场处理
		pricing.getRoute().setDepartAirportsInclude(str2list(pricing.getRoute().getDepartAirportsInclude().get(0)));
		pricing.getRoute().setDepartAirportsExclude(str2list(pricing.getRoute().getDepartAirportsExclude().get(0)));
		pricing.getRoute().setArriveAirportsInclude(str2list(pricing.getRoute().getArriveAirportsInclude().get(0)));
		pricing.getRoute().setArriveAirportsExclude(str2list(pricing.getRoute().getArriveAirportsExclude().get(0)));
		// FareBasis 去程航班号  回程航班号 中转点 处理 
		pricing.getRoute().setFareBasis(toCondition(pricing.getRoute().getFareBasis()));
		pricing.getRoute().setDepartFlightnos(toCondition(pricing.getRoute().getDepartFlightnos()));
		pricing.getRoute().setReturnFlightnos(toCondition(pricing.getRoute().getReturnFlightnos()));
		pricing.getRoute().setTransfer(toCondition(pricing.getRoute().getTransfer()));
		// 适用舱位
		splitCabins(pricing);
		return pricing;
	}
	public WorkTimes toWorkTime(HttpServletRequest r) {
		WorkTimes works = new WorkTimes();
		if (StringUtils.isBlank(r.getParameter("issueTktStr"))) {
			return null;
		}
		works.setIssueTktTimes(strToWorkTimes(r.getParameter("issueTktStr")));
		works.setInvaildTktTimes(strToWorkTimes(r.getParameter("invalidTktStr")));
		return works;
	}
	
	public List<WorkTime> strToWorkTimes(String s) {
		List<WorkTime> result = Lists.newArrayList();
		String[] arr = s.split("/");
		if (arr.length < 8) {
			return null;
		}
		for (int i = 0; i < 8; i++) {
			String[] times = arr[i].split("-");
			Hourline hourLine = new Hourline(
					Integer.parseInt(times[0].split(":")[0]) * 60 + Integer.parseInt(times[0].split(":")[1]),
					Integer.parseInt(times[1].split(":")[0]) * 60 + Integer.parseInt(times[1].split(":")[1]));
			Day day = null;
			if (i == 0) {
				day = Day.MON;
			} else if (i == 1) {
				day = Day.TUE;
			} else if (i == 2) {
				day = Day.WED;
			} else if (i == 3) {
				day = Day.THU;
			} else if (i == 4) {
				day = Day.FRI;
			} else if (i == 5) {
				day = Day.SAT;
			} else if (i == 6) {
				day = Day.SUN;
			} else if (i == 7) {
				day = Day.HOLIDAY;
			}
			WorkTime wortTime = new WorkTime(hourLine, day);
			result.add(wortTime);
		}
		return result;
	}
	
	public static Condition<String> toCondition(Condition<String> condition) {
		// 是否是fareBasis
		if(CommonSelect.ALL_TRIP_SAME.equals(condition.getFareBasisType())){
			return condition;
		}
		
		if (condition == null || condition.getList() == null) {
			if (condition.getList().size() == 0) {
				condition.setIncluded(true);
			}
			return condition;
		}
		List<String> result = new ArrayList<>();
		if (condition.getList() != null && condition.getList().size() > 0) {
			for (String e : condition.getList().get(0).trim().split("/")) {
				result.add(e);
			}
		}
		condition.setList(result);
		return condition;
	}
	
	public static void splitCabins(Pricing pricing) {
		for (TimeGroup timeGroup : pricing.getTimeGroups()) {
			for (CabinGroup cabinGroup : timeGroup.getCabinGroups()) {
				if (cabinGroup.getFitCabins() != null && cabinGroup.getFitCabins().size() > 0) {
					cabinGroup.setFitCabins(str2list(cabinGroup.getFitCabins().get(0)));
				}
			}
		}
	}
	
	public static List<String> str2list(String string) {
		if (StringUtils.isBlank(string)) {
			return null;
		}
		List<String> result = new ArrayList<>();
		for (String e : string.trim().split("/")) {
			result.add(e);
		}
		return result;
	}

}
