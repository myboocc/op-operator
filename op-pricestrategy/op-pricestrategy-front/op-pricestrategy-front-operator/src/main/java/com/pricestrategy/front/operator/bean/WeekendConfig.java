package com.pricestrategy.front.operator.bean;

import com.pricestrategy.front.operator.bean.enums.Day;

public class WeekendConfig {
	
	// 节日名
	private String name;
	
	// 月份
	private Integer month;
	
	// 星期序数
	private Integer number;
	
	// 星期几
	private Day week;
	
	// 后续持续天数
	private Integer afterDay;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Day getWeek() {
		return week;
	}

	public void setWeek(Day week) {
		this.week = week;
	}

	public Integer getAfterDay() {
		return afterDay;
	}

	public void setAfterDay(Integer afterDay) {
		this.afterDay = afterDay;
	}



}
