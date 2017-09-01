package com.pricestrategy.front.operator.bean.component;

import com.pricestrategy.front.operator.bean.enums.Day;
import com.pricestrategy.front.operator.utils.LogUtil;

public class WorkTime {
	private Hourline hourline;
	private Day day;
	
	public WorkTime() {}

	public WorkTime(Hourline hourline, Day day) {
		this.hourline = hourline;
		this.day = day;
	}
	
	public WorkTime(Hourline hourline, String day) {
		this.hourline = hourline;
		this.day = Day.valueOf(day);
	}

	public void check() {
		try {
			hourline.check();
		} catch (Exception e) {
			LogUtil.errorAndThrow("工作时间检查错误，Day：{}，{}", day, e.getMessage());
		}
	}

	public Day getDay() {
		return day;
	}

	public void setDay(Day day) {
		this.day = day;
	}

	public Hourline getHourline() {
		return hourline;
	}

	public void setHourline(Hourline hourline) {
		this.hourline = hourline;
	}

	@Override
	public String toString() {
		return String.format("WorkTime [hourline=%s, day=%s]", hourline, day);
	}
}
