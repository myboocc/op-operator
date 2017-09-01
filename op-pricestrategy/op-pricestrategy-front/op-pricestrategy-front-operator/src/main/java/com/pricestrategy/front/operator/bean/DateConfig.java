package com.pricestrategy.front.operator.bean;

/**
 * 
 * 日期配置
 *
 */
public class DateConfig {

	// 节日名
	private String name;
	
	// 月份
	private Integer month;
	
	// 日期
	private Integer day;
	
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

	public Integer getDay() {
		return day;
	}

	public void setDay(Integer day) {
		this.day = day;
	}

	public Integer getAfterDay() {
		return afterDay;
	}

	public void setAfterDay(Integer afterDay) {
		this.afterDay = afterDay;
	}


	
}
