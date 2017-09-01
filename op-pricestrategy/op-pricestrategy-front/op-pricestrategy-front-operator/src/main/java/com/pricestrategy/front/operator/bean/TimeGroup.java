package com.pricestrategy.front.operator.bean;

import java.util.List;
import java.util.Set;

import com.pricestrategy.front.operator.bean.component.Timeline;
import com.pricestrategy.front.operator.bean.enums.Day;
import com.pricestrategy.front.operator.bean.enums.DeadLineType;
import com.pricestrategy.front.operator.bean.enums.OverdueType;

/**
 * 时间组
 * @author 
 *
 */
public class TimeGroup {
	
	//开票有效期
	private Timeline printTktTime;
	
	//去程有效期
	private Timeline departTimes;
	
	//回程有效期截止 类型
	private DeadLineType deadLineType;
	//回程有效期截止
	private String deadLineTime;
	
	//去程适用班期
	private Set<Day> departureApplicableDays;
	//回程适用班期
	private Set<Day> returnApplicableDays;
	
	//回程超出截至有效期时
	private OverdueType backOverdueType;
	
	//舱位组
	private List<CabinGroup> cabinGroups;


	public Timeline getDepartTimes() {
		return departTimes;
	}

	public void setDepartTimes(Timeline departTimes) {
		this.departTimes = departTimes;
	}

	public Set<Day> getDepartureApplicableDays() {
		return departureApplicableDays;
	}

	public void setDepartureApplicableDays(Set<Day> departureApplicableDays) {
		this.departureApplicableDays = departureApplicableDays;
	}

	public Set<Day> getReturnApplicableDays() {
		return returnApplicableDays;
	}

	public void setReturnApplicableDays(Set<Day> returnApplicableDays) {
		this.returnApplicableDays = returnApplicableDays;
	}

	public OverdueType getBackOverdueType() {
		return backOverdueType;
	}

	public void setBackOverdueType(OverdueType backOverdueType) {
		this.backOverdueType = backOverdueType;
	}

	public List<CabinGroup> getCabinGroups() {
		return cabinGroups;
	}

	public void setCabinGroups(List<CabinGroup> cabinGroups) {
		this.cabinGroups = cabinGroups;
	}

	public Timeline getPrintTktTime() {
		return printTktTime;
	}

	public void setPrintTktTime(Timeline printTktTime) {
		this.printTktTime = printTktTime;
	}

	public DeadLineType getDeadLineType() {
		return deadLineType;
	}

	public void setDeadLineType(DeadLineType deadLineType) {
		this.deadLineType = deadLineType;
	}

	public String getDeadLineTime() {
		return deadLineTime;
	}

	public void setDeadLineTime(String deadLineTime) {
		this.deadLineTime = deadLineTime;
	}

	

}
