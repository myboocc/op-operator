package com.pricestrategy.front.operator.bean;


// 出票时间
public class ProviderWorkTime {
	
	//正常上班时间：周一、周二、周三、周四、周五上班时间
	private String workStartTime;
	private String workEndTime;
	
	//双休上班时间：周六、周日上班时间
	private String weekendsStartTime;
	private String weekendsEndTime;
	
	//法定假日时间：法定节假日上班时间
	private String legalStartTime;
	private String legalEndTime;
	
	public String getWorkStartTime() {
		return workStartTime;
	}
	public void setWorkStartTime(String workStartTime) {
		this.workStartTime = workStartTime;
	}
	public String getWorkEndTime() {
		return workEndTime;
	}
	public void setWorkEndTime(String workEndTime) {
		this.workEndTime = workEndTime;
	}
	public String getWeekendsStartTime() {
		return weekendsStartTime;
	}
	public void setWeekendsStartTime(String weekendsStartTime) {
		this.weekendsStartTime = weekendsStartTime;
	}
	public String getWeekendsEndTime() {
		return weekendsEndTime;
	}
	public void setWeekendsEndTime(String weekendsEndTime) {
		this.weekendsEndTime = weekendsEndTime;
	}
	public String getLegalStartTime() {
		return legalStartTime;
	}
	public void setLegalStartTime(String legalStartTime) {
		this.legalStartTime = legalStartTime;
	}
	public String getLegalEndTime() {
		return legalEndTime;
	}
	public void setLegalEndTime(String legalEndTime) {
		this.legalEndTime = legalEndTime;
	}

}
