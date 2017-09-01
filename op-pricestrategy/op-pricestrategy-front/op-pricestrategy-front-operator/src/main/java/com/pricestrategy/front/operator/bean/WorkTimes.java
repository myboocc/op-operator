package com.pricestrategy.front.operator.bean;

import java.util.EnumSet;
import java.util.List;

import com.pricestrategy.front.operator.bean.component.WorkTime;
import com.pricestrategy.front.operator.bean.enums.Day;
import com.pricestrategy.front.operator.utils.LogUtil;

/**
 *	工作时间 
 *
 */
public class WorkTimes{
	private List<WorkTime> issueTktTimes;
	
	private List<WorkTime> invaildTktTimes;
	
	private List<WorkTime> refundTimes;
	
	private List<WorkTime> reschedueTimes;
	
	public WorkTimes() {}

	public WorkTimes(List<WorkTime> issueTktTimes,
			List<WorkTime> invaildTktTimes, List<WorkTime> refundTimes,
			List<WorkTime> reschedueTimes) {
		this.issueTktTimes = issueTktTimes;
		this.invaildTktTimes = invaildTktTimes;
		this.refundTimes = refundTimes;
		this.reschedueTimes = reschedueTimes;
	}

	public void check() {
		//&& checkTimes(refundTimes) && checkTimes(reschedueTimes)
		if(checkTimes(issueTktTimes) && checkTimes(invaildTktTimes)) {
			return;
		}
		LogUtil.errorAndThrow("工作时间未设置完整!");
	}
	
	//验证是否所有时间（周一至周日以及特殊节假日）均有对应工作时间设置
	private boolean checkTimes(List<WorkTime> worktime) {
		EnumSet<Day> temp = EnumSet.noneOf(Day.class);
		for(WorkTime time : worktime) {
			temp.add(time.getDay());
		}
		if(!temp.equals(Day.ALLDAYS)) {
			return false;
		}
		return true;
	}

	public List<WorkTime> getIssueTktTimes() {
		return issueTktTimes;
	}

	public void setIssueTktTimes(List<WorkTime> issueTktTimes) {
		this.issueTktTimes = issueTktTimes;
	}

	public List<WorkTime> getInvaildTktTimes() {
		return invaildTktTimes;
	}

	public void setInvaildTktTimes(List<WorkTime> invaildTktTimes) {
		this.invaildTktTimes = invaildTktTimes;
	}

	public List<WorkTime> getRefundTimes() {
		return refundTimes;
	}

	public void setRefundTimes(List<WorkTime> refundTimes) {
		this.refundTimes = refundTimes;
	}

	public List<WorkTime> getReschedueTimes() {
		return reschedueTimes;
	}

	public void setReschedueTimes(List<WorkTime> reschedueTimes) {
		this.reschedueTimes = reschedueTimes;
	}

	@Override
	public String toString() {
		return String.format("WorkTimes [issueTktTimes=%s, invaildTktTimes=%s, refundTimes=%s, reschedueTimes=%s]",
				issueTktTimes, invaildTktTimes, refundTimes, reschedueTimes);
	}

}
